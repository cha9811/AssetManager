<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 자산 리스트</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/asset/AssetStyle.css">

<body>

	<section>
	현재 선택된 셀 : <span id="selectedCell">없음</span><br>
    내용 : <span id="selectedContent">없음</span>
    
	</section>
	<form action="assetUpdate" method="post">
	
		<table class="board-table">
			<thead>
				<tr>
				<th>구분</th>
					<th>삭제</th>
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

				
<div id="loadingMessage" style="display: none;">데이터를 가져오는 중...</div>
<div id="dataContainer"></div>
<c:forEach items="${allAssets}" var="vo" varStatus="status">
    <tr class="clickable-row" data-href="<c:url value='surveydetail?id=${vo.asset_id}'/>">
        <td style="text-align: center; vertical-align: middle;">${status.index +1}</td>
        <td style="text-align: center; vertical-align: middle;"><input type='checkbox' name='asset_deleted' value="1" data-row-index="${status.index}" data-col-index="0"/></td>
        <td><input class="input-size" name="asset_category" value="${vo.asset_category}" autocomplete="off" data-row-index="${status.index}" data-col-index="1"/></td>
        <td><input class="input-size" name="asset_major_category" value="${vo.asset_major_category}" data-row-index="${status.index}" data-col-index="2"/></td>
        <td><input class="input-size" name="asset_middle_category" value="${vo.asset_middle_category}" autocomplete="off" data-row-index="${status.index}" data-col-index="3"/></td>
        <td><input class="input-size" name="asset_sub_category" value="${vo.asset_sub_category}" autocomplete="off" data-row-index="${status.index}" data-col-index="4"/></td>
        <td><input class="input-size" name="asset_name" value="${vo.asset_name}" data-row-index="${status.index}" data-col-index="5"/></td>
        <td><input class="input-size" name="serial_number" value="${vo.serial_number}" data-row-index="${status.index}" data-col-index="6"/></td>
        <td><input class="input-size" name="asset_mac_address" value="${vo.asset_mac_address}" data-row-index="${status.index}" data-col-index="7"/></td>
        <td><input class="input-size" name="asset_number" value="${vo.asset_number}" data-row-index="${status.index}" data-col-index="8"/></td>
        <td><input class="input-size" name="asset_local" value="${vo.asset_local}" data-row-index="${status.index}" data-col-index="9"/></td>
        <td><input class="input-size" name="asset_use_department" value="${vo.asset_use_department}" autocomplete="off" data-row-index="${status.index}" data-col-index="10"/></td>
        <td><input class="input-size" name="asset_use_member_name" value="${vo.asset_use_member_name}" data-row-index="${status.index}" data-col-index="11"/></td>
        <td><input class="input-size" name="asset_LDAP" value="${vo.asset_LDAP}" data-row-index="${status.index}" data-col-index="12"/></td>
        <td><input class="input-size" name="asset_price" value="${vo.asset_price}" data-row-index="${status.index}" data-col-index="13"/></td>
        <td><input class="input-size" name="asset_acquisition_date" value="${vo.asset_acquisition_date}" data-row-index="${status.index}" data-col-index="14"/></td>
        <td><input class="input-size" name="asset_disbursement_date" value="${vo.asset_disbursement_date}" data-row-index="${status.index}" data-col-index="15"/></td>
        <td><input class="input-size" name="asset_return_date" value="${vo.asset_return_date}" data-row-index="${status.index}" data-col-index="16"/></td>
        <td><input class="input-size" name="asset_description" value="${vo.asset_description}" data-row-index="${status.index}" data-col-index="17"/></td>
    </tr>
</c:forEach>

<tbody id="newTable" data-rows-count="${allAssets.size()}">
		
		</tbody>
		    <button type="submit">적용하기</button>
		
		</table>
	</form>
<button onclick="addRow()">셀 추가하기</button>

