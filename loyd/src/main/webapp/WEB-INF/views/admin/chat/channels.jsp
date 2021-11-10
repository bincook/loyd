<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>어드민 대시보드 페이지</title>

    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- 부트 스트랩 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
    <!-- 채팅 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/chat.css" />">
    <!-- 소켓 -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <!-- ajax 요청을 위한 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="<c:url value ="/" />resources/js/chat.js"></script>
    <script src="<c:url value ="/" />resources/js/real_time_client.js"></script>

    <script>

    </script>

    <!-- ajax 요청을 위한 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        // 이 소스는 참고하지 마세요 -_- jsp 에서 자바스크립트로 해결하는 건 그닥 좋은 방법은 아닌것 같아요
        let page = 0;
        let size = 10;
        let total = 0;
        let isNext = false;
        let isPrev = false;
        let data = []
        let channel_html = `<tr class = "channel"><td><a href="javascript:void(0)" onclick="openChannel(:channel_id, ':channel_name')">:channel_name</a></td><td>:status</td></tr>`;
        let prevButton_html = '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page -= 1; getPageData()">Previous</a></li>'
        let nextButton_html = '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page += 1; getPageData()">Next</a></li>'
        let numberButton_html = '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page = :page; getPageData()">:number</a></li>'
        let websocket = null
        let chat = null
        let last_subscribe_channel = null

        function getPageData() {
            axios({
                method: 'get',
                url: '<c:url value ="/" />channel?page=' + page + '&size=' + size
            }).then(response => {
                console.log(response)
                data = []
                response.data.content.forEach(d => {
                    data.push({
                        channel_id: d.channel_id,
                        channel_name: d.channel_name,
                        create_at: d.create_at,
                        closed_at: d.closed_at,
                        isClosed: d.closed_at != null
                    })
                })
                total = response.data.total
                isNext = response.data.next
                isPrev = response.data.prev

                render();
            })
        }

        function render() {
            let contents = document.getElementById('channels')
            let pagination = document.getElementById('page')
            contents.innerHTML = ''
            pagination.innerHTML = ''


            data.forEach(d => {
                let status = '';
                if (d.isClosed)
                    status = '상담 완료';
                else
                    status = '<a href="javascript:void(0)" onclick="closeChannel(this, ' + d.channel_id + ')">상담 종료하기</a>';

                contents.innerHTML += channel_html.replace(':channel_id', d.channel_id).replaceAll(':channel_name', d.channel_name).replace(':status', status);
            })

            let text = ''
            let total_button = Math.ceil(total / size)
            let start = Math.floor(page / size) * size + 1
            let end = (Math.floor(page / size) + 1) * size

            console.log(total_button, page, total, size, start, end)
            if (isPrev)
                text += prevButton_html
            for (let i=start; i<=total_button && i <= end; i++) {
                text += numberButton_html.replaceAll(':number', String(i)).replaceAll(':page', String(i - 1))
            }
            if (isNext)
                text += nextButton_html

            pagination.innerHTML = text
        }

        function openChannel(channelId, channelName) {
            let chat_container = document.querySelector('.chat')
            if (!chat_container.classList.contains('open')) chat_container.classList.add('open')
            let client_ipaddress = channelName.split("/")[channelName.split("/").length - 1]
            let chat_server_host = '<c:url value ="/" />'
            let chat_connection_request_url = 'socket/connect/url'
            let chat_connection = 'websocket/endpoint'
            let channel_info = 'channel/id/'

            if (chat != null) {
                chat.removeAllEventListeners()
                chat.clearAll()
            }

            if (websocket != null) {
                websocket.unsubscribe(last_subscribe_channel)
            }


            $.get(
                chat_server_host + channel_info + channelId,
                {},
                function (channelInfo, status) {
                    if (channelInfo.closed_at == null) {
                        // 소켓 연결 주소 get
                        $.get(
                            chat_server_host + chat_connection_request_url + '?ip=' + client_ipaddress,
                            {},
                            function (socketInfo, status) {
                                if (status == 'success') {
                                    chat = new Chat(chat_server_host, channelId, true)

                                    last_subscribe_channel = channelName
                                    // 웹 소켓 연결
                                    websocket = new RealTimeClient(chat_server_host, chat);
                                    websocket.init(chat_connection, socketInfo.realTimeToken)
                                    websocket.subscribe(channelName)

                                    chat.addEventListeners()
                                    chat.init()
                                }
                            }
                        );
                    }
                }
            )
        }

        function closeChannel(node, channelId) {
            let next = confirm('정말로 종료 하시겠습니까?')

            if (next) {
                axios({
                    method: 'post',
                    url: '<c:url value ="/" />channel/close/id/' + channelId,
                    data: {}
                }).then(response => {
                    node.parentNode.innerText = '상담 완료'
                })
            }
        }

        // 로드 시점에 맞춰 기본 데이터 세팅
        $(document).ready(
            function() {
                getPageData()
            }
        )

    </script>
</head>
<body>
	<div class="container">
        <div class="contents pt-5">
            <div class="row">
                <div class="col-md-6">
                    <table style="margin:auto" class="table-sm">
                        <thead>
                        <th>채널명</th>
                        <th>채널 상태</th>
                        </thead>
                        <tbody id="channels">

                        </tbody>
                    </table>
                    <div class="page mt-3">
                        <!-- 페이지 영역 -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center" id="page">
                            </ul>
                        </nav>

                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <!-- 채팅 -->
                    <div class="chat-container">
                        <div class="chat" style="position: inherit; margin: auto;">
                            <div class="chat-title">
                                <h1>Fabio Ottaviani</h1>
                                <h2>Supah</h2>
                                <figure class="avatar">
                                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure>
                            </div>
                            <div class="messages">
                                <div class="messages-content"></div>
                            </div>
                            <div class="message-box">
                                <div style="text-align: left" contenteditable="true" data-content-editable-leaf="true" type="text" class="message-input" placeholder="Type message..."></div>
                                <button type="submit" class="message-submit">Send</button>
                            </div>
                            <div class="bg"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

