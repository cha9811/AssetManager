<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../header.jsp"%> --%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/member/signUpStyle.css">


<body>

	<!-- 	<main> -->
	<!-- 		<form action="signUp" method="POST"> -->
	<%-- 			<sec:csrfInput /> --%>

	<!-- 			<fieldset> -->
	<!-- 				<legend>회원 정보 입력</legend> -->
	<%-- 				<input type="hidden" name="${_csrf.parameterName}" --%>
	<%-- 						value="${_csrf.token}" /> <label for="member_name">ID</label> --%>
	<!-- 				<div class="input-group"> -->

	<!-- 						<input -->
	<!-- 						id="member_name" type="text" name="member_name" value="1" required /> -->
	<!-- 					<button type="button" onclick="IDcheck()">중복확인</button> -->
	<!-- 				</div> -->
	<!-- 				<label for="member_password">비밀번호</label> <input -->
	<!-- 					id="member_password" type="password" name="member_password" -->
	<!-- 					value="1" required /> <label for="member_password_ver">비밀번호 -->
	<!-- 					검증</label> <input id="member_password_ver" type="password" -->
	<!-- 					name="member_password_ver" value="1" required /> <label -->
	<!-- 					for="member_username">이름</label> <input id="member_username" -->
	<!-- 					type="text" name="member_username" required /> <label -->
	<!-- 					for="member_department">부서</label> <input id="member_department" -->
	<!-- 					type="text" name="member_department" value="1" required /> <label -->
	<!-- 					for="member_local">근무동</label> <input id="member_local" type="text" -->
	<!-- 					name="member_local" value="1" required /> <label -->
	<!-- 					for="member_start_date">입사일</label> <input id="member_start_date" -->
	<!-- 					type="date" name="member_start_date" value="1" required /> <label -->
	<!-- 					for="member_LDAP">LDAP</label> <input id="member_LDAP" type="text" -->
	<!-- 					name="member_LDAP" value="1" required /> <label for="member_role">역할</label> -->
	<!-- 				<input id="member_role" type="text" name="member_role" value="1" -->
	<!-- 					required /> <label for="member_team">팀</label> <input -->
	<!-- 					id="member_team" type="text" name="member_team" value="1" required /> -->

	<!-- 				<label for="member_phone_number">전화번호</label> <input -->
	<!-- 					id="member_phone_number" type="tel" name="member_phone_number" -->
	<!-- 					required /> <label for="member_email">이메일</label> <input -->
	<!-- 					id="member_email" type="text" name="member_email" required /> <label -->
	<!-- 					for="member_certification_number"> -->
	<!-- 					<button type="button" onclick="emailCheck()">인증번호 보내기</button> 인증번호 -->
	<!-- 				</label> <input id="member_certification_number" type="text" -->
	<!-- 					name="member_certification_number" required /> -->

	<!-- 			</fieldset> -->
	<!-- 			<div class="button-container"> -->
	<!-- 				<button type="submit">제출</button> -->
	<!-- 				<button type="reset">초기화</button> -->
	<!-- 			</div> -->
	<!-- 		</form> -->
	<!-- 	</main> -->
