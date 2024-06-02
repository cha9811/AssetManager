<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../header.jsp"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>WebSocket Chatting</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/chatting/ChattingHomePageStyle.css">

</head>
<body class="fade-in">
	<div id="modalOverlay" class="modal-overlay"></div>

	<section id="content-wrapper">
		<section id="memberList-backPage">
			<h2 style="margin-left: 20px;">맴버 리스트</h2>
			<input type="text" class="searchMember" id="searchMember"
				placeholder="멤버 검색..." onkeyup="filterMembers()">
			<div id="memberContainer" style="overflow-y: auto;">
				<c:forEach var="memberlist" items="${memberlist}">
					<section class="memberList-Space">
						<img src="./resources/CSS/img/chatting_default.png" alt="채팅방 이미지">
						<div class="member-details">
							<div class="member-info">
								<input class="member_id" type="hidden" id="member_Id"
									name="memberId" value="${memberlist.member_id}"> <span>${memberlist.member_department}
									${memberlist.member_username}</span>
							</div>
							<div class="member-info">

								<span>상태 : <span class="status-text"
									data-attendance="${memberlist.member_attendance}">${memberlist.member_attendance}</span></span>
								<div class="status-icon status-${memberlist.member_attendance}"></div>
							</div>
							<div class="member-info">
								<span>번호 : ${memberlist.member_phone_number}</span>
							</div>
						</div>
					</section>
				</c:forEach>
			</div>
		</section>
		<section class="member-detail-space"></section>
		<section id="chattingRoomListSpace">
			<h2>참여한 채팅방 목록</h2>

			<div style="text-align: right;">
				<img src="./resources/CSS/img/icon_chatting_room_add.png"
					alt="채팅방 추가 이미지" onclick="newChattingRoom()">
			</div>
			<section id="chatting-Room-Space">
				<c:forEach var="roomlist" items="${roomlist}">
					<a id='golink' href="chatting/${roomlist.room_id}">
						<li><img src="./resources/CSS/img/chatting_default.png"
							alt="채팅방 이미지">
							<div class="info">
								<span style="font-weight: bold">${roomlist.room_title}</span>
								<div class="middle-info">
									<span class="last-message-Space"
										id="lastMessage-${roomlist.room_id}"> <c:choose>
											<c:when test="${empty roomlist.room_content}">메세지가 없습니다</c:when>
											<c:otherwise>${roomlist.room_content}</c:otherwise>
										</c:choose>
									</span> <span class="unread-messages"
										id="unreadCount-${roomlist.room_id}"
										style="${roomlist.unreadCount > 0 ? 'display: inline;' : 'display: none;'}">${roomlist.unreadCount}
									</span>

								</div>
								<span class="time-space" id="lastTime-${roomlist.room_id}">${roomlist.room_isActive}</span>

							</div></li>
					</a>
				</c:forEach>

				<c:if test="${empty roomlist}">
					<hr>
					<div></div>
					<img src="./resources/CSS/img/icon_no_chatting_room.png"
						alt="No rooms available" class="no-rooms-img">
					<div></div>
					<div class="info" style="text-align: center;">채팅방이 없습니다.</div>
				</c:if>
			</section>
		</section>

	</section>
	<div class="modal-background" style="display: none;">
		<div id="newChattingForm">
			<button class="custom-button" onclick="createChatRoom()">채팅방
				생성</button>
			<img
				style="position: absolute; width: 10px; height: 10px; top: 10px; right: 10px; cursor: pointer;"
				src="./resources/CSS/img/icon_clsoe.png" alt="채팅방 이미지"
				onclick="cancelNewChattingRoom()">

			<div></div>
			<div id="newMemberContainer">
				<input type="text" id="chatRoomName" placeholder="채팅방 이름"> <input
					type="text" class="searchMember" id="searchMemberByNewChattingRoom"
					placeholder="초대할 멤버 검색..."
					onkeyup="filterMembersByNewChattingRoom()">
				<section id="selectedMembers">
					<div id="memberText" style="display: block;">인원을 추가해주세요</div>

				</section>
				<div id="newChattingMemberListContainer" style="overflow-y: auto;">

					<c:forEach var="memberlist" items="${memberlist}">
						<section class="newChattingMember-List-Space"
							data-member-id="${memberlist.member_id}">

							<img src="./resources/CSS/img/chatting_default.png" alt="채팅방 이미지">
							<div class="member-details">
								<div class="member-info"
									data-member-id="${memberlist.member_id}">
									<input class="member_id" type="hidden" name="memberId"
										value="${memberlist.member_id}"> <span>${memberlist.member_department}
										${memberlist.member_username}</span>
								</div>
								<div class="member-info">
									<span>상태 : <span class="status-text"
										data-attendance="${memberlist.member_attendance}">${memberlist.member_attendance}</span></span>
									<div class="status-icon status-${memberlist.member_attendance}"></div>
								</div>
								<div class="member-info">
									<span>번호 : ${memberlist.member_phone_number}</span>
								</div>
							</div>
							<input type="checkbox" class="member-checkbox"
								name="memberCheckbox" value="${memberlist.member_id}">
						</section>
					</c:forEach>
				</div>
			</div>
