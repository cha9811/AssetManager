<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/asset/AssetStyle.css">

<body>
	<form action="assetUpdate">
		<table class="board-table">
			<thead>
				<tr>
					<th>삭제취소</th>
					<th>카테고리</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>자산명</th>
					<th>자산번호</th>
					<th>맥주소</th>
					<th>자산번호</th>
					<th>사용위치</th>
					<th>사용부서</th>
					<th>사용자</th>
					<th>LDAP</th>
					<th>자산가격</th>
					<th>구매일자</th>
					<th>불출일자</th>
					<th>반환일자</th>
					<th>주석</th>
				</tr>
			</thead>
			<c:forEach items="${allAssets}" var="vo">
				<thead>
				<tbody>
					<tr class="clickable-row"
						data-href="<c:url value='surveydetail?id=${vo.asset_id}'/>">
						<td style="text-align: center; vertical-align: middle;"><input
							type='checkbox' name='asset_deleted' value="1" /></td>
						<td><input class="input-size" value="${vo.asset_category}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_major_category}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_middle_category}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_sub_category}"></input></td>
						<td><input class="input-size" value="${vo.asset_name}"></input></td>
						<td><input class="input-size" value="${vo.serial_number}"></input></td>
						<td><input class="input-size" value="${vo.asset_mac_address}"></input></td>
						<td><input class="input-size" value="${vo.asset_number}"></input></td>
						<td><input class="input-size" value="${vo.asset_local}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_use_department}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_use_member_name}"></input></td>
						<td><input class="input-size" value="${vo.asset_LDAP}"></input></td>
						<td><input class="input-size" value="${vo.asset_price}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_acquisition_date}"></input></td>
						<td><input class="input-size"
							value="${vo.asset_disbursement_date}"></input></td>
						<td><input class="input-size" value="${vo.asset_return_date}"></input></td>
						<td><input class="input-size" value="${vo.asset_description}"></input></td>
					</tr>
				</tbody>
			</c:forEach>
		
		
		</table>
	</form>
	<button type="submit">적용하기</button>

</body>
<script>
	function addRow() {
		var tbody = document.getElementById("newTable");
		var newRow = tbody.insertRow();

		// 체크박스 셀
		var cell1 = newRow.insertCell(0);
		cell1.style.textAlign = "center";
		cell1.style.verticalAlign = "middle";
		cell1.innerHTML = '<input type="checkbox" name="asset_deleted" value="1" />';

		// 카테고리 셀
		var cell2 = newRow.insertCell(1);
		cell2.innerHTML = '<input class="input-size" name="asset_category" value="">';

		// 대분류 셀
		var cell3 = newRow.insertCell(2);
		cell3.innerHTML = '<input class="input-size" name="asset_major_category" value="">';

		// 중분류 셀
		var cell4 = newRow.insertCell(3);
		cell4.innerHTML = '<input class="input-size" name="asset_middle_category" value="">';

		// 소분류 셀
		var cell5 = newRow.insertCell(4);
		cell5.innerHTML = '<input class="input-size" name="asset_sub_category" value="">';

		// 자산명 셀
		var cell6 = newRow.insertCell(5);
		cell6.innerHTML = '<input class="input-size" name="asset_name" value="">';

		// 자산번호 셀
		var cell7 = newRow.insertCell(6);
		cell7.innerHTML = '<input class="input-size" name="serial_number" value="">';

		// 맥주소 셀
		var cell8 = newRow.insertCell(7);
		cell8.innerHTML = '<input class="input-size" name="asset_mac_address" value="">';

		// 자산번호 셀
		var cell9 = newRow.insertCell(8);
		cell9.innerHTML = '<input class="input-size" name="asset_number" value="">';

		// 사용위치 셀
		var cell10 = newRow.insertCell(9);
		cell10.innerHTML = '<input class="input-size" name="asset_local" value="">';

		// 사용부서 셀
		var cell11 = newRow.insertCell(10);
		cell11.innerHTML = '<input class="input-size" name="asset_use_department" value="">';

		// 사용자 셀
		var cell12 = newRow.insertCell(11);
		cell12.innerHTML = '<input class="input-size" name="asset_use_member_name" value="">';

		// LDAP 셀
		var cell13 = newRow.insertCell(12);
		cell13.innerHTML = '<input class="input-size" name="asset_LDAP" value="">';

		// 자산가격 셀
		var cell14 = newRow.insertCell(13);
		cell14.innerHTML = '<input class="input-size" name="asset_price" value="">';

		// 구매일자 셀
		var cell15 = newRow.insertCell(14);
		cell15.innerHTML = '<input class="input-size" name="asset_acquisition_date" value="">';

		// 불출일자 셀
		var cell16 = newRow.insertCell(15);
		cell16.innerHTML = '<input class="input-size" name="asset_disbursement_date" value="">';

		// 반환일자 셀
		var cell17 = newRow.insertCell(16);
		cell17.innerHTML = '<input class="input-size" name="asset_return_date" value="">';

		// 주석 셀
		var cell18 = newRow.insertCell(17);
		cell18.innerHTML = '<input class="input-size" name="asset_description" value="">';
	}
</script>

</html>