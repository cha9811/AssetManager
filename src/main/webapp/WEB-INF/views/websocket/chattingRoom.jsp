<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../header.jsp"%>

  <html lang="en">
<head>
  <meta charset="UTF-8">
  <title>WebSocket Chatting</title>
  </head>
<body>
    <div>
        <button type="button" id="disconnect" onclick="closeSocket();">X</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
    </div>
    <div id="messages">
    </div>
    <!-- websocket javascript -->
        <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script type="text/javascript">

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
            setConnected(true);
            console.log('Connected: ' + frame);
            // 서버에서 메시지를 받을 때 호출될 콜백 함수를 구독 설정
            stompClient.subscribe('/topic/greetings', function(greeting) {
            	try {
                console.log('리리리리리리Received: ', JSON.parse(greeting.body).content);
            	showGreeting(JSON.parse(greeting.body).content);
            	}catch (error) {
                    console.error('Error handling message:', error);
                }
            });
        },
        function(error) { // 연결 실패 콜백
         console.log('연결 안됨: ' + error);
     }
        );
        console.log("연결프로세스종료");
    }

    //연결유지
    function setConnected(connected) {
        // 연결 상태에 따라 UI 변경
        document.getElementById("connect").disabled = connected;
        document.getElementById("disconnect").disabled = !connected;
        if (connected) {
            messages.style.display = "";
        } else {
            messages.style.display = "none";
        }
    }

    //메세지 전송
    function send() {
        // 메시지 전송
        var name = document.getElementById("messageinput").value;
        stompClient.send("/app/hello", {}, JSON.stringify({ 'name': name }));  
    }

    //연결종료
    function closeSocket() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        setConnected(false);
        console.log("Disconnected");
    }
	
    //메세지 보이기
    function showGreeting(message) {
        // 서버로부터 받은 메시지를 화면에 표시
        var messages = document.getElementById("messages");
        console.log("메세지 전달 : " + message);
        messages.innerHTML += "<br/>" + message;
    }

    //초기화
    function clearText() {
        // 메시지 내역을 클리어
        var messages = document.getElementById("messages");
        messages.innerHTML = "";
    }
  </script>
</body>
</html>
