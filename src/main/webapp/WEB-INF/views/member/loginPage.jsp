<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ include file="../header.jsp"%> --%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/member/loginStyle.css">
<title>로그인하기</title>
</head>
<body>
	<!-- 	로그인페이지 -->
	<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up"></div>
			<!-- END SIGN UP -->


			<!-- SIGN IN -->

			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
						<form id="login" action="login" method="post">
							<!--                         <fieldset> -->
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="input-group">
								<i class='bx bxs-user'></i> <input type="text"
									placeholder="Username" id="member_name" name="username"
									required value="test">
							</div>
							<div class="input-group">
								<i class='bx bxs-lock-alt'></i> <input type="password"
									placeholder="Password" id="member_password" name="password"
									required value="1234">
							</div>
							<button type="submit">로그인하기</button>
							<!--                         </fieldset> -->
						</form>
						<p>
							<b id="forgotLink" style="cursor: pointer;" onclick="show">계정/비밀번호를
								잊어버리셨나요?</b>
						</p>
						<p>
							<span>계정이 없으신가요??</span> <b onclick="location.href='signUpPage'"
								class="pointer">회원가입하기</b>
						</p>
					</div>
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>3방문을 환영합니다</h2>

				</div>
				<div class="img sign-in"></div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up"></div>
				<div class="text sign-up">
					<h2>Join with us</h2>

				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
		<div id="forgot-space" style="display: none;">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close-button">&times;</span>
					<h2>계정 찾기 / 비밀번호 재설정</h2>
				</div>
				<div class="input-group">
					<div class="recover-section">
						<h3 style="margin-bottom: 15px;">ID 찾기</h3>
						<input type="text" placeholder="이메일 입력" id="recoverEmail"
							oninput="formatEmailFindID()"> <input type="hidden"
							id="validatedEmailValueByID" value=""> <input type="text"
							placeholder="인증번호 입력" id="recoverEmailCode" disabled>

						<div class="button-container">

							<button class="custom-button" onclick="emailCheckByID()">이메일
								확인하기</button>
							<button class="custom-button" onclick="verifyEmail()">인증번호
								확인</button>
						</div>
					</div>
					<hr>
					<div class="recover-section">
						<h3 style="margin-bottom: 15px;">PW 찾기</h3>
						<input type="text" placeholder="ID 입력" id="recoverID"> <input
							type="text" placeholder="이메일 입력" id="recoverPWEmail"
							oninput="formatEmailFindPW()"> <input type="hidden"
							id="validatedEmailValueByPW" value=""> <input type="text"
							placeholder="인증번호 입력" id="recoverPWCode" disabled>
						<div class="button-container">

							<button class="custom-button" onclick="verifyPW()">계정
								확인하기</button>
							<button class="custom-button" onclick="verifyPW()">인증번호
								확인</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<main> -->
	<!-- 		<form id="login" action="login" method="post"> -->
	<!-- 			<fieldset> -->
	<!-- 				<legend>회원 정보 입력</legend> -->
	<%-- 				<input type="hidden" name="${_csrf.parameterName}" --%>
	<%-- 					value="${_csrf.token}" /> <label for="member_name">ID</label> <input --%>
	<!-- 					id="member_name" name="username" type="text" required value="test" /> -->
	<!-- 				<label for="member_password">비밀번호</label> <input -->
	<!-- 					id="member_password" name="password" type="password" required -->
	<!-- 					value="1234" /> -->
	<!-- 			</fieldset> -->
	<!-- 			<div class="button-container"> -->
	<!-- 				<button type="submit">제출</button> -->
	<!-- 				<button type="reset">초기화</button> -->
	<!-- 			</div> -->
	<!-- 		</form> -->
	<!-- 		<section id="account_options"> -->
	<!-- 			<button> -->
	<!-- 				<a href="signUpPage">회원가입하기</a> -->
	<!-- 			</button> -->
	<!-- 			<button onclick="find_ID">ID찾기</button> -->
	<!-- 			<button onclick="find_PW">PW찾기</button> -->
	<!-- 		</section> -->
	<!-- 	</main> -->
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {

document.getElementById('forgotLink').onclick = function() {
    document.getElementById('forgot-space').style.display = 'block';
};

document.getElementsByClassName('close-button')[0].onclick = function() {
    document.getElementById('forgot-space').style.display = 'none';
};

window.onclick = function(event) {
    if (event.target == document.getElementById('forgot-space')) {
        document.getElementById('forgot-space').style.display = 'none';
    }
}
});
//ID찾기 인증번호확인하기
function verifyEmail() {
		event.preventDefault(); // 폼의 기본 제출 동작을 중단

		var certificationNumber = document
				.getElementById('recoverEmail').value; // 입력된 사용자 이름 가져오기
		var Checknum = document.getElementById('validatedEmailValueByID').value;

		$.ajax({
			url : '/assetmanager/checkNum',
			type : 'POST',
			data : {
				checkNum : certificationNumber,
				_csrf : $('input[name="_csrf"]').val()
			// CSRF 토큰을 추가

			},
			success : function(response) {
				alert('해당하는 이메일로 ID를 전송하였습니다.');
				Checknum.value = certificationNumber; // 여기를 수정하여 DOM 요소의 value 속성을

			},
			error : function(xhr, status, error) {
				alert('올바른 번호가 아닙니다');
			}

		});

	
}

