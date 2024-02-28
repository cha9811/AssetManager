<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	안녕하세용1
	<table class="board-table">
		<thead>
			<tr>
				<th>제목</th>
				<th>주요내용</th>
				<th>소요시간</th>
				<th>카테고리</th>
				<th>리워드</th>
			</tr>
		</thead>
		<c:forEach items="${allAssets}" var="vo">
			<thead>
			<tbody>
				<tr class="clickable-row"
					data-href="<c:url value='surveydetail?id=${vo.main_id}'/>">
					<td>${vo.asset_id}</td>
					<td>${vo.asset_category}</td>
					<td>${vo.asset_major_category}분</td>
					<td>${vo.asset_middle_category}</td>
					<td>${vo.asset_sub_category}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>

</body>
</html>