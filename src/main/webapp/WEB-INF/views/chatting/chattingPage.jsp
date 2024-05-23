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
	<div id="modalOverlay" class="modal-overlay"></div>
	<header id="Freeze Panes">

		<img src="../resources/CSS/img/icon_exit.png" onclick="closeSocket()"
			style="position: absolute; width: 30px; height: 30px; top: 10px; left: 10px; cursor: pointer;"
			onclick="hideMemberList();"> <img
			src="../resources/CSS/img/icon_modify.png"
			onclick="modifyRoomInfo();"
			style="position: absolute; width: 30px; height: 30px; top: 10px; right: 10px; cursor: pointer; margin-right: 50px">
		<img src="../resources/CSS/img/icon_frend_add.png"
			onclick="memberAdd();"
			style="position: absolute; width: 30px; height: 30px; top: 10px; right: 10px; cursor: pointer;"
			onclick="hideMemberList();">


		<section id="room-info-space">
			<c:set var="firstRoomInfo" value="${roomInfo[0]}" />
			<h4>
				<span>${firstRoomInfo.room_title}</span>
			</h4>
			<span>대화방 참가자: </span>
			<c:forEach var="roomInfo" items="${roomInfo}" varStatus="status">

				<span>${roomInfo.member_username}</span>
				<c:if test="${!status.last}">, </c:if>
			</c:forEach>
			<input id="user-id" type="hidden" value="${username}"></input>
		</section>
	</header>
	<section id="chattingRoomInfo" class="modal" style="display: none;">
		<h4>방 정보 수정</h4>
		<form id="roomInfoForm">
			<label for="roomTitle">방 제목:</label> <input type="text"
				id="roomTitle" name="roomTitle" value="${firstRoomInfo.room_title}">
			<button type="button" class="infobutton" onclick="updateRoomTitle()">수정하기</button>
		</form>
		<img src="../resources/CSS/img/icon_clsoe.png"
			style="position: absolute; width: 10px; height: 10px; top: 10px; right: 10px; cursor: pointer;"
			onclick="hidemodifyRoomInfo();">
		<button type="button" class="infobutton"
			onclick="leaveRoom('${firstRoomInfo.room_id}', '${username}')">방
			나가기</button>
	</section>
	<section id="chattingSpace">
		<section id="messageHistorySpace">
			<c:forEach var="message" items="${messageList}">
				<section class="wrap">
					<div
						class="${message.chatting_member_id == username ? 'chat ch2' : 'chat ch1'}">
						<c:if test="${message.chatting_member_id != username}">
							<section class="icon">
								<img src="../resources/CSS/img/chatting_default.png"
									class="chat-icon" alt="Icon Description">
							</section>
							<section class="text-content">
								<section class="chatting-member-name">${message.chatting_member_name}</section>
								<section class="textbox">
									${message.chatting_content} <span class="time">${message.chatting_create_time}</span>
								</section>
							</section>
						</c:if>
						<c:if test="${message.chatting_member_id == username}">
							<section class="text-content">
								<section class="textbox">
									<span class="time">${message.chatting_create_time}</span>
									${message.chatting_content}
								</section>
							</section>
						</c:if>
					</div>
				</section>
			</c:forEach>
		</section>
		<section id="messages"></section>
	</section>

	<section id="textSpace">
		<textarea id="sender" style="display: none;"
			value="${sessionScope.id}"></textarea>
		<textarea id="messageinput" rows="4" cols="50"
			onkeyup="checkEnter(event)"></textarea>
		<button class="button" onclick="send();">
			<img src="../resources/CSS/img/icon_chatting_send.png"
				style="width: 40px; height: 40px;" alt="채팅 전송 이미지">
		</button>
	</section>

	<section id="memberList-backPage"
		style="display: none; position: absolute; margin: auto; background-color: white;">
		<h2>맴버 리스트</h2>
		<img src="../resources/CSS/img/icon_clsoe.png"
			style="position: absolute; width: 10px; height: 10px; top: 10px; right: 10px; cursor: pointer;"
			onclick="hideMemberList();">
		<div></div>
		<input type="text" id="searchInput" placeholder="멤버 검색..."
			onkeyup="filterMembers()" style="height: 25px;">
		<div id="memberContainer">
			<c:forEach var="memberlist" items="${memberlist}">
				<section class="memberList-Space">
					<img src="../resources/CSS/img/chatting_default.png" alt="채팅방 이미지">
					<div class="member-details">
						<div class="member-info">
							<input class="member_id" type="hidden" id="member_Id"
								name="memberId" value="${memberlist.member_id}"> <span>(${memberlist.member_department})
								${memberlist.member_username}</span>
						</div>
						<div class="member-info">
							<span>상태 : <span class="status-text"
								data-attendance="${member.member_attendance}"> <c:choose>
										<c:when test="${memberlist.member_attendance == 0}">퇴근</c:when>
										<c:when test="${memberlist.member_attendance == 1}">출근</c:when>
										<c:when test="${memberlist.member_attendance == 2}">회의</c:when>
										<c:when test="${memberlist.member_attendance == 3}">외근</c:when>
										<c:when test="${memberlist.member_attendance == 4}">휴가</c:when>
										<c:when test="${memberlist.member_attendance == 5}">병가</c:when>
										<c:otherwise>알 수 없음</c:otherwise>
									</c:choose>
							</span></span>
							<div
								class="status-icon status-<c:out value="${memberlist.member_attendance}"/>"></div>
						</div>
						<div class="member-info">
							<span>번호 : ${memberlist.member_phone_number}</span>
						</div>
					</div>
					<section class="button-space" style="margin-left: auto;">
						<!-- 						<button class="custom-button" onclick="invite_member({memberlist.member_id});"> -->
						<button class="custom-button"
							onclick="invite_member(${memberlist.member_id});">채팅방
							초대하기</button>
					</section>
				</section>
			</c:forEach>
		</div>
	</section>
