<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<title>Home</title>
<style>
nav {
	background-color: #f2f2f2;
	overflow: hidden;
}
nav ul {
    list-style-type: none; /* 기본 목록 스타일 제거 */
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #f2f2f2;
}
nav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
nav li {
    float: left; /* 각 항목을 가로로 정렬 */
}
nav a:hover {
	background-color: #ddd;
	color: black;
}
</style>

</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="assetlist">자산보기</a></li>
				<li><a href="deletedassetlist">삭제 자산 보기</a></li>
				<li><a href="loggout">로그아웃</a></li>
				<li><a href="loginPage">로그인</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>
