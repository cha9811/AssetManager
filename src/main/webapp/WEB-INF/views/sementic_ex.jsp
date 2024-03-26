<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시맨틱 태그 예제 페이지</title>
</head>
<body>

<header>
    <h1>웹 페이지의 제목</h1>
    <nav>
        <ul>
            <li><a href="#main">메인</a></li>
            <li><a href="#articles">기사</a></li>
            <li><a href="#contact">연락처</a></li>
        </ul>
    </nav>
</header>

<main id="main">
    <article id="articles">
        <h2>블로그 게시물</h2>
        <section>
            <h3>게시물 제목</h3>
            <p>게시물 내용...</p>
        </section>
        <aside>관련 정보나 링크</aside>
    </article>

    <article>
        <h2>뉴스 기사</h2>
        <figure>
            <img src="news-image.jpg" alt="뉴스 이미지">
            <figcaption>뉴스 이미지 설명</figcaption>
        </figure>
        <p>뉴스 내용...</p>
    </article>
</main>

<details>
    <summary>더 보기</summary>
    <p>추가 정보...</p>
</details>

<footer>
    <p>연락처 정보</p>
    <time datetime="2023-01-01">2023년 1월 1일</time>
</footer>

</body>
</html>
