function Chat(api_host_url, id, isAdmin) {
    // 채팅 창에 그려질 html 들입니다.
    this.form = {
        clientMessageForm: '<div class="message message-personal">:message</div>',
        clientNewMessageForm: '<div class="message message-personal new">:message</div>',
        adminNewMessageForm: '<div class="message new"><figure class="avatar"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure>:message</div>',
        adminLoadingMessageForm: '<div class="message loading new"><figure class="avatar"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure><span></span></div>',
        dateForm: '<div class="timestamp">:date</div>'
    }

    this.page = 0
    this.size = 10

    // 여기에 데이터를 넣으면 자동으로 랜더링 됩니다.
    /*
    messages.pushMessages(
        {
            type: 'official' or 'personal',
            text: '초기 데이터 입니다1',
            date: '2021-10-31T10:10:00'
        }
    )
    */
    let closer = this
    let messages = {
        data: [],
        get: function (index) {
            return this.data[index]
        },
        getAll: function () {
            return this.data
        },
        getLast: function () {
          if (this.data.length < 1)
              return null;

          return this.data[this.data.length - 1];
        },
        getLastBefore: function () {
            if (this.data.length < 2)
                return null;

            return this.data[this.data.length - 2];
        },
        push: function(message) {
            this.data.push(message)
            closer.render(message)
        },
        length: function () {
            return this.data.length
        },
        clear: function () {
            this.data = []
        }
    }

    // 스크롤바 맨 아래로
    this.updateScrollbar = () => {
        // 스크롤바 이벤트 달기
        let content = document.querySelector(".messages-content");
        content.scrollTop = content.scrollHeight;
    }

    // 마지막 데이터 날짜와 비교해서 달라진 경우 날짜 랜더링
    this.renderDate = () => {

        let last = messages.length() > 0 ? new Date(Date.parse(messages.getLast().date)) : null
        let lastBefore = messages.length() > 1 ? new Date(Date.parse(messages.getLastBefore().date)) : null

        // 날짜가 변경 된 경우만
        if (!this.sameDate(last, lastBefore)) {
            let dateText = last.getHours() + ':' + last.getMinutes();
            let form = this.form.dateForm.replace(':date', dateText)
            document.querySelector('.message:last-child').innerHTML += form
        }
    }

    // 같은 날짜인지 판별
    this.sameDate = (date1, date2) => {

        if (date1 === null)
            return false
        if (date2 === null)
            return false
        if (date1.getFullYear() != date2.getFullYear())
            return false
        if (date1.getMonth() != date2.getMonth())
            return false
        if (date1.getDate() != date2.getDate())
            return false
        if (date1.getHours() != date2.getHours())
            return false
        if (date1.getMinutes() != date2.getMinutes())
            return false
        return true
    }

    this.loadMessage = async () => {
        // 유저는 채널로 정보를 불러움
        if (!isAdmin) {
            return axios({
                method: 'get',
                url: api_host_url + 'channel/' + id + '/chat?page=' + closer.page + '&size=' + closer.size
            }).then((response) => {

                console.log(response);

                if (response.data.length == 0)
                    return

                let old_data = messages.getAll()
                response.data.reverse()
                console.log(old_data)

                closer.clearAll()
                // 반대로 데이터 삽입
                response.data.forEach(d => {
                    messages.push({
                        type: d.is_admin == 'Y' ? 'official' : 'personal',
                        text: d.content,
                        date: d.create_at
                    })
                })
                old_data.forEach(d => {
                    messages.push({
                        type: d.type,
                        text: d.text,
                        date: d.date
                    })
                })
            })
        // 어드민은 id로 값을 불러옴
        } else {
            return axios({
                method: 'get',
                url: api_host_url + 'channel/id/' + id + '/chat?page=' + closer.page + '&size=' + closer.size
            }).then(response => {

                console.log(response);

                if (response.data.length == 0)
                    return

                let old_data = messages.getAll()
                response.data.reverse()
                console.log(old_data)

                closer.clearAll()
                // 반대로 데이터 삽입
                response.data.forEach(d => {
                    messages.push({
                        type: d.is_admin == 'Y' ? 'official' : 'personal',
                        text: d.content,
                        date: d.create_at
                    })
                })
                old_data.forEach(d => {
                    messages.push({
                        type: d.type,
                        text: d.text,
                        date: d.date
                    })
                })
            })
        }
    }

    this.insertMessage = () => {
        let msgElement = document.querySelector('.message-input')

        if (msgElement.innerHTML == null || msgElement.innerHTML == '')
            return

        if (!isAdmin) {
            axios({
                method: 'post',
                url: api_host_url + 'channel/' + id + '/chat',
                data: {
                    creater: id,
                    content: msgElement.innerHTML,
                    is_admin: 'N'
                }
            }).then((response) => {
                msgElement.innerHTML = ''
                this.updateScrollbar();
                return
            }).catch(error => {
                console.log(error)
                if (error.response.status == 409) {
                    alert('이미 종료된 채널 입니다.')
                    return;
                }

                alert('관리자에게 메세지 전달이 되지 않았습니다. 조금 있다가 다시 시도해주세요')
            });
        } else {
            axios({
                method: 'post',
                url: api_host_url + 'channel/id/' + id + '/chat',
                data: {
                    creater: id,
                    content: msgElement.innerHTML,
                    is_admin: 'Y'
                }
            }).then((response) => {
                msgElement.innerHTML = ''
                this.updateScrollbar();
                return
            }).catch(error => {
                console.log(error)
                if (error.response.status ==    409) {
                    alert('이미 종료된 채널 입니다.')
                    return;
                }

                alert('사용자에게 메세지 전달이 되지 않았습니다. 조금 있다가 다시 시도해주세요')
            });
        }
    }

    // 방금 들어온 데이터를 채팅 창에 그립니다.
    this.render = (message) => {
        if (message.text.trim() == '')
            return false;

        let form = null;
        if (message.type == 'personal')
            form = this.form.clientMessageForm.replace(':message', message.text)
        else
            form = this.form.adminNewMessageForm.replace(':message', message.text)

        let messageContainer = document.querySelector('.messages-content')
        messageContainer.innerHTML += form
        messageContainer.classList.add('new')
        this.renderDate();
    }

    this.clearAll = () => {
        messages.clear()
        let messageContainer = document.querySelector('.messages-content')
        messageContainer.innerHTML = ''
    }

    // 임시 데이터를 삽입합니다.
    this.fakeMessage = () => {
        let messageContainer = document.querySelector('.messages-content')
        messageContainer.innerHTML += this.form.adminLoadingMessageForm
        this.updateScrollbar();

        setTimeout(() => {
            console.log(document.querySelector('.message.loading'))

            messageContainer.removeChild(document.querySelector('.message.loading'))

            messages.push({
                type: 'official',
                text: 'Hi there, I\'m Fabio and you?',
                date: new Date().toISOString()
            })
            this.updateScrollbar();
        }, 1000 + (Math.random() * 20) * 100);
    }

    // 외부에서 이벤트가 발생했을 때, 채팅 창으로 이벤트를 전달해주기 위한 property 입니다.
    // 구독 완료시
    this.$on = (channel, handler) => {
        console.log('subscribe event')
    }

    // 구독 해제시
    this.$off = (channel, handler) => {
        console.log('unsubscribe event')
    }

    // 채널 메세지를 받았을 때
    this.$emit = (channel, doing, payload) => {
        console.log(doing, payload)
        if (doing == "CREATE") {
            messages.push({
                type: payload.is_admin == 'Y' ? 'official' : 'personal',
                text: payload.content,
                date: payload.create_at,
            })
            closer.updateScrollbar()
        }

        if (doing == "CLOSE") {
            messages.push({
                type: payload.is_admin == 'Y' ? 'official' : 'personal',
                text: payload.content,
                date: payload.create_at,
            })
            closer.updateScrollbar()
            alert('관리자에 의해 상담이 종료 되었습니다!')

            closer.removeAllEventListeners()

            if (!isAdmin) {
                closer.closeChat()
            }
        }
    }

    this.closeChat = () => {
        let chat = document.querySelector(".chat-container .chat")
        chat.classList.remove('open')
    }

    // 이벤트 부착
    this.addEventListeners = () => {
        // 스크롤 바 이벤트 부착
        let content = document.querySelector(".messages-content");

        content.addEventListener("scroll", event => {
            if (content.scrollTop == 0) {
                closer.page += 1
                closer.loadMessage(false)
            }
        });

        let opener = document.querySelector('.open-button')

        if (opener != null) {
            opener.addEventListener('click', event => {
                let chat = document.querySelector(".chat-container .chat")

                if (chat.classList.contains('open')) {
                    chat.classList.remove('open')
                    opener.classList.remove('side')
                } else {
                    chat.classList.add('open')
                    opener.classList.add('side')
                }
            })
        }

        // 이벤트 부착
        let submitButton = document.querySelector('.message-submit')
        submitButton.addEventListener('click', closer.insertMessage)
        let messageInput = document.querySelector('.message-input')
        messageInput.addEventListener('keypress', event => {
            let key = event.key || event.keyCode
            if ((key === 'Enter' || key === 13) && event.shiftKey === false) {
                event.preventDefault();
                closer.insertMessage()
                closer.updateScrollbar()
                messageInput.innerText = ''
            }
        })
        messageInput.addEventListener('paste', event => {
            let obj = (event.clipboardData || window.clipboardData)
            console.log('typpe-> ' ,obj.items[0].type)
            let paste = obj.getData('text');
            console.log(obj)
            const selection = window.getSelection();
            if (!selection.rangeCount) return false;
            selection.deleteFromDocument();

            // selection.getRangeAt(0).insertNode(document.createTextNode( paste ));
            // e.preventDefault()
        });

        var ctrlDown = false,
            ctrlKey = 17,
            cmdKey = 91,
            vKey = 86,
            cKey = 67,
            eKey = 13;

        // $(messageInput)
        // .keyup(function(e) {
        //     let target = e.target
        //     if (target.innerText.match("@")) {
        //
        //         navigator.clipboard.readText().then(data => {
        //             if (!data.match(/png|jpg|jpeg/)) {
        //                 target.innerHTML = target.innerHTML.replace('@', '')
        //                 return alert('올바르지 않은 주소입니다')
        //             }
        //             target.innerHTML = target.innerHTML.replace('@', '<p class="mt-3">""<img width="259" height="194" src="' + data + '"/></p>')
        //             // $('#btn').click()
        //         })
        //     }
        // });


        // $(messageInput)
        // .keydown(function(e) {
        //     if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = true;
        // }).keyup(function(e) {
        //     if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = false;
        // });
        //
        // $(messageInput).keydown(function(e) {
        //     if (ctrlDown && (e.keyCode == vKey || e.keyCode == cKey)) return false;
        // });
        //
        // // Document Ctrl + C/V
        // $(messageInput).keydown(function(e) {
        //     if (ctrlDown && (e.keyCode == cKey)) console.log("Document catch Ctrl+C");
        //     if (ctrlDown && (e.keyCode == vKey))    console.log("Document catch Ctrl+V");
        // });
    }

    // 이벤트 제거
    this.removeAllEventListeners = () => {
        let content = document.querySelector(".messages-content");
        let opener = document.querySelector('.open-button')
        let submitButton = document.querySelector('.message-submit')
        let messageInput = document.querySelector('.message-input')

        if (content != null) content.replaceWith(content.cloneNode(true))
        if (opener != null) opener.replaceWith(opener.cloneNode(true))
        if (submitButton != null) submitButton.replaceWith(submitButton.cloneNode(true))
        if (messageInput != null)  messageInput.replaceWith(messageInput.cloneNode(true))
    }

    // 초기 데이터 세팅
    this.init = () => {
        // 메세지 로드
        closer.loadMessage().then(d => {
            closer.updateScrollbar()
        })
    }
}





