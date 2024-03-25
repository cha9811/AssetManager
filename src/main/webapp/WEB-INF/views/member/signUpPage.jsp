<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/member/signUpStyle.css">


<body>
	<main>
		<form action="signUp" method="POST">
			<fieldset>
				<legend>회원 정보 입력</legend>
								    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
<label for="member_name">ID</label> 
<input id="member_name" type="text" name="member_name" value="1" required />

<label for="member_password">비밀번호</label> 
<input id="member_password" type="password" name="member_password" value="1" required />

<label for="member_password_ver">비밀번호 검증</label> 
<input id="member_password_ver" type="password" name="member_password_ver" value="1" required />

<label for="member_username">이름</label> 
<input id="member_username" type="text" name="member_username" required />

<label for="member_department">부서</label> 
<input id="member_department" type="text" name="member_department" value="1" required />

<label for="member_local">근무동</label> 
<input id="member_local" type="text" name="member_local" value="1" required />

<label for="member_start_date">입사일</label> 
<input id="member_start_date" type="date" name="member_start_date" value="1" required />

<label for="member_LDAP">LDAP</label> 
<input id="member_LDAP" type="text" name="member_LDAP" value="1" required />

<label for="member_role">역할</label> 
<input id="member_role" type="text" name="member_role" value="1" required />

<label for="member_team">팀</label> 
<input id="member_team" type="text" name="member_team" value="1" required />

<label for="member_phone_number">전화번호</label> 
<input id="member_phone_number" type="tel" name="member_phone_number" required />
    <label for="member_phone_number">전화번호</label> <input id="member_phone_number" type="tel" required />
			</fieldset>
			<div class="button-container">
				<button type="submit">제출</button>
				<button type="reset">초기화</button>
			</div>
		</form>
	</main>
</body>
</html>