</body>

<!-- websocket javascript -->
<script
	src="${pageContext.request.contextPath}/resources/JS/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var selectedMemberIds = [];
var stompClient = null; // stompClient를 초기에 null로 선언

	$(document).ready(function() {
	    openSocket();

		$('a#golink').on('click', function(e) {
			e.preventDefault();
		});

		$('a#golink').dblclick(function() {
			window.location = this.href;
		});
	});

	
	//맴버검색
	function filterMembers() {
    const input = document.getElementById('searchMember');
    const filter = input.value.toUpperCase();
    const memberContainer = document.getElementById('memberContainer');
    const members = memberContainer.getElementsByClassName('memberList-Space');
    let visibleCount = 0;

    for (let i = 0; i < members.length; i++) {
        const memberInfo = members[i].getElementsByClassName('member-info')[0];
        const textValue = memberInfo.textContent || memberInfo.innerText;

        if (textValue.toUpperCase().indexOf(filter) > -1 && visibleCount < 6) {
            members[i].style.display = "";
            visibleCount++;
        } else {
            members[i].style.display = "none";
        }
    }
}
	//맴버검색(새채팅방)
	function filterMembersByNewChattingRoom() {
	    const input = document.getElementById('searchMemberByNewChattingRoom');
	    const filter = input.value.toUpperCase();
	    const newMemberContainer = document.getElementById('newMemberContainer');
	    const members = newMemberContainer.getElementsByClassName('newChattingMember-List-Space');
	    let visibleCount = 0;

	    for (let i = 0; i < members.length; i++) {
	        const memberInfo = members[i].getElementsByClassName('member-info')[0];
	        const textValue = memberInfo.textContent || memberInfo.innerText;

	        if (textValue.toUpperCase().indexOf(filter) > -1 && visibleCount < 6) {
	            members[i].style.display = "";
	            visibleCount++;
	        } else {
	            members[i].style.display = "none";
	        }
	    }
	}

	//스크롤
document.addEventListener('DOMContentLoaded', function() {
    
    function setupInfiniteScroll(container, loadedMembers, selector, loadMore) {
        const containerElement = document.getElementById(container);
        if (!containerElement) {
            return;
        }
        
        const members = containerElement.querySelectorAll(selector);
        const totalMembers = members.length;

        function displayMembers(count) {
            members.forEach((member, index) => {
                member.style.display = index < count ? "flex" : "none";
            });
        }

        displayMembers(loadedMembers);

        return function checkScroll() {
            if ((containerElement.scrollHeight - (containerElement.scrollTop + containerElement.clientHeight) < 100)) {
                if (loadedMembers < totalMembers) {
                    loadedMembers += loadMore;
                    displayMembers(loadedMembers);
                }
            }
        };
    }

    const handleScrollMemberList = setupInfiniteScroll('memberContainer', 6, '.memberList-Space', 6);
    const handleScrollNewChattingMemberList = setupInfiniteScroll('newChattingMemberListContainer', 6, '.newChattingMember-List-Space', 6);

    const memberListContainer = document.getElementById('memberContainer');
    const newChattingMemberListContainer = document.getElementById('newChattingMemberListContainer');

    if (!memberListContainer || !newChattingMemberListContainer) {
        return;
    }

    memberListContainer.addEventListener('scroll', handleScrollMemberList);
    newChattingMemberListContainer.addEventListener('scroll', handleScrollNewChattingMemberList);
});

