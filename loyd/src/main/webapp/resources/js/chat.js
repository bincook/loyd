function Chat() {
    // 채팅 창에 그려질 html 들입니다.
    this.form = {
        clientMessageForm: '<div class="message message-personal">:message</div>',
        clientNewMessageForm: '<div class="message message-personal new">:message</div>',
        adminNewMessageForm: '<div class="message new"><figure class="avatar"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure>:message</div>',
        adminLoadingMessageForm: '<div class="message loading new"><figure class="avatar"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure><span></span></div>',
        dateForm: '<div class="timestamp">:date</div>'
    }

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
        }
    }

    // 스크롤바 맨 아래로
    this.updateScrollbar = () => {
        // 스크롤바 이벤트 달기
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

    this.insertMessage = () => {
        let msgElement = document.querySelector('.message-input')
        messages.push({
            type: 'personal',
            text: msgElement.value,
            date: new Date().toISOString()
        })
        msgElement.value = ''
        this.updateScrollbar();
        setTimeout(() => {
            this.fakeMessage();
        }, 1000 + (Math.random() * 20) * 100);
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
    this.$on = (key, event) => {

    }

    this.$off = (key, event) => {

    }

    this.$emit = (key, event) => {

    }

    // 로드 시점에 맞춰 기본 데이터 세팅 & 이벤트 부착
    window.addEventListener("load", function(event) {
        // 이벤트 부착
        let submitButton = document.querySelector('.message-submit')
        submitButton.addEventListener('click', closer.insertMessage)

        // 데이터 세팅
        let temp = [
            {
                type: 'personal',
                text: '초기 데이터 입니다1',
                date: '2021-10-31T10:10:00'
            },
            {
                type: 'official',
                text: '초기 데이터 입니다2',
                date: '2021-10-31T10:10:00'
            },
            {
                type: 'personal',
                text: '초기 데이터 입니다3',
                date: '2021-10-31T10:11:00'
            }
        ]
        temp.forEach(m => {
            messages.push(m)
        })
    });
}





