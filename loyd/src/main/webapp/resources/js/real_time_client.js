function RealTimeClient (serverHost) {
    this.serverHost = serverHost
    this.serverUrl = null
    this.token = null
    this.socket = null
    // If the client is authenticated through real time connection or not
    this.authenticated = false
    this.loggedOut = false
    this.$bus = null // new Vue()
    this.subscribeQueue = {
        /* channel: [handler1, handler2] */
    }
    this.unsubscribeQueue = {
        /* channel: [handler1, handler2] */
    }
    // 동적으로 파일로드 => 소켓
    let script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js';
    document.body.appendChild(script)


    /* 초기화 => 토큰, 서버 url 발급 받은 정보를 기반으로 connect 수행 */
    this.init = async (serverUrl, token) => {
        console.log(serverUrl);
        console.log(token);
        if (this.authenticated) {
            console.warn('[RealTimeClient] WS connection already authenticated.')
            return
        }
        console.log('[RealTimeClient] Initializing')
        this.serverUrl = serverUrl
        this.token = token
        this.connect()
    }

    /* 상태를 비웁니다. & 소켓 close */
    this.logout = () => {
        console.log('[RealTimeClient] Logging out')
        this.subscribeQueue = {}
        this.unsubscribeQueue = {}
        this.authenticated = false
        this.loggedOut = true
        this.socket && this.socket.close()
    }
    /* 연결 & 기본적인 4자기 이벤트 handling */
    this.connect = () => {
        console.log('[RealTimeClient] Connecting to ' + this.serverUrl)
        this.socket = new SockJS(this.serverHost + this.serverUrl + '?ip =' + this.token)
        this.socket.onopen = () => {
            // Once the connection established, always set the client as authenticated
            this.authenticated = true
            this._onConnected()
        }
        this.socket.onmessage = (event) => {
            this._onMessageReceived(event)
        }
        this.socket.onerror = (error) => {
            this._onSocketError(error)
        }
        this.socket.onclose = (event) => {
            this._onClosed(event)
        }
    }
    /* 구독 */
    this.subscribe = (channel, handler) => {
        /* 연결이 불안정하면, 연결 큐에 정보를 keep => 이후 다시 요청 */
        if (!this._isConnected()) {
            this._addToSubscribeQueue(channel, handler)
            return
        }
        // 구독 액션을 보냅니다.
        const message = {
            action: 'subscribe',
            channel
        }
        this._send(message)
        this.$bus.$on(this._channelEvent(channel), handler)
        console.log('[RealTimeClient] Subscribed to channel ' + channel)
    }
    /* 구독 해제 */
    this.unsubscribe = (channel, handler) => {
        // Already logged out, no need to unsubscribe
        if (this.loggedOut) {
            return
        }

        if (!this._isConnected()) {
            this._addToUnsubscribeQueue(channel, handler)
            return
        }
        const message = {
            action: 'unsubscribe',
            channel
        }
        this._send(message)
        this.$bus.$off(this._channelEvent(channel), handler)
        console.log('[RealTimeClient] Unsubscribed from channel ' + channel)
    }
    this._isConnected = () => {
        return this.socket && this.socket.readyState === SockJS.OPEN
    }
    this._onConnected = () => {
        globalBus.$emit('RealTimeClient.connected')
        console.log('[RealTimeClient] Connected')

        // Handle subscribe and unsubscribe queue
        this._processQueues()
    }
    this._onMessageReceived = (event) => {
        const message = JSON.parse(event.data)
        console.log('[RealTimeClient] Received message', message)
        console.log(message);

        // 채널 메세지 인 경우 이벤트를 발생시킴
        console.log(message.channel);
        if (message.channel) {
            console.log('채널 메세지를 받음')
            this.$bus.$emit(this._channelEvent(message.channel), JSON.parse(message.payload))
        }
    }
    this._send = (message) => {
        this.socket.send(JSON.stringify(message))
    }
    this._onSocketError = (error) => {
        console.error('[RealTimeClient] Socket error', error)
    }
    this._onClosed = (event) => {
        console.log('[RealTimeClient] Received close event', event)
        if (this.loggedOut) {
            // Manually logged out, no need to reconnect
            console.log('[RealTimeClient] Logged out')
            globalBus.$emit('RealTimeClient.loggedOut')
        } else {
            // Temporarily disconnected, attempt reconnect
            console.log('[RealTimeClient] Disconnected')
            globalBus.$emit('RealTimeClient.disconnected')

            setTimeout(() => {
                console.log('[RealTimeClient] Reconnecting')
                globalBus.$emit('RealTimeClient.reconnecting')
                this.connect()
            }, 1000)
        }
    }
    this._channelEvent = (channel) => {
        return 'channel:' + channel
    }
    this._processQueues = () => {
        console.log('[RealTimeClient] Processing subscribe/unsubscribe queues')

        // Process subscribe queue
        const subscribeChannels = Object.keys(this.subscribeQueue)
        subscribeChannels.forEach(channel => {
            const handlers = this.subscribeQueue[channel]
            handlers.forEach(handler => {
                this.subscribe(channel, handler)
                this._removeFromQueue(this.subscribeQueue, channel, handler)
            })
        })

        // Process unsubscribe queue
        const unsubscribeChannels = Object.keys(this.unsubscribeQueue)
        unsubscribeChannels.forEach(channel => {
            const handlers = this.unsubscribeQueue[channel]
            handlers.forEach(handler => {
                this.unsubscribe(channel, handler)
                this._removeFromQueue(this.unsubscribeQueue, channel, handler)
            })
        })
    }
    this._addToSubscribeQueue = (channel, handler) => {
        console.log('[RealTimeClient] Adding channel subscribe to queue. Channel: ' + channel)
        // To make sure the unsubscribe won't be sent out to the server
        this._removeFromQueue(this.unsubscribeQueue, channel, handler)
        const handlers = this.subscribeQueue[channel]
        if (!handlers) {
            this.subscribeQueue[channel] = [handler]
        } else {
            handlers.push(handler)
        }
    }
    this._addToUnsubscribeQueue = (channel, handler) => {
        console.log('[RealTimeClient] Adding channel unsubscribe to queue. Channel: ' + channel)
        // To make sure the subscribe won't be sent out to the server
        this._removeFromQueue(this.subscribeQueue, channel, handler)
        const handlers = this.unsubscribeQueue[channel]
        if (!handlers) {
            this.unsubscribeQueue[channel] = [handler]
        } else {
            handlers.push(handlers)
        }
    }
    this._removeFromQueue = (queue, channel, handler) => {
        const handlers = queue[channel]
        if (handlers) {
            let index = handlers.indexOf(handler)
            if (index > -1) {
                handlers.splice(index, 1)
            }
        }
    }
}
