<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- #174. 웹채팅 jsp --%>

<meta charset="UTF-8">
<title>채팅</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/chatting/ChattingPageStyle.css">

</head>
<body>
	<section id="chattingSpace">
		<div class="wrap">
			<div class="chat ch1">
				<div class="icon">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="textbox">안녕하세요. 반갑습니다.</div>
			</div>
			<div class="chat ch2">
				<div class="icon">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
			</div>
			<div class="chat ch1">
				<div class="icon">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
			</div>
			<div class="chat ch2">
				<div class="icon">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서
					모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
			</div>
		</div>
	</section>
	<section id="textSpace">

		<button type="button" id="disconnect" onclick="closeSocket();">채팅방 나가기</button>
		메세지 입력 : <input type="text" id="sender"
			value="${sessionScope.id}" style="display: none;"> <input
			type="text" id="messageinput">
		<button type="button" onclick="send();">메세지 전송</button>
		<button type="button" onclick="javascript:clearText();">대화내용
			지우기</button>
		</div>
	</section>
	<!-- Server responses get written here -->
	<div id="messages"></div>
</body>
<!-- websocket javascript -->
        <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {

		openSocket();
	    console.log("문서가 준비되었습니다.");
	});
    
    var socket = new SockJS('/assetmanager/stomp-endpoint');
    var stompClient = Stomp.over(socket);

    var messages = document.getElementById("messages");

    //처음 소켓 연결
    function openSocket() {
        if (stompClient !== null && stompClient.connected) {
            writeResponse("WebSocket is already opened.");
            return;
        }
        // SockJS와 Stomp client 초기화
        var socket = new SockJS("/assetmanager/stomp-endpoint");
        stompClient = Stomp.over(socket);
		
        stompClient.connect({}, function(frame) {
            stompClient.subscribe('/topic/greetings', function(greeting) {
            	try {
            	showGreeting(JSON.parse(greeting.body).chatting_content);
            	}catch (error) {
                    console.error('Error handling message:', error);
                }
            });
        },
        function(error) { // 연결 실패 콜백
     }
        );
        console.log("연결종료");
    }


    //메세지 전송
    function send() {
        // 메시지 전송
        var chatting_content = document.getElementById("messageinput").value;
        stompClient.send("/app/hello", {}, JSON.stringify({ 'chatting_content': chatting_content }));  
    }

    //연결종료
    function closeSocket() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
  		window.location.href = '../websocket'
        console.log("Disconnected");
    }
	
    //메세지 보이기
    function showGreeting(message) {
        // 서버로부터 받은 메시지를 화면에 표시
        var messages = document.getElementById("messages");
//         console.log("메세지 전달된 내용 : " + message);
        messages.innerHTML += "<br/>" + message;
    }

  </script>
  
</html>