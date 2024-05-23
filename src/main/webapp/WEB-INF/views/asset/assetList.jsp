<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/asset/AssetStyle.css">

<%@ include file="../header.jsp"%>
<section id="selectedSection">

	<div class="info-block">
		<span class="label">현재 셀:</span> <span id="selectedCell" class="value">없음</span>
	</div>
	<div class="info-block">
		<span class="label">값:</span> <span id="selectedContent" class="value">없음</span>
	</div>
	<section class="button-space">
		<button class="save-button" onclick="addRow()">셀 추가하기</button>
		<!-- 		<button class="save-button" type="submit" form="assetForm"> -->
		<button class="save-button" type="button" onclick="submitForm()">
			<img src="./resources/CSS/img/icon_saved.png">적용하기
		</button>
	</section>
</section>



<body>
	<section class="form-Section">
		<form id="assetForm" action="assetUpdate" method="post">
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
						<th>상태</th>
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


				<c:forEach items="${allAssets}" var="vo" varStatus="status">
					<tr class="clickable-row"
						data-href="<c:url value='surveydetail?id=${vo.asset_id}'/>">
						<td style="text-align: center; vertical-align: middle;">${status.index +1}</td>
						<td style="text-align: center; vertical-align: middle;"><input
							type='checkbox' name='assets[${status.index}].asset_deleted'
							data-row-index="${status.index}" data-col-index="0" /> <img
							id="detail_img_${vo.serial_number}" class="detail_img"
							src="./resources/CSS/img/icon_detail.png" alt="Detail Icon">
						</td>
						<input type="hidden" class="input-size"
							name="assets[${status.index}].asset_id" value="${vo.asset_id}" />
						<td><input class="input-size"
							name="assets[${status.index}].asset_category"
							value="${vo.asset_category}" autocomplete="off"
							data-row-index="${status.index}" data-col-index="1" />
						<td><input class="input-size"
							name="assets[${status.index}].asset_major_category"
							value="${vo.asset_major_category}" autocomplete="off"
							data-row-index="${status.index}" data-col-index="2" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_middle_category"
							value="${vo.asset_middle_category}" autocomplete="off"
							data-row-index="${status.index}" data-col-index="3" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_sub_category"
							value="${vo.asset_sub_category}" autocomplete="off"
							data-row-index="${status.index}" data-col-index="4" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_name"
							value="${vo.asset_name}" data-row-index="${status.index}"
							data-col-index="5" 
							id="asset-name-${status.index}"
							/></td>
						<td><input class="input-size"
							name="assets[${status.index}].serial_number"
							value="${vo.serial_number}" data-row-index="${status.index}"
							data-col-index="6" id="serial-number-${status.index}" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_mac_address"
							value="${vo.asset_mac_address}" data-row-index="${status.index}"
							data-col-index="7" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_number"
							value="${vo.asset_number}" data-row-index="${status.index}"
							data-col-index="8" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_local"
							value="${vo.asset_local}" data-row-index="${status.index}"
							data-col-index="9" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_use_department"
							value="${vo.asset_use_department}" autocomplete="off"
							data-row-index="${status.index}" data-col-index="10" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_use_member_name"
							value="${vo.asset_use_member_name}"
							data-row-index="${status.index}" data-col-index="11" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_LDAP"
							value="${vo.asset_LDAP}" data-row-index="${status.index}"
							data-col-index="12" /></td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_price"
							value="${vo.asset_price}" data-row-index="${status.index}"
							data-col-index="13" /></td>
						<td><input type="date" class="input-size"
							name="assets[${status.index}].asset_acquisition_date"
							value="${vo.formattedAssetAcquisitionDate}"
							data-row-index="${status.index}" data-col-index="14"
							id="asset-acquisition-date-${status.index}" /></td>

						<td><input type="date" class="input-size"
							name="assets[${status.index}].asset_disbursement_date"
							value="${vo.formattedAssetDisbursementDate}"
							data-row-index="${status.index}" data-col-index="15" /></td>
						<td><input type="date" class="input-size"
							name="assets[${status.index}].asset_return_date"
							value="${vo.formattedAssetReturnDate}" data-row-index="${status.index}"
							data-col-index="16" 
							           <c:if test="${empty vo.asset_disbursement_date}">disabled</c:if> />
							</td>
						<td><input class="input-size"
							name="assets[${status.index}].asset_description"
							value="${vo.asset_description}" data-row-index="${status.index}"
							data-col-index="17"/></td>
					</tr>
				</c:forEach>

				<tbody id="newTable" data-rows-count="${allAssets.size()}">

				</tbody>


			</table>
		</form>
	</section>
	<section id="asset-detail-space" style="display: none;">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close-button">x</span>
				<h2>자산변동기록</h2>
			</div>
			<section class="detail-space">
				<table class="detail-board-table">
					<thead>
						<tr>
							<th class="th-small">구분</th>
							<th class="th-small">제목</th>
							<th class="th-medium">주요내용</th>
							<th class="th-small">작업자</th>
							<th class="th-medium">주석</th>
						</tr>
					</thead>
					<tbody>