function verifyPW() {
    // 여기에 비밀번호 인증 로직 구현
    alert("비밀번호 인증 로직을 구현하세요.");
}

let container = document.getElementById('container')

toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
}

setTimeout(() => {
  container.classList.add('sign-in')
}, 200)

function emailCheckByID() {
		var useremail = document.getElementById('recoverEmail').value; // 입력된 사용자 이름 가져오기
		var checknum = document.getElementById('recoverEmailCode'); // 오타 수정: 'documenet' -> 'document'
		var checkemail = document.getElementById('validatedEmailValueByID'); // 오타 수정: 'documenet' -> 'document'
		console.log(useremail);
		$.ajax({
			url : '/assetmanager/sendEmail',
			type : 'POST',
			data : {
				email : useremail,
				_csrf : $('input[name="_csrf"]').val()
			// CSRF 토큰을 추가

			},
			success : function(response) {
				alert('인증번호가 발송되었습니다.');
				console.log(response);
				checknum.disabled = false; // 인증번호 입력 필드 활성화
				checkemail.value = useremail; // 여기를 수정하여 DOM 요소의 value 속성을

			},
			error : function(xhr, status, error) {
				alert('유효한 이메일이 아닙니다');
			}

		});

	}
	
document.getElementById('login').addEventListener('submit', function(event) {
    event.preventDefault(); // 폼의 기본 제출을 방지
    var csrfToken = "${_csrf.token}";

    const formData = new FormData(this);
    const data = {
        username: formData.get('username'),
        password: formData.get('password'),

    };
	console.log(JSON.stringify(data));
    fetch('login', { // 로그인 처리를 위한 서버의 URL
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            // 필요한 경우 CSRF 토큰을 헤더에 추가
            'X-CSRF-TOKEN': formData.get('_csrf')
        },
        body: JSON.stringify(data),
        credentials: 'same-origin' // 쿠키를 포함시키기 위해 필요

    })
    
    .then(response => 

    response.json()) // 응답을 JSON으로 파싱
    .then(data => {
        console.log(data.username);

        // 토큰을 로컬 저장소에 저장
        localStorage.setItem('auth_token', data.auth_token);
        // 로그인 성공 후의 리다이렉션, 또는 다른 로직 처리
        window.location.href = 'home'; // 예를 들어 홈 페이지로 리다이렉션
    })
    .catch(error => {
        console.error('Login Error:', error);
        // 에러 처리 로직
    });
});
function formatEmailFindID() {
    var input = document.getElementById('recoverEmail');
    var email = input.value;
    
    var localPart = email.split('@')[0];
    input.value = localPart + '@naver.com'; // 도메인 자동 완성

    input.setSelectionRange(localPart.length, localPart.length);
    
}

function formatEmailFindPW() {
    var input = document.getElementById('recoverPWEmail');
    var email = input.value;
    
    var localPart = email.split('@')[0];
    input.value = localPart + '@naver.com'; // 도메인 자동 완성

    input.setSelectionRange(localPart.length, localPart.length);
    
}


</script>
</html>