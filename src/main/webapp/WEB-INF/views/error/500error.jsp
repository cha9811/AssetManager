<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/home/ErrorStyle.css">
<%@ page isErrorPage="true" %>
<body>
    <section id="error-space">
        <div class="image-container">
            <img src="../resources/CSS/img/error_img.jpg" alt="에러 이미지">
            <div class="text-overlay">
                <h1><%= response.getStatus() %> ERROR</h1>
                <p>무언가 에러가 발생하였습니다!</p>
                <p>이전 페이지로 돌아가주세요</p>
                <p>에러 코드 : <%= response.getStatus() %></p>
                <p>에러 메시지 : <%= exception != null ? exception.getMessage() : "내부 서버 오류가 발생했습니다." %></p>
                <button>
                    <a href="${pageContext.request.contextPath}/home">홈으로</a>
                </button>
            </div>
        </div>
    </section>
</body>
</html>