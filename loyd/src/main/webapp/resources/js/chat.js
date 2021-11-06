function Chat(api_host_url, ip) {
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
        return axios({
            method: 'get',
            url: api_host_url + '/channel/' + ip + '/chat?page=' + closer.page + '&size=' + closer.size
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
                    type: d.is_admin == true ? 'official' : 'personal',
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

    this.insertMessage = () => {
        let msgElement = document.querySelector('.message-input')

        if (msgElement.value == null || msgElement.value == '')
            return

        axios({
            method: 'post',
            url: api_host_url + '/channel/' + ip + '/chat',
            data: {
                creater: ip,
                content: msgElement.value,
                is_admin: 'N'
            }
        }).then((response) => {
            if (response.status != 200) {
                alert('관리자에게 메세지 전달이 되지 않았습니다. 조금 있다가 다시 시도해주세요')
                return;
            }

            msgElement.value = ''
            return
        });

        this.updateScrollbar();
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
    this.insertMessageByAdmin = () => {
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
                type: payload.is_admin == true ? 'official' : 'personal',
                text: payload.content,
                date: payload.create_at,
            })
        }

    }

    // 로드 시점에 맞춰 기본 데이터 세팅 & 이벤트 부착
    window.addEventListener("load", function(event) {

        // 스크롤 바 이벤트 부착
        let content = document.querySelector(".messages-content");

        content.addEventListener("scroll", event => {
            if (content.scrollTop == 0) {
                closer.page += 1
                closer.loadMessage()
            }
        });



        // 이벤트 부착
        let submitButton = document.querySelector('.message-submit')
        submitButton.addEventListener('click', closer.insertMessage)
        let messageInput = document.querySelector('.message-input')
        messageInput.addEventListener('keyup', closer.insertMessage)

        // 메세지 로드
        closer.loadMessage().then(d => {
            closer.updateScrollbar()
        })
    });
}