</body>
<%-- <script src="${pageContext.request.contextPath}/resources/JS/JsonTest.js"> --%>
<script>
	function addRow() {
		var tbody = document.getElementById("newTable");
	    var currentRowsCount = parseInt(tbody.getAttribute('data-rows-count')) || 0;
	    var newIndex = currentRowsCount + 1;
	    var newRow = tbody.insertRow();

	    var cellIndex = newRow.insertCell(0);
	    cellIndex.style.textAlign = "center";
	    cellIndex.style.verticalAlign = "middle";
	    cellIndex.innerHTML = newIndex; // 행 인덱스를 바로 삽입

	    // 첫 번째 입력 필드 추가
	    var cell1 = newRow.insertCell(1);
	    cell1.style.textAlign = "center";
	    cell1.style.verticalAlign = "middle";
	    cell1.innerHTML = `<input type="checkbox" name="asset_deleted" value="1" autocomplete="off" data-row-index="${rowIndex}" data-col-index="1">`;

	    
		// 카테고리 셀
		var cell2 = newRow.insertCell(2);
		cell2.innerHTML = `<input class="input-size" name="asset_category" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="2">`;

// 	    // 대분류 셀
var cell3 = newRow.insertCell(3);
cell3.innerHTML = `<input class="input-size" name="asset_major_category" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="3">`;

// 중분류 셀
var cell4 = newRow.insertCell(4);
cell4.innerHTML = `<input class="input-size" name="asset_middle_category" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="4">`;

// 소분류 셀
var cell5 = newRow.insertCell(5);
cell5.innerHTML = `<input class="input-size" name="asset_sub_category" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="5">`;

// 자산명 셀
var cell6 = newRow.insertCell(6);
cell6.innerHTML = `<input class="input-size" name="asset_name" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="6">`;

// 자산번호 셀
var cell7 = newRow.insertCell(7);
cell7.innerHTML = `<input class="input-size" name="serial_number" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="7">`;

// 맥주소 셀
var cell8 = newRow.insertCell(8);
cell8.innerHTML = `<input class="input-size" name="asset_mac_address" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="8">`;

// 자산번호 셀
var cell9 = newRow.insertCell(9);
cell9.innerHTML = `<input class="input-size" name="asset_number" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="9">`;

// 사용위치 셀
var cell10 = newRow.insertCell(10);
cell10.innerHTML = `<input class="input-size" name="asset_local" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="10">`;

// 사용부서 셀
var cell11 = newRow.insertCell(11);
cell11.innerHTML = `<input class="input-size" name="asset_use_department" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="11">`;

// 사용자 셀
var cell12 = newRow.insertCell(12);
cell12.innerHTML = `<input class="input-size" name="asset_use_member_name" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="12">`;

// LDAP 셀
var cell13 = newRow.insertCell(13);
cell13.innerHTML = `<input class="input-size" name="asset_LDAP" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="13">`;

// 자산가격 셀
var cell14 = newRow.insertCell(14);
cell14.innerHTML = `<input class="input-size" name="asset_price" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="14">`;

// 구매일자 셀
var cell15 = newRow.insertCell(15);
cell15.innerHTML = `<input class="input-size" name="asset_acquisition_date" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="15">`;

// 불출일자 셀
var cell16 = newRow.insertCell(16);
cell16.innerHTML = `<input class="input-size" name="asset_disbursement_date" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="16">`;

// 반환일자 셀
var cell17 = newRow.insertCell(17);
cell17.innerHTML = `<input class="input-size" name="asset_return_date" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="17">`;

// 주석 셀
var cell18 = newRow.insertCell(18);
cell18.innerHTML = `<input class="input-size" name="asset_description" value="" autocomplete="off" data-row-index="${rowIndex}" data-col-index="18">`;		updateInputsGrid(); // 행을 추가할 때마다 입력 그리드 업데이트

	    tbody.setAttribute('data-rows-count', newIndex); // 여기가 중요한 변경점입니다.

		
	}
 
