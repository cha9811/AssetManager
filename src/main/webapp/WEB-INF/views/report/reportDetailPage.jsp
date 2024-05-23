<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트 상세 페이지</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/report/ReportDetailStyle.css">


<body>

	<header>
		<h1>자산 변동내역 상세페이지</h1>
	</header>
	<section id="basepage">
   	 	<section id="date">기록시간 : ${reportlist[0].report_record_time}</section>

		<section id="article">
			<table class="board-table">
				<thead>
					<tr>
						<th>구분</th>
						<th>제목</th>
						<th>주요내용</th>
						<th>발신자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${reportlist}" var="report" varStatus="status">
							<td><section id="id">${status.index+1}</section></td>
							<td><section id="title">${report.report_title}</section></td>
							<td><section id="content">${report.report_content}</section></td>
							<td><section id="writer">${report.member_name}</section></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</section>
	</section>

</body>

</html>