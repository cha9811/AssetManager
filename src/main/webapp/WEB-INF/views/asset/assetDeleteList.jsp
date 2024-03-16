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
	<form>
		<button id="submitFormButton" type="submit">적용하기</button>
		<button type="button" onclick="addRow()">행 추가</button>
		<table class="board-table">
			<thead>
				<tr>
					<th>취소</th>
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
						<td style="text-align: center; vertical-align: middle;">
<!-- 						<input type="hidden" name="asset_deleted" value="1"> -->
						<input type='checkbox' name='asset_deleted' value="0" onclick="this.form.asset_deleted.value=this.checked?0:1;"/>
						
						 <input
							type="hidden" name="asset_id" value="${vo.asset_id}"></td>
						<td><input class="input-size" name="asset_category"
							value="${vo.asset_category}"></input></td>
						<td><input class="input-size" name="asset_major_category"
							value="${vo.asset_major_category}"></input></td>
						<td><input class="input-size" name="asset_middle_category"
							value="${vo.asset_middle_category}"></input></td>
						<td><input class="input-size" name="asset_sub_category"
							value="${vo.asset_sub_category}"></input></td>
						<td><input class="input-size" name="asset_name"
							value="${vo.asset_name}"></input></td>
						<td><input class="input-size" name="serial_number"
							value="${vo.serial_number}"></input></td>
						<td><input class="input-size" name="asset_mac_address"
							value="${vo.asset_mac_address}"></input></td>
						<td><input class="input-size" name="asset_number"
							value="${vo.asset_number}"></input></td>
						<td><input class="input-size" name="asset_local"
							value="${vo.asset_local}"></input></td>
						<td><input class="input-size" name="asset_use_department"
							value="${vo.asset_use_department}"></input></td>
						<td><input class="input-size" name="asset_use_member_name"
							value="${vo.asset_use_member_name}"></input></td>
						<td><input class="input-size" name="asset_LDAP"
							value="${vo.asset_LDAP}"></input></td>
						<td><input class="input-size" name="asset_price"
							value="${vo.asset_price}"></input></td>
						<td><input class="input-size" name="asset_acquisition_date"
							value="${vo.asset_acquisition_date}"></input></td>
						<td><input class="input-size" name="asset_disbursement_date"
							value="${vo.asset_disbursement_date}"></input></td>
						<td><input class="input-size" name="asset_return_date"
							value="${vo.asset_return_date}"></input></td>
						<td><input class="input-size" name="asset_description"
							value="${vo.asset_description}"></input></td>
					</tr>
				</tbody>
			</c:forEach>
			<tbody id="newTable">
		</table>
	</form>


</body>
<script>
	function addRow() {
		for(let i =0; i<10; i++){
		var tbody = document.getElementById("newTable");
		var newRow = tbody.insertRow();

		var cell1 = newRow.insertCell(0);
		cell1.style.textAlign = "center";
		cell1.style.verticalAlign = "middle";
		cell1.innerHTML = '<input type="checkbox" name="asset_deleted" value="1" /> <input type="hidden" name="asset_id" value="">';

		// 카테고리 셀
		var cell2 = newRow.insertCell(1);
		cell2.innerHTML = '<input class="input-size" name="asset_category" value="">';

		// 대분류 셀
		var cell3 = newRow.insertCell(2);
		cell3.innerHTML = '<input class="input-size" name="asset_major_category" value="">';

		// 중분류 셀 (수정됨: 인덱스를 4에서 3으로 변경)
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
		}
	document.addEventListener("DOMContentLoaded", function() {
		 document.getElementById("submitFormButton").addEventListener("click", function(e) {
		        e.preventDefault(); // 폼 기본 제출 방지
		        submitAssets();
		    });
		});
	
	function submitAssets() {
	    var assets = []; // JSON 객체를 저장할 배열 생성
	   
	    document.querySelectorAll(".board-table tbody tr").forEach(function(row) {
	        console.log(document);
	    	var asset = {
	        	asset_id: row.querySelector("input[name='asset_id']").value,
	            asset_category: row.querySelector("input[name='asset_category']").value,
	            asset_major_category: row.querySelector("input[name='asset_major_category']").value,
	            asset_middle_category: row.querySelector("input[name='asset_middle_category']").value,
	            asset_sub_category: row.querySelector("input[name='asset_sub_category']").value,
	            asset_name: row.querySelector("input[name='asset_name']").value,
	            serial_number: row.querySelector("input[name='serial_number']").value,
	            asset_mac_address: row.querySelector("input[name='asset_mac_address']").value,
	            asset_number: row.querySelector("input[name='asset_number']").value,
	            asset_local: row.querySelector("input[name='asset_local']").value,
	            asset_use_department: row.querySelector("input[name='asset_use_department']").value,
	            asset_use_member_name: row.querySelector("input[name='asset_use_member_name']").value,
	            asset_LDAP: row.querySelector("input[name='asset_LDAP']").value,
	            asset_price: row.querySelector("input[name='asset_price']").value,
	            asset_acquisition_date: row.querySelector("input[name='asset_acquisition_date']").value,
	            asset_disbursement_date: row.querySelector("input[name='asset_disbursement_date']").value,
	            asset_return_date: row.querySelector("input[name='asset_return_date']").value,
	            asset_description: row.querySelector("input[name='asset_description']").value,
	            asset_deleted: row.querySelector("input[name='asset_deleted']").checked
	    	};
	        assets.push(asset);
	        console.log(assets)
	    });
		
	    // AJAX 요청으로 서버에 데이터 제출
	    fetch('/assetmanager/assetUpdate', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify(assets), // 배열을 JSON 문자열로 변환

	    })
	    .then(response => response.json())
	    .then(data => {
    console.log('Success:', data);
    window.location.href = '/assetmanager/deletedassetlist';
})
	    .catch((error) => console.error('Error:', error));
	}  
	
</script>

</html>