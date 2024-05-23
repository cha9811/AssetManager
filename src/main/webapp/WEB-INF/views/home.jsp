<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/home/HomeStyle.css">

</head>
<link  rel="icon"  href="data:;base64,iVBORw0KGgo=">

<%@ include file="header.jsp"%>
<style>
.rounded-box img {
	margin-right: 10px; /* 이미지와 텍스트 사이의 간격 */
	width: 50px; /* 이미지의 너비 */
	height: auto; /* 이미지의 높이는 자동으로 조절 */
}

.blink {
	animation: blink 1s infinite; /* 애니메이션 적용 */
}

/* 애니메이션 정의 */
@
keyframes blink { 0% {
	filter: invert(0%); /* 원래 색상 (검정) */
}
50
%
{
filter
:
invert(
100%
); /* 반전 색상 (흰색) */
}
100
%
{
filter
:
invert(
0%
); /* 원래 색상 (검정) */
}
}
</style>
<body>
	<div class="main-container">

		<section id="Member-Info-BackPage">

			<section id="Member-Info-Space" class="member-card">
				<div class="icon">
					<img src="./resources/CSS/img/chatting_default.png"
						class="chat-icon" alt="Icon Description">
				</div>
				<div class="member-detail">
					<strong>이름:</strong> ${memberInfo.member_username}
				</div>

				<div class="member-detail">
					<strong>부서:</strong> ${memberInfo.member_department}
				</div>
				<div class="member-detail">
					<strong>근무층:</strong> ${memberInfo.member_local}
				</div>
				<div class="member-detail">
					<strong>입사일:</strong> ${memberInfo.member_start_date}
				</div>
				<div class="member-detail">
					<strong>팀:</strong> ${memberInfo.member_team}
				</div>
				<div class="member-detail">
					<strong>전화번호:</strong> ${memberInfo.member_phone_number}
				</div>
				<div class="member-detail">
					<strong>E-Mail:</strong> ${memberInfo.member_email}
				</div>
			</section>
			<div id="graphBar">
				<%@ include file="graph_Circular.jsp"%>
			</div>
		</section>
		<div class="right-container">
			<section class="box-sectiong">
				<div class="move-container">
					<p class="rounded-box bg-A shiny-effect">
						<img src="./resources/CSS/img/icon_member.png"><span
							style="font-size: 12px;">직원 숫자 <br>${memberCount}명</span>
					</p>
				</div>

				<div class="move-container">
					<a href="assetlist">
						<p class="rounded-box bg-B">
							<img src="./resources/CSS/img/icon_computer.png"><span
								style="font-size: 12px;">전체 자산 수량 <br> ${listSize}개
							</span>
						</p>
					</a>
				</div>
				<div class="move-container">
					<div>
						<a href="reportPage">
							<p class="rounded-box bg-C">
								<img src="./resources/CSS/img/icon_new_asset.png"><span
									style="font-size: 12px;">신규 자산 <br>${newAssetSize}개</span>
							</p>
						</a>
					</div>
				</div>
				<div class="move-container">
					<a href="reportPage">
						<p class="rounded-box bg-D">
							<img src="./resources/CSS/img/icon_growth.png"><span
								style="font-size: 12px;">월간 변동 자산 <br>
								${reportCount} 건
							</span>
						</p>
					</a>
				</div>
				<div class="move-container">
					<a href="newAssetlist">
						<p class="rounded-box bg-E">
							<img src="./resources/CSS/img/icon_idea.png"><span
								style="font-size: 12px;">추가된 자산</span>
						</p>
					</a>
				</div>

				
				 <div class="move-container">
        <a href="chattingHomePage">
            <p class="rounded-box bg-F">
                <img src="./resources/CSS/img/icon_messenger.png"
                     class="${messageAlert ? 'blink' : ''}"> <!-- messageAlert가 true면 blink 클래스를 추가 -->
                <span style="font-size: 12px;">확인 안한 채팅</span>
            </p>
        </a>
    </div>
			</section>

			<section id="Calendar-space">
				<%@ include file="Calendar.jsp"%>
			</section>

		</div>
	</div>

	<div id="FootInfo-Spcae">
		<%@ include file="FooterInfo.jsp"%>
	</div>

</body>
<script
	src="${pageContext.request.contextPath}/resources/JS/sockjs.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
var stompClient = null; // stompClient를 초기에 null로 선언

function openSocket() {
	if (stompClient !== null && stompClient.connected) {
        return;
    }
    // SockJS와 Stomp client 초기화
    var socket = new SockJS("/assetmanager/stomp-endpoint");
    stompClient = Stomp.over(socket);

    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);

        // 채팅방 목록 업데이트 구독
        stompClient.subscribe('/topic/room-updates', function(roomUpdate) {
        	 toggleBlink(true);

        });
    }, function(error) { // 연결 실패 콜백
        console.log('연결 실패: ' + error);
    });

    console.log("연결프로세스종료");
}
function toggleBlink(newMessage) {
    var chatIcon = document.getElementById('chat-icon');
    if (newMessage) {
        chatIcon.classList.add('blink');
    } else {
        chatIcon.classList.remove('blink');
    }
}	
	openSocket();
</script>
</html>
