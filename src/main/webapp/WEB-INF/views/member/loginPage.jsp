<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
</head>
<body>
	로그인페이지
	<main>
		<form action="login">
			<fieldset>
				<legend>회원 정보 입력</legend>
				<label for="member_name">ID</label>
				<input id="member_name" name="username" type="text" required />
				<label for="member_password">비밀번호</label>
				<input id="member_password" name="password" type="password" required />
			</fieldset>
			<div class="button-container">
				<button type="submit">제출</button>
				<button type="reset">초기화</button>
			</div>
		</form>
	</main>
	<a href="signUpPage">sss</a>
</body>
</html>