//맴버상세보기
	document.querySelectorAll('.memberList-Space').forEach(function(item) {
	    item.addEventListener('click', function() {
	        var userId = this.querySelector('.member_id').value; // input 요소에서 value 가져오기

	        fetch('getMemberDetails/' + userId) // 서버에 해당 사용자의 상세 정보 요청
	        .then(function(response) { return response.json(); })
	         .then(function(data) {
            var detailsSection = document.querySelector('.member-detail-space');
            document.getElementById('modalOverlay').style.display="block";
            // 상세 정보를 HTML 형식으로 구성
            var detailsHtml = '<h3>Member Details</h3>';
            if (data) {
                detailsHtml += '<p>사원번호: ' + data.member_id + '</p>';
                detailsHtml += '<p>이름: ' + data.member_username + '</p>';
                detailsHtml += '<p>부서: ' + data.member_department + '</p>';
                detailsHtml += '<p>전화번호: ' + data.member_phone_number + '</p>';
                detailsHtml += '<p>입사일: ' + data.member_start_date + '</p>';
                detailsHtml += '<p>Email: ' + data.member_email + '</p>';
                detailsHtml += '<img src="./resources/CSS/img/icon_clsoe.png" alt="Close" onclick="closeDetailSection()" style="position: absolute; width:10px; height:10px; top: 10px; right: 10px; cursor: pointer;">';

                detailsSection.innerHTML = detailsHtml;
                detailsSection.style.display = 'block'; // 섹션을 보이도록 설정
                // 추가 정보 필요 시 계속해서 여기에 추가
            } else {
            	detailsSection.innerHTML = '<p>No details available for this member.</p>';
                detailsHtml += '<img src="./resources/CSS/img/icon_clsoe.png" alt="Close" onclick="closeDetailSection()" style="position: absolute; top: 0; left: 0; cursor: pointer;">';
            	detailsSection.style.display = 'block'; // 섹션을 보이도록 설정
            }
            detailsSection.innerHTML = detailsHtml;
        })
	        .catch(function(error) { console.error('Error:', error); });
	    });
	});
	function closeDetailSection() {
	    document.querySelector('.member-detail-space').style.display = 'none'; // 섹션 숨기기
        document.getElementById('modalOverlay').style.display="none";

	}
	
	function newChattingRoom() {
        document.querySelector('.modal-background').style.display = 'flex'; // 모달을 보여줍니다.
	}

	function cancelNewChattingRoom() {
	    document.querySelector('.modal-background').style.display = 'none'; // 모달을 숨깁니다.
	}
	
function createChatRoom() {
    var roomName = document.getElementById('chatRoomName').value;
    
    var data = {
    		room_title: roomName,  // ChattingRoomVO에서의 필드 이름과 일치해야 함
            member_id: selectedMemberIds// 배열로 전달 (앞은 백엔드거)
        };
    
    fetch('createChatRoom', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
       window.location.reload();
    })
    .catch(error => console.error('채팅방 생성 에러:', error));

}