<body>
	<section id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN IN FORM -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<form action="signUp" method="POST" class="form sign-in"
						onsubmit="return finalValidation()">

						<sec:csrfInput />
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<!-- ID -->

						<div class="input-group">
							<i class='bx bxs-user'></i> <input type="text" id="member_name"
								name="username" placeholder="ID" required> <input
								type="hidden" id="validatedIdValue" value="">

							<button style="margin-top: 10px;" type="button"
								onclick="IDcheck()">중복확인</button>
						</div>
						<!-- Password -->
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								id="member_password" name="member_password" placeholder="비밀번호"
								required>
						</div>

						<!-- Confirm Password -->
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								id="member_password_ver" name="member_password_ver"
								placeholder="비밀번호 검증" required>
						</div>

						<!-- 이름 -->
						<div class="input-group">
							<i class='bx bxs-user'></i> <input type="text"
								id="member_username" name="member_username" placeholder="이름"
								required>
						</div>

						<!-- 부서 -->
						<div class="input-group">
							<i class='bx bxs-building-house'></i> <input type="text"
								id="member_department" name="member_department" placeholder="부서"
								required>
						</div>

						<!-- 근무동 -->
						<div class="input-group">
							<i class='bx bx-building'></i> <input type="text"
								id="member_local" name="member_local" placeholder="근무동" required>
						</div>

						<!-- 입사일 -->
						<div class="input-group">
							<i class='bx bx-calendar'></i> <input type="date"
								id="member_start_date" name="member_start_date" required>
						</div>

						<!-- LDAP -->
						<section class="input-group">
							<i class='bx bx-network-chart'></i> <input type="text"
								id="member_LDAP" name="member_LDAP" placeholder="LDAP" required>
						</section>

						<!-- 전화번호 -->
						<section class="input-group">
							<i class='bx bx-phone'></i> <input type="tel"
								id="member_phone_number" name="member_phone_number"
								placeholder="전화번호" required oninput="formatPhoneNumber()">
						</section>

						<!-- 이메일 -->
						<section class="input-group">
							<i class='bx bx-envelope'></i> <input type="text"
								id="member_email" name="member_email" placeholder="이메일" required
								oninput="formatEmail()"> <input type="hidden"
								id="validatedEmailValue" value="">

							<button style="margin-top: 10px;" type="button"
								onclick="emailCheck()">인증번호 보내기</button>

						</section>

						<!-- 인증번호 -->
						<div class="input-group">
							<i class='bx bx-key'></i> <input type="text"
								id="member_certification_number"
								name="member_certification_number" placeholder="인증번호" required
								disabled> <input type="hidden"
								id="validatedCertNumValue" value="">

							<button style="margin-top: 10px;" onclick="checkNum(event)">검증하기</button>
						</div>


						<div class="button-container">
							<button type="submit">제출</button>
						</div>
						<span>이미 계정이 있으신가요?</span> <b onclick="location.href='loginPage'"
							class="pointer">로그인 하러 가기</b>

						</p>
					</form>

				</div>
			</div>

			<!-- SIGN IN CONTENT -->
			<section class="col align-items-center flex-col">
				<div class="text sign-in"></div>
				<div class="img sign-in">
					<img src="./resources/CSS/img/signup_img.jpg" alt="Welcome Image"
						style="width: 60vw; height: 100vh;">
				</div>
			</section>
		</div>
	</section>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function formatPhoneNumber() {
		var input = document.getElementById('member_phone_number');
		var numbers = input.value.replace(/\D/g, ''); // 숫자가 아닌 모든 문자 제거
		var phoneNumber = '';

		// 숫자만 추출된 상태에서 포맷 적용
		if (numbers.length > 3) {
			// 처음 세 자리는 그대로 유지 (지역번호 혹은 휴대폰 앞자리)
			phoneNumber += numbers.substring(0, 3);
			if (numbers.length > 3 && numbers.length <= 7) {
				// 다음 네 자리 (중간 번호)
				phoneNumber += '-' + numbers.substring(3, 7);
			} else if (numbers.length > 7) {
				// 나머지 자리 (마지막 번호), 최대 11자리까지만 허용
				phoneNumber += '-' + numbers.substring(3, 7) + '-'
						+ numbers.substring(7, 11);
			}
		} else {
			phoneNumber = numbers;
		}

		input.value = phoneNumber; // 포맷된 번호를 입력 필드에 다시 설정
	}
	function IDcheck() {

		var username = document.getElementById('member_name').value; // 입력된 사용자 이름 가져오기
		$
				.ajax({
					url : '/assetmanager/IDcheck', // 요청을 보낼 서버의 URL
					type : 'GET', // HTTP 메소드 타입
					data : {
						username : username
					}, // 서버로 보낼 데이터
					success : function(result, xhr, status, error) {

						if (result) {
							alert('사용 가능한 ID입니다.');
							document.getElementById('validatedIdValue').value = username; // 검증된 ID 저장

						} else {
							alert('이미 사용중인 ID입니다.');
						}
					},
					error : function(xhr, status, error) {
						alert('이미 사용중인 ID입니다.');
					}
				});
	}

	function formatEmail() {
		var input = document.getElementById('member_	');
		var email = input.value;

		var localPart = email.split('@')[0];
		input.value = localPart + '@naver.com'; // 도메인 자동 완성

		input.setSelectionRange(localPart.length, localPart.length);

	}

	function emailCheck() {
		var useremail = document.getElementById('member_email').value; // 입력된 사용자 이름 가져오기
		var checknum = document.getElementById('member_certification_number'); // 오타 수정: 'documenet' -> 'document'
		var checkemail = document.getElementById('validatedEmailValue'); // 오타 수정: 'documenet' -> 'document'

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
	function checkNum(event) {
		event.preventDefault(); // 폼의 기본 제출 동작을 중단

		var certificationNumber = document
				.getElementById('member_certification_number').value; // 입력된 사용자 이름 가져오기
		var Checknum = document.getElementById('validatedCertNumValue').value;

		$.ajax({
			url : '/assetmanager/checkNum',
			type : 'POST',
			data : {
				checkNum : certificationNumber,
				_csrf : $('input[name="_csrf"]').val()
			// CSRF 토큰을 추가

			},
			success : function(response) {
				alert('인증이 완료되었습니다.');
				console.log(response);
				Checknum.value = certificationNumber; // 여기를 수정하여 DOM 요소의 value 속성을

			},
			error : function(xhr, status, error) {
				alert('올바른 번호가 아닙니다');
			}

		});

	}

	function confirmPassword() {
		var password = document.getElementById('member_password').value;
		var confirmpassword = document.getElementById('member_password_ver').value;

		if (confirmpassword != password) {
			alert('password가 일치하지 않습니다.');
			return false;
		} else {
			return true;
		}
	}

	document.addEventListener('DOMContentLoaded', function() {
		var today = new Date();
		var day = today.getDate().toString().padStart(2, '0'); // 날짜를 2자리로 포매팅
		var month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월을 2자리로 포매팅
		var year = today.getFullYear();
		var currentDate = year + '-' + month + '-' + day; // yyyy-MM-dd 형식으로 조합

		var dateInput = document.getElementById('member_start_date');
		if (dateInput) {
			dateInput.value = currentDate; // 입력 필드에 오늘 날짜 설정
		} else {
			console.error('Date input field not found');
		}
		document.getElementById('member_start_date').value = currentDate; // 입력 필드에 오늘 날짜 설정
	});

	//최종검수
	function finalValidation() {
		//인증번호
		event.preventDefault(); // 폼의 기본 제출 동작을 중단

		var certificationNumber = document
				.getElementById('member_certification_number');
		if (certificationNumber.value.trim() === '') {
			alert('인증번호를 입력해주세요.');
			certificationNumber.focus();
			return false;
		}

		//비번검사
		if (!confirmPassword()) {
			return false; // 비밀번호 일치 검사
		}

		//ID점검 진행
		var currentId = document.getElementById('member_name').value;
		var validatedId = document.getElementById('validatedIdValue').value;

		if (currentId !== validatedId) {
			alert('ID 중복 검사를 완료해주세요.');
			return false;
		}

		var currentEmail = document.getElementById('member_email').value;
		var validatedEmail = document.getElementById('validatedEmailValue').value;

		// 이메일 인증 검사 결과를 확인
		if (validatedEmail !== currentEmail) {
			alert('이메일 인증을 완료해주세요.');
			return false;
		}

		alert('이메일 중복 검사완료.');

		var Checknum = document.getElementById('validatedCertNumValue').value;
		console.log(Checknum);
		if (Checknum == null) {
			return false;
		}
				event.target.submit(); // 폼 제출

			    return true; // 모든 검사를 통과한 경우
	}
</script>
</html>