</body>
<!-- websocket javascript -->
<script
	src="${pageContext.request.contextPath}/resources/JS/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	var roomId = extractRoomIdFromUrl(); // roomId를 전역 변수로 선언
	var stompClient = null; // stompClient를 초기에 null로 선언
	var username = "defaultUser";
	document.addEventListener("DOMContentLoaded", function() {
		openSocket();
		document.getElementById("messageinput").focus();
		scrollToBottom();

	});

	// URL에서 room_id 추출
	function extractRoomIdFromUrl() {
		var pathArray = window.location.pathname.split('/');
		var roomId = pathArray[pathArray.length - 1];
		return parseInt(roomId, 10); // 문자열을 숫자로 변환
	}

	// 소켓 연결 시작
	function openSocket(roomId) {
		var roomId = extractRoomIdFromUrl(); // roomId를 추출
		// 		var socket = new SockJS('/assetmanager/stomp-endpoint?auth_token=' + encodeURIComponent(token));
		var socket = new SockJS('/assetmanager/stomp-endpoint'); // 고정된 엔드포인트 사용

		var token = localStorage.getItem('auth_token'); // JWT 토큰 가져오기
		console.log("토큰값 : " + token);
		// 	    socket.send(JSON.stringify({ token: "your_jwt_token_here" }));

		var headers = {
			'Authorization' : 'Bearer ' + token
		};

		stompClient = Stomp.over(socket);

		// 		stompClient.connect({'Authorization': 'Bearer ' + token},function(frame) {
		stompClient.connect(headers, function(frame) {
			// 		stompClient.connect(function(frame) {
			// 			console.log("Connectedㄴ: " + frame);

			// roomId를 사용해 구독 경로 설정
			var subscriptionUrl = '/topic/rooms/' + roomId;

			// 구독 시작
			stompClient.subscribe(subscriptionUrl, function(message) {
				// 				showGreeting(JSON.parse(message.body).chatting_content,JSON.parse(message.body).chatting_member_name);
				showGreeting(JSON.parse(message.body));
				console.log("메세지 보낸사람은 ! : "
						+ JSON.parse(message.body).chatting_member_name);
				scrollToBottom();
			});
		}, function(error) {
			console.log("Connection failed: " + error);
		});
	}

	function send() {
		var messageInput = document.getElementById("messageinput");
		var chatting_content = messageInput.value.trim();
		if (chatting_content !== "") {
			stompClient.send("/app/rooms/" + roomId + "/sendMessage", {}, JSON
					.stringify({
						'chatting_content' : chatting_content
					}));
			messageInput.value = "";
			scrollToBottom();
		} else {
			alert("메세지를 입력해주세요");
		}
	}
	function checkEnter(event) {
	    if (event.key === 'Enter') {
        event.preventDefault(); // 엔터 키로 인한 줄바꿈 방지
        send();

	    }
	}
	//연결종료
	function closeSocket() {
		if (stompClient !== null) {
			stompClient.disconnect();
		}
		window.location.href = '../chattingHomePage'
		console.log("Disconnected");
	}

	//메세지 보이기
	function showGreeting(message) {
		// 서버로부터 받은 메시지를 화면에 표시
		var messages = document.getElementById("messages");
		var formattedMessage = message.chatting_content.replace(/\n/g, "<br>"); // 메시지 내용 줄바꿈 처리
		var userIdInput = document.getElementById("user-id");
		var userId = userIdInput.value; // input 요소의 value 속성에서 사용자 ID 가져오기
		var senderId = message.chatting_member_id;
		senderId = senderId.toString();
		var isOwnMessage = senderId === userId; // 메시지의 senderId가 현재 사용자의 ID와 동일한지 비교

		var messageClass = isOwnMessage ? 'ch2' : 'ch1'; // 현재 사용자가 보낸 메시지이면 'ch2', 아니면 'ch1'	
		var section = document.createElement("section");
		section.id = "chattingbox"
		console.log("messageClass:" + messageClass);
		var span = document.createElement("span");
		if (messageClass === 'ch1') { // 다른 사람의 메시지
			span.innerHTML = '<div class="wrap">'
					+ '<div class="chat ' + messageClass + '">'
					+ '<div class="icon">'
					+ '<img src="../resources/CSS/img/chatting_default.png" class="chat-icon" alt="Icon Description">'
					+ '</div>' + '<div class="text-content">'
					+ '<div class="chatting-member-name">'
					+ message.chatting_member_name + '</div>'
					+ '<div class="textbox">' + formattedMessage
					+ ' <span class="time">' + getCurrentTime() + '</span>'
					+ '</div>' + '</div>' + '</div>' + '</div>';
		} else { // 자신의 메시지
			span.innerHTML = '<div class="wrap">'
					+ '<div class="chat ' + messageClass + '">'
					+ '<div class="text-content">' + '<div class="textbox">'
					+ '<span class="time">' + getCurrentTime() + '</span> '
					+ formattedMessage + '</div>' + '</div>' + '</div>'
					+ '</div>';
		}
		var messages = document.getElementById("messages");
		messages.appendChild(span);
	}

	function getCurrentTime() {
		var now = new Date();
		var hours = now.getHours().toString().padStart(2, '0');
		var minutes = now.getMinutes().toString().padStart(2, '0');
		return hours + ":" + minutes;
	}
	function getCookie(name) {
		var value = "; " + document.cookie;
		var parts = value.split("; " + name + "=");
		if (parts.length == 2)
			return parts.pop().split(";").shift();
	}

	function scrollToBottom() {
		var messageContainer = document.getElementById('chattingSpace');
		messageContainer.scrollTop = messageContainer.scrollHeight;
	}

	//맴버초대 관련 함수 
	function filterMembers() {
		const input = document.getElementById('searchInput');
		const filter = input.value.toUpperCase();
		const memberContainer = document.getElementById('memberContainer');
		const members = memberContainer
				.getElementsByClassName('memberList-Space');
		let visibleCount = 0;

		for (let i = 0; i < members.length; i++) {
			const memberInfo = members[i].getElementsByClassName('member-info')[0];
			const textValue = memberInfo.textContent || memberInfo.innerText;

			if (textValue.toUpperCase().indexOf(filter) > -1
					&& visibleCount < 6) {
				members[i].style.display = "";
				visibleCount++;
			} else {
				members[i].style.display = "none";
			}
		}
	}
	function memberAdd() {
		document.getElementById("memberList-backPage").style.display = "block"; // 섹션을 보이게 설정
        document.getElementById('modalOverlay').style.display = 'block';

	}
	
	function hideMemberList() {
		document.getElementById("memberList-backPage").style.display = "none"; // 섹션을 숨김
        document.getElementById('modalOverlay').style.display = 'none';

	}

	 function invite_member(memberId) {
	        var roomId = extractRoomIdFromUrl();
	        
	        $.ajax({
	            url: '/assetmanager/addChattingRoomMember',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify({ chatting_room_id: roomId, memberIds 	: memberId}),
	            success: function(response) {
	            	hideMemberList();
	                alert("새로운 맴버가 추가되었습니다.");
	                window.location.reload();
	            },
	            
	            error: function(xhr, status, error) {
	                console.error("초대 실패:", status, error);
	                alert("멤버 초대에 실패했습니다.");
	            }
	        });
	    }
	 function modifyRoomInfo() {
         document.getElementById('chattingRoomInfo').style.display = 'block';
         document.getElementById('modalOverlay').style.display = 'block';

	 }
	 
	 function hidemodifyRoomInfo() {
         document.getElementById('chattingRoomInfo').style.display = 'none';
         document.getElementById('modalOverlay').style.display = 'none';

	 }
	 function updateRoomTitle() {
		var roomTitle = document.getElementById('roomTitle').value;
		console.log(roomTitle);
		console.log(roomId);
		fetch('../UpdateChattingRoomInfo', {
			method: 'POST',
			headers: {
                'Content-Type': 'application/json',
			},
            body: JSON.stringify({ roomTitle: roomTitle,roomId: roomId}),
		})
		.then(response => {
        	if (response.ok) {
                window.location.reload();
        	}
         else {
            alert('이름 변경에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('이름 변경에 실패했습니다:', error);
        alert('이름 변경에 실패했습니다.');
    });
	}
	 
	 function leaveRoom(roomId, memberId) {
		    if (confirm('정말로 방에서 나가시겠습니까?')) {
		        // 방 나가기 요청을 서버로 보냄

		        fetch('../exitRoom', {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/json',
		            },
	            body: JSON.stringify({ memberId: memberId,roomId: roomId  }),

		        })
		        .then(response => {
		            	if (response.ok) {
		                window.location.href = '/assetmanager/chattingHomePage';
		            } else {
		                alert('방 나가기에 실패했습니다.');
		            }
		        })
		        .catch(error => {
		            console.error('방 나가기에 실패했습니다:', error);
		            alert('방 나가기에 실패했습니다.');
		        });
		    }
		}
	 
	 
</script>

</html>