<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
	<style>

        .nav {
            background-color: #f2f2f2;
            overflow: hidden;
        }
        .nav a {
            float: left;
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .nav a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
    
</head>
<body>

<div class="nav">
        <a href="assetlist">자산보기</a>
        <a href="deletedassetlist">삭제 자산 보기</a>
        <a href="loggout">로그아웃</a>
    </div>
</body>
</html>