//  여기실행
// 코드 간소화
    document.addEventListener('DOMContentLoaded', function() {
        // 필드 크기 변경 및 레코드 크기 변경 이벤트 리스너 초기화
        
        initColumnWidthAdjustment();
        initRowHeightAdjustment();

        // 동적 입력 그리드 및 포커스 관리 기능 초기화
        updateInputsGrid();
        initFocusManagement();
        adjustColumnWidthOnDoubleClick();
        
        //1,1 focus목적
        focusFirstInput();
    });

    function initColumnWidthAdjustment() {
        const headers = document.querySelectorAll('th');
        headers.forEach(header => {
            let startX, startWidth;
            header.addEventListener('mousedown', function(e) {
                if (e.offsetX > header.offsetWidth - 10) {
                    startX = e.pageX;
                    startWidth = header.offsetWidth;
                    document.addEventListener('mousemove', onMouseMove);
                    document.addEventListener('mouseup', onMouseUp);
                }
            });
            function onMouseMove(e) {
                const newWidth = startWidth + e.pageX - startX;
                header.style.width = newWidth + 'px';
            }
            function onMouseUp() {
                document.removeEventListener('mousemove', onMouseMove);
                document.removeEventListener('mouseup', onMouseUp);
            }
        });
    }

    function initRowHeightAdjustment() {
        var table = document.querySelector('.board-table'); // 이벤트 위임을 위한 상위 요소 선택
        table.addEventListener('mousedown', function(e) {
            if (e.target && e.target.closest('td') && e.offsetY > e.target.closest('td').offsetHeight - 10) {
                const row = e.target.closest('tr');
                let startY = e.pageY;
                let startHeight = row.offsetHeight;
                function onMouseMove(e) {
                    const newHeight = startHeight + e.pageY - startY;
                    row.style.height = newHeight + 'px';
                }
                function onMouseUp() {
                    document.removeEventListener('mousemove', onMouseMove);
                    document.removeEventListener('mouseup', onMouseUp);
                }
                document.addEventListener('mousemove', onMouseMove);
                document.addEventListener('mouseup', onMouseUp);
            }
        });
    }
 
 
 
 
    //클릭된 셀 위치 저장목적
    function focusInputByIndex(rowIndex, colIndex) {
        if (rowIndex >= 0 && rowIndex < inputsGrid.length && colIndex >= 0 && colIndex < inputsGrid[rowIndex].length) {
            inputsGrid[rowIndex][colIndex].focus();
            currentRow = rowIndex;
            currentCol = colIndex;
        }
    }

 // 여기 작성
    function updateInputsGrid() {        
        inputsGrid = []; // 입력 그리드 초기화
        const rows = document.querySelectorAll('tr');
        rows.forEach((row, rowIndex) => {
            let rowInputs = row.querySelectorAll('input.input-size');
            inputsGrid[rowIndex] = Array.from(rowInputs);

            // 각 입력 필드에 대해 여러 이벤트 리스너 추가
            rowInputs.forEach((input, colIndex) => {
                // 입력 필드 선택 시 (클릭 또는 키보드 포커스 이동 포함)
                const handleFocus = () => {
                    currentRow = rowIndex;
                    currentCol = colIndex;
                    document.getElementById('selectedCell').textContent = '행 : ' + rowIndex + ', 열 : ' + (currentCol+1);
                    document.getElementById('selectedContent').textContent = input.value;
                };

                // 실시간 입력 감지
                const handleInput = () => {
                    document.getElementById('selectedContent').textContent = input.value;
                };

                input.addEventListener('click', handleFocus);
                input.addEventListener('focus', handleFocus);
                input.addEventListener('input', handleInput);
            });
        });
        
    }
 
    function initFocusManagement() {
        document.addEventListener('keydown', function(e) {
        	// 현재 포커스된 입력 필드와 그 위치
            let currentInput = document.activeElement;
            let isInputField = currentInput.classList.contains('input-size');
            let newRow = parseInt(currentRow, 10);
            let newCol = parseInt(currentCol, 10);

            // 현재 입력 필드가 포커스되어 있고, 화살표 키 중 하나가 눌렸는지 확인
            if (isInputField && ['ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
                let moveFocus = false;
                let cursorAtStart = currentInput.selectionStart === 0;
                let cursorAtEnd = currentInput.selectionEnd === currentInput.value.length;

                switch (e.key) {
                    case 'ArrowLeft':
                        // 커서가 시작점에 있거나 선택된 텍스트가 없을 때만 포커스 이동
                        if (cursorAtStart || currentInput.selectionStart !== currentInput.selectionEnd) {
                            newCol = Math.max(0, newCol - 1);
                            moveFocus = true;
                        }
                        break;
                    case 'ArrowRight':
                        // 커서가 끝점에 있거나 선택된 텍스트가 없을 때만 포커스 이동
                        if (cursorAtEnd || currentInput.selectionStart !== currentInput.selectionEnd) {
                            newCol = Math.min(inputsGrid[newRow].length - 1, newCol + 1);
                            moveFocus = true;
                        }
                        break;
                    case 'ArrowUp':
                        if (cursorAtStart || cursorAtEnd || currentInput.selectionStart !== currentInput.selectionEnd) {
                            newRow = Math.max(0, newRow - 1);
                            moveFocus = true;
                        }
                        break;
                    case 'ArrowDown':
                        if (cursorAtStart || cursorAtEnd || currentInput.selectionStart !== currentInput.selectionEnd) {
                            newRow = Math.min(inputsGrid.length - 1, newRow + 1);
                            moveFocus = true;
                        }
                        break;
                }

                if (moveFocus) {
                    // 새 위치로 포커스 이동
                    focusInputByIndex(newRow, newCol);
                    e.preventDefault(); // 기본 화살표 키 동작 방지
                }
            }
        });
    }
    
    function adjustColumnWidthOnDoubleClick() {
        const thElements = document.querySelectorAll('th');
        thElements.forEach((th, columnIndex) => {
            th.addEventListener('dblclick', function() {
                let totalLength = 0; // 가장 긴 텍스트 길이를 저장할 변수 초기화

                document.querySelectorAll(`tr`).forEach(row => {
                    const cell = row.cells[columnIndex];
                    if (cell && cell.querySelector('input')) {
                        const input = cell.querySelector('input');
                        const value = input.value;
                        let textLength = calculateTextLength(value); // 텍스트 길이 계산
                        totalLength = Math.max(totalLength, textLength); // 가장 긴 텍스트 길이 업데이트
                    }
                });

                // 가장 넓은 콘텐츠에 맞게 th 너비 조정
                let maxWidth = Math.max(totalLength, 100); // 최소 너비 보장
                th.style.width = maxWidth + 'px'; // 너비 설정
            });
        });
    }

    function calculateTextLength(text) {
        let textLength = 0;
        for (let char of text) {
            if (char.match(/[A-Za-z0-9]/)) {
                textLength += 9; // 영어와 숫자는 9로 계산
            } else {
                textLength += 15.3; // 한글과 그 외 문자는 15.3으로 계산
            }
        }
        return textLength;
    }
    
    function focusFirstInput() {
        // 첫 번째 행의 첫 번째 입력 필드를 선택합니다.
        var firstInput = document.querySelector('tr input.input-size');
        if (firstInput) {
            firstInput.focus();
            // 현재 포커스된 셀 위치 업데이트
            let row = firstInput.closest('tr');
            let rowIndex = row ? row.rowIndex : -1;
            let colIndex = firstInput.closest('td') ? firstInput.closest('td').cellIndex : -1;
            // 이 예제에서는 rowIndex와 colIndex를 직접 사용하지 않고 있으나,
            // 필요한 경우 이 값을 사용해 추가 로직을 구현할 수 있습니다.
        }
    }
</script>


</html>