document.addEventListener('DOMContentLoaded', function() {

    var checkboxes = document.querySelectorAll('.member-checkbox');
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            if (this.checked) {
                addMemberToSelectedList(this.value);
            } else {
                removeMemberFromSelectedList(this.value);
            }
        });
    });
});
function addMemberToSelectedList(memberId) {
    var memberDetails = document.querySelector('.newChattingMember-List-Space[data-member-id="' + memberId + '"]');
    selectedMemberIds.push(memberId);

    if (memberDetails) {
        // 복제할 멤버 정보 선택
        var memberImage = memberDetails.querySelector('img').cloneNode(true);
        var memberName = memberDetails.querySelector('.member-info[data-member-id="' + memberId + '"] span').cloneNode(true);

        var memberDisplay = document.createElement('div');
        memberDisplay.classList.add('selected-member-display');
        memberDisplay.setAttribute('data-member-id', memberId);  // 멤버 ID 설정

        memberDisplay.appendChild(memberImage); // 이미지 추가
        memberDisplay.appendChild(memberName);   // 이름 추가

        document.getElementById('selectedMembers').appendChild(memberDisplay);
        updateMemberText();

    }
}

function removeMemberFromSelectedList(memberId) {
    var selectedMembers = document.getElementById('selectedMembers');
    var memberToRemove = selectedMembers.querySelector('.selected-member-display[data-member-id="' + memberId + '"]');
    if (memberToRemove) {
        selectedMemberIds = selectedMemberIds.filter(id => id !== memberId);

    	selectedMembers.removeChild(memberToRemove);
        updateMemberText();

    }

}


function updateMemberText() {
    var selectedMembers = document.getElementById('selectedMembers');
    var memberText = document.getElementById('memberText'); // '인원을 추가해주세요' 텍스트의 아이디
    if (!selectedMembers.querySelectorAll('.selected-member-display').length) {
        memberText.style.display = 'block'; // 인원이 없으면 텍스트 표시
    } else {
        memberText.style.display = 'none'; // 인원이 있으면 텍스트 숨김
    }
}

// 	var socket = new SockJS('/assetmanager/stomp-endpoint');
	//     var stompClient = Stomp.over(socket);
	//     var roomId = extractRoomIdFromUrl();

	//     var messages = document.getElementById("messages");

	//처음 소켓 연결
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
	                var message = JSON.parse(roomUpdate.body);
	                var roomId = message.room_id; // 메시지에 채팅방 ID 포함되어야 함

	                var unreadSpan = document.getElementById('unreadCount-' + roomId);
	                var currentCount = parseInt(unreadSpan.innerHTML);
	                if (!isNaN(currentCount)) {
	                	if (currentCount === 0) {
	                        unreadSpan.style.display = 'inline'; // 0에서 1로 업데이트 시 display를 inline으로 변경
	                    }
	                    unreadSpan.innerHTML = currentCount + 1;  // 새로운 값으로 업데이트
	                }
	                console.log(unreadSpan);

	                var lastMessage = message.room_content; // 최신 메시지 내용
	                var lastTime = message.room_isActive; // 마지막 활성 시간
	                document.getElementById('lastTime-' + roomId).textContent = lastTime;
	                document.getElementById('lastMessage-' + roomId).textContent = lastMessage;	                
	            });
	        }, function(error) { // 연결 실패 콜백
	            console.log('연결 실패: ' + error);
	        });

	        console.log("연결프로세스종료");
	    }

	//연결유지
	//     function setConnected(connected) {
	//         // 연결 상태에 따라 UI 변경
	//         document.getElementById("connect").disabled = connected;
	//         document.getElementById("disconnect").disabled = !connected;
	//         if (connected) {
	//             messages.style.display = "";
	//         } else {
	//             messages.style.display = "none";
	//         }
	//     }

	// function send() {
	//     var chatting_content = document.getElementById("messageinput").value;
	//     stompClient.send("/app/rooms/" + roomId + "/sendMessage", {}, JSON.stringify({ 'chatting_content': chatting_content }));
	//     console.log("roomId는 :" + roomId);
	//     showGreeting(chatting_content); // 전송한 메시지를 화면에도 표시 (선택적)
	// }
	//연결종료
	//     function closeSocket() {
	//         if (stompClient !== null) {
	//             stompClient.disconnect();
	//         }
	//         setConnected(false);
	//         console.log("Disconnected");
	//     }
	
</script>
</html>
