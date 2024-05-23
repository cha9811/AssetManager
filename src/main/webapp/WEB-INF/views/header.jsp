<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/home/headetStyle_TOP.css">


<title>Home</title>
</head>
<body>
	<header>
		<nav>
			<div class="nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/home">홈페이지</a></li>
					<c:choose>
						<c:when test="${pageContext.request.userPrincipal != null}">
					
					<li><a href="${pageContext.request.contextPath}/newAssetlist">신규자산</a></li>
					<li><a href="${pageContext.request.contextPath}/assetlist">자산보기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/deletedassetlist">삭제
							자산 보기</a></li>
							<li><a href="#" onclick="logout();">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/chattingHomePage">채팅방</a></li>
							<li><a href="${pageContext.request.contextPath}/reportPage">리포트</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/loginPage">로그인</a></li>
						</c:otherwise>
					</c:choose>
					                <c:if test="${pageContext.request.userPrincipal != null}">
					
					<c:choose>
						<c:when test="${memberAttendance == 1}">
							<div class="status-container">
								<div class="status-light on"></div>
								<span class="status-text">출근</span>

								<button class="custom-button" data-action="0">퇴근</button>
								<button class="custom-button" data-action="2">연차</button>
								<button class="custom-button" data-action="3">병가</button>
								<button class="custom-button" data-action="4">출장</button>
						</c:when>
						<c:when test="${memberAttendance == 2}">
							<div class="status-container">
								<div class="status-light vacation"></div>
								<span class="status-text">연차</span>
							</div>
							<button class="custom-button" data-action="1">연차 취소</button>
							<button class="custom-button" data-action="3">병가</button>
							<button class="custom-button" data-action="4">출장</button>
						</c:when>

						<c:when test="${memberAttendance == 3}">
							<div class="status-container">
								<div class="status-light sick"></div>
								<span class="status-text">병가</span>
							</div>
							<button class="custom-button" data-action="1">병가 취소</button>
							<button class="custom-button" data-action="2">연차</button>
						</c:when>

						<c:when test="${memberAttendance == 4}">
							<div class="status-container">
								<div class="status-light sick"></div>
								<span class="status-text">출장</span>
							</div>
							<button class="custom-button" data-action="1">업무복귀</button>
							<button class="custom-button" data-action="2">연차</button>
						</c:when>
						<c:otherwise>
							<div class="status-container">
								<div class="status-light off"></div>
								<span class="status-text">퇴근</span>
							</div>
							<button class="custom-button" id="startWorkBtn" data-action="1">출근</button>
						</c:otherwise>
					</c:choose>
					</c:if>
				</ul>

			</div>
		</nav>
	</header>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(
		function() {
			$('button[data-action]').click(function(event) {
				event.preventDefault(); // 버튼의 기본 동작을 막습니다.

				var actionValue = $(this).data('action'); // 버튼의 data-action 값을 가져옵니다.

				// AJAX 요청을 보냅니다.
				$.ajax({
					url : '/assetmanager/updateWork', // 요청을 보낼 서버의 URL
					type : 'POST', // 데이터 전송 방식
					data : {
						action : actionValue
					},
					success : function(response) {
						alert('처리가 완료되었습니다.');
						window.location.reload(); // 페이지를 새로고침합니다.
					},
					error : function(xhr, status, error) {
						alert(actionValue + ' 처리에 실패했습니다.');
					}
				});
			})
		});
			
	function logout() {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form
				.setAttribute("action",
						"${pageContext.request.contextPath}/logout");
		document.body.appendChild(form);
		form.submit();
	}
</script>

</html>