<%-- 						<c:forEach items="${reportlist}" var="report" varStatus="status"> --%>
<!-- 							<tr> -->
<%-- 								<td><section id="id">${status.index+1}</section></td> --%>
<%-- 								<td><section id="title">${report.report_title}</section></td> --%>
<%-- 								<td><section id="content">${report.report_content}</section></td> --%>
<%-- 								<td><section id="writer">${report.member_name}</section></td> --%>
<%-- 								<td><section id="description">${report.asset_description}</section></td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
					</tbody>
				</table>
			</section>
		</div>
	</section>


</body>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script>
var stompClient = null;
var currentUserId = generateUUID();

function connect() {
    var socket = new SockJS('/assetmanager/asset_status'); 
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
    	 stompClient.subscribe('/user/queue/initialEditStatus', function(message) {
             var statuses = JSON.parse(message.body);
             statuses.forEach(status => {
                 onEditCellEventReceived(status); 
             });
         });
        stompClient.subscribe('/topic/editCellEvent', onEditCellEventReceived);
        stompClient.subscribe('/topic/assets', function(message) {
       });
    });
    
}

function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}


function onEditCellEventReceived(payload) {
    var editEvent = JSON.parse(payload.body);
    if (editEvent.type === 'editStart') {

        var rowIndex = editEvent.rowIndex;
        var colIndex = editEvent.colIndex;
        var editingUser = editEvent.username; 
        var cellSelector = 'input[data-row-index="' + rowIndex + '"][data-col-index="' + colIndex + '"]';        
        var cell = document.querySelector(cellSelector);
      
        if (editEvent.userId !== currentUserId) { 
            if (cell) {
                 cell.classList.add('editing');
                cell.disabled = true; 

                if (cell.parentNode.querySelectorAll('.edit-label').length === 0) {

                	 var userLabel = document.createElement('span');
                     userLabel.textContent = editingUser + "가 수정 중입니다.";
                     userLabel.className = 'edit-label';
                     userLabel.style.visibility = 'hidden';
                     userLabel.style.opacity = '0';
                     cell.parentNode.insertBefore(userLabel, cell.nextSibling);
                    
                cell.onmouseover = function() {
                    userLabel.style.visibility = 'visible';
                    userLabel.style.opacity = '1';
                };
                cell.onmouseout = function() {
                    userLabel.style.visibility = 'hidden';
                    userLabel.style.opacity = '0';
                };
               
            }
                }
        }
    }
}

document.addEventListener('DOMContentLoaded', function() {
    var inputs = document.querySelectorAll('.input-size.editing');
    inputs.forEach(function(input) {
        var span = document.createElement('span');
        span.textContent = "test2가 수정 중입니다."; 
        span.className = 'edit-label';
        document.body.appendChild(span);

        input.addEventListener('mouseover', function() {
            var rect = input.getBoundingClientRect();
            span.style.position = 'absolute';
            span.style.left = (rect.left + window.scrollX) + 'px'; 
            span.style.top = (rect.bottom + window.scrollY) + 'px'; 
            span.style.display = 'block';
        });

        input.addEventListener('mouseout', function() {
            span.style.display = 'none';
        });
    });
});


function sendCellEditStart(rowIndex, colIndex) {
    if (stompClient) {
        var editEvent = {
            type: 'editStart',
            rowIndex: rowIndex,
            colIndex: colIndex,
            userId: currentUserId, 
            timestamp: new Date()
        };
        stompClient.send("/app/editCell", {}, JSON.stringify(editEvent));
    }
}



document.addEventListener('DOMContentLoaded', function() {
    connect();
    document.querySelectorAll('input.input-size').forEach(function(input, index) {
        input.addEventListener('focus', function(event) {
            const rowIndex = this.getAttribute('data-row-index');
            const colIndex = this.getAttribute('data-col-index');
            sendCellEditStart(rowIndex, colIndex);
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const inputs = document.querySelectorAll('input.input-size');
    inputs.forEach(function(input) {
        input.addEventListener('input', function() {
            this.classList.add('changed-input');
        });
    });
});

document.getElementById("assetForm").addEventListener("submit", function(event) {
    event.preventDefault(); 
    submitForm(); 

});
function submitForm() {

if (validateForm()) {
        const assets = []; 

        document.querySelectorAll(".board-table tbody tr").forEach(function(row, index) {
            let asset = {
                asset_id: (row.querySelector("[name='assets["+ index +"].asset_id']") || {}).value || -1,
                asset_category: (row.querySelector("[name='assets["+ index +"].asset_category']") || {}).value || "",
                asset_major_category: (row.querySelector("[name='assets["+ index +"].asset_major_category']") || {}).value || "",
                asset_middle_category: (row.querySelector("[name='assets["+ index +"].asset_middle_category']") || {}).value || "",
                asset_sub_category: (row.querySelector("[name='assets["+ index +"].asset_sub_category']") || {}).value || "",            
                asset_name: (row.querySelector("[name='assets["+ index +"].asset_name']") || {}).value || "",
                serial_number: (row.querySelector("[name='assets["+ index +"].serial_number']") || {}).value || "",
                asset_mac_address: (row.querySelector("[name='assets["+ index +"].asset_mac_address']") || {}).value || "",
                asset_number: (row.querySelector("[name='assets["+ index +"].asset_number']") || {}).value || "",
                asset_local: (row.querySelector("[name='assets["+ index +"].asset_local']") || {}).value || "",
                asset_use_department: (row.querySelector("[name='assets["+ index +"].asset_use_department']") || {}).value || "",
                asset_use_member_name: (row.querySelector("[name='assets["+ index +"].asset_use_member_name']") || {}).value || "",
                asset_LDAP: (row.querySelector("[name='assets["+ index +"].asset_LDAP']") || {}).value || "",
                asset_price: (row.querySelector("[name='assets["+ index +"].asset_price']") || {}).value || "",
                asset_acquisition_date: (row.querySelector("[name='assets["+ index +"].asset_acquisition_date']") || {}).value || "",
                asset_disbursement_date: (row.querySelector("[name='assets["+ index +"].asset_disbursement_date']") || {}).value || "",
                asset_return_date: (row.querySelector("[name='assets["+ index +"].asset_return_date']") || {}).value || "",
                asset_description: (row.querySelector("[name='assets["+ index +"].asset_description']") || {}).value || "",
                asset_deleted: (row.querySelector("[name='assets["+ index +"].asset_deleted']") || {}).checked ? false : true
            };
            assets.push(asset);
        });

        fetch("/assetmanager/assetUpdate", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(assets),
        })
        .then(response => response.json())
        .then(data => {
            alert("반영이 완료되었습니다.");
            location.reload(); 
        })
        .catch((error) => {
            console.error("Error:", error);
        });
    }
}

function addRow() {
		var tbody = document.getElementById("newTable");
	    var currentRowsCount = parseInt(tbody.getAttribute('data-rows-count')) || 0;
	    var rowIndex = currentRowsCount+1;
	    var rowIndex2 = rowIndex-1;
	    var newRow = tbody.insertRow();
	    newRow.setAttribute('data-href', '#');  

	    var cellIndex = newRow.insertCell(0);
	    cellIndex.style.textAlign = "center";
	    cellIndex.style.verticalAlign = "middle";
	    cellIndex.innerHTML = rowIndex; 

	    
	    var cell1 = newRow.insertCell(1);
	    cell1.style.textAlign = "center";
	    cell1.style.verticalAlign = "middle";
	    cell1.innerHTML = '<input type="checkbox" name="assets[' + rowIndex2 + ']asset_deleted" autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="1">';

	    
		var cell2 = newRow.insertCell(2);
		cell2.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_category"   autocomplete="off" data-row-index="' + rowIndex2 + '" data-col-index="2">';

		var cell3 = newRow.insertCell(3);
		cell3.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_major_category"   autocomplete="off" data-row-index="' + rowIndex2 + '"data-col-index="3">';

var cell4 = newRow.insertCell(4);
cell4.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_middle_category"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="4">';

var cell5 = newRow.insertCell(5);
cell5.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_sub_category"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="5">';

var cell6 = newRow.insertCell(6);
cell6.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_name"   value="" autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="6" id="asset-name-'+rowIndex2+'">';

var cell7 = newRow.insertCell(7);
cell7.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].serial_number" value="" autocomplete="off" data-row-index="' + rowIndex2 + '" data-col-index="7" id="serial-number-' + rowIndex2 + '">';


var cell8 = newRow.insertCell(8);
cell8.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_mac_address"  autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="8">';

var cell9 = newRow.insertCell(9);
cell9.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_number"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="9">';

var cell10 = newRow.insertCell(10);
cell10.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_local"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="10">';

var cell11 = newRow.insertCell(11);
cell11.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_use_department"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="11">';


var cell12 = newRow.insertCell(12);
cell12.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_use_member_name"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="12">';

var cell13 = newRow.insertCell(13);
cell13.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_LDAP"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="13">';

var cell14 = newRow.insertCell(14);
cell14.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_price"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="14">';

var cell15 = newRow.insertCell(15);
cell15.innerHTML = '<input type="date" class="input-size" name="assets[' + rowIndex2 + '].asset_acquisition_date" value="" autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="15" id="asset-acquisition-date-' + rowIndex2 + '">';

var cell16 = newRow.insertCell(16);
cell16.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_disbursement_date"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="16" disabled>';

var cell17 = newRow.insertCell(17);
cell17.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_return_date"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="17" disabled>';

var cell18 = newRow.insertCell(18);
cell18.innerHTML = '<input class="input-size" name="assets[' + rowIndex2 + '].asset_description"   autocomplete="off" data-row-index="' + rowIndex2 + ' data-col-index="18">';		
updateInputsGrid(); 

	    tbody.setAttribute('data-rows-count', rowIndex); 
	    

		
	}
 
    document.addEventListener('DOMContentLoaded', function() {
        initColumnWidthAdjustment();
        initRowHeightAdjustment();
        updateInputsGrid();
        initFocusManagement();
        adjustColumnWidthOnDoubleClick();       
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
        var table = document.querySelector('.board-table'); 
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
 
 
 
 
    function focusInputByIndex(rowIndex, colIndex) {
        if (rowIndex >= 0 && rowIndex < inputsGrid.length && colIndex >= 0 && colIndex < inputsGrid[rowIndex].length) {
            inputsGrid[rowIndex][colIndex].focus();
            currentRow = rowIndex;
            currentCol = colIndex;
        }
    }

    function updateInputsGrid() {        
        inputsGrid = []; 
        const rows = document.querySelectorAll('tr');
        rows.forEach((row, rowIndex) => {
            let rowInputs = row.querySelectorAll('input.input-size');
            inputsGrid[rowIndex] = Array.from(rowInputs);

            rowInputs.forEach((input, colIndex) => {
                const handleFocus = () => {
                    currentRow = rowIndex;
                    currentCol = colIndex;
                    document.getElementById('selectedCell').textContent = '행 : ' + rowIndex + ', 열 : ' + (currentCol+1);
                    document.getElementById('selectedContent').textContent = input.value;
                };


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
            let currentInput = document.activeElement;
            let isInputField = currentInput.classList.contains('input-size');
            let newRow = parseInt(currentRow, 10);
            let newCol = parseInt(currentCol, 10);

            if (isInputField && ['ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
                let moveFocus = false;
                let cursorAtStart = currentInput.selectionStart === 0;
                let cursorAtEnd = currentInput.selectionEnd === currentInput.value.length;

                switch (e.key) {
                    case 'ArrowLeft':
                        if (cursorAtStart || currentInput.selectionStart !== currentInput.selectionEnd) {
                            newCol = Math.max(0, newCol - 1);
                            moveFocus = true;
                        }
                        break;
                    case 'ArrowRight':
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
                    focusInputByIndex(newRow, newCol);
                    e.preventDefault();
                }
            }
        });
    }
    
    function adjustColumnWidthOnDoubleClick() {
        const thElements = document.querySelectorAll('th');
        thElements.forEach((th, columnIndex) => {
            th.addEventListener('dblclick', function() {
                let totalLength = 0; 

                document.querySelectorAll(`tr`).forEach(row => {
                    const cell = row.cells[columnIndex];
                    if (cell && cell.querySelector('input')) {
                        const input = cell.querySelector('input');
                        const value = input.value;
                        let textLength = calculateTextLength(value); 
                        totalLength = Math.max(totalLength, textLength); 
                    }
                });

                let maxWidth = Math.max(totalLength, 100); 
                th.style.width = maxWidth + 'px'; 
            });
        });
    }

    function calculateTextLength(text) {
        let textLength = 0;
        for (let char of text) {
            if (char.match(/[A-Za-z0-9]/)) {
                textLength += 9; 
            } else {
                textLength += 15.3; 
            }
        }
        return textLength;
    }
    
    function focusFirstInput() {
        var firstInput = document.querySelector('tr input.input-size');
        if (firstInput) {
            firstInput.focus();
            let row = firstInput.closest('tr');
            let rowIndex = row ? row.rowIndex : -1;
            let colIndex = firstInput.closest('td') ? firstInput.closest('td').cellIndex : -1;
        }
    }
        $(document).ready(function() {
            $(".detail_img").click(function() {
                var serialNumber = $(this).attr("id").split("_")[2];
                
              
                $.ajax({
                	url: "aeestReportDetail/" + serialNumber, 
                    type: "GET",
                    data: { serial_number: serialNumber }, 
                    success: function(response) {
                        var contentHtml = "";
                        response.forEach(function(report, index) {
                            contentHtml += "<tr>" +
                                "<td><section id='id'>" + (index + 1) + "</section></td>" +
                                "<td><section id='title'>" + report.report_title + "</section></td>" +
                                "<td><section id='content'>" + report.report_content + "</section></td>" +
                                "<td><section id='writer'>" + report.member_name + "</section></td>" +
                                "<td><section id='description'>" + (report.asset_description ? report.asset_description : "") + "</section></td>";                                "</tr>";
                        });
                        $("#asset-detail-space .detail-board-table tbody").html(contentHtml);
                        $("#modal-overlay").show();
                        $("#asset-detail-space").show();
                    },
                    error: function(xhr, status, error) {
                        alert("해당 번호에 해당하는 기록이 없습니다.");
                    }
                });
            });
            $(".close-button").click(function() {
                $("#asset-detail-space").hide();
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            var assetRows = document.querySelectorAll('tr[data-href]');

            assetRows.forEach(function(row) {
                var index = row.querySelector('input[name$=".asset_acquisition_date"]').dataset.rowIndex;
                var acquisitionDate = document.getElementById('asset-acquisition-date-' + index);
                var disbursementDate = document.getElementById('asset-disbursement-date-' + index);
                var returnDate = document.getElementById('asset-return-date-' + index);
if (acquisitionDate && acquisitionDate.value) { 
            if (disbursementDate) {
                disbursementDate.disabled = false; 
            }
            if (returnDate) {
                returnDate.disabled = false; 
            }
        }
            });
        });
        
        function validateForm() {
            var isValid = true;
            var errorMsg = "";

            document.querySelectorAll('tr[data-href]').forEach(function (row) {
                var index = row.querySelector('input[name$=".serial_number"]').dataset.rowIndex;
                var serialNumber = document.getElementById('serial-number-' + index);
                var acquisitionDate = document.getElementById('asset-acquisition-date-' + index);
                var assetName = document.getElementById('asset-name-' + index);

                if (!assetName || !assetName.value) {
                    isValid = false;
                    errorMsg += (parseInt(index) + 1) + "번째 자산명 비어있습니다.\n";
                }
                
                if (!serialNumber || !serialNumber.value) {
                    isValid = false;
                    errorMsg += (parseInt(index) + 1) + "번째 자산번호 행이 비어있습니다.\n";
                }

                if (!acquisitionDate || !acquisitionDate.value) {
                    isValid = false;
                    errorMsg += (parseInt(index) + 1) +"구매일자가 비었습니다.\n";
                }
            });

            if (!isValid) {
                alert(errorMsg);
            }

            return isValid;
        }
        
</script>


</html>