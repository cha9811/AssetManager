<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트 페이지</title>
</head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/report/ReportStyle.css">


<body class="fade-in">

	<header id="main_title">
		<h1>월별 리포트</h1>
	</header>


	<section id="history_space">
		<h3>날짜지정</h3>
		<input type="date" id="base_date">
		<div id="date_controls">
			<button id="prev_date_btn" class="date-arrow" onclick=""><-</button>
			<span id="currentDate"></span>
			<button id="next_date_btn" class="date-arrow">-></button>
		</div>
	</section>

	<hr>
	<section id="report_backpage">
		<section class="report_article">
			<section class="date_space"></section>
			<c:forEach items="${reportList}" var="report" varStatus="status">
				<c:choose>
					<c:when test="${status.count <= 3}">
						<h3>
							<section class="report_title" data-title-index="${status.count}">
								<a href="reportDetail/${report.report_id}">${report.report_title}</a>
							</section>
						</h3>
						<section class="report_content">${report.report_content}</section>
						<section class="report_date">${report.report_record_time}</section>
						<div class="report-level"
							data-report-level="${report.report_level}"
							data-level-index="${status.count}">level:
							${report.report_level}</div>
					</c:when>
					<c:otherwise>
						<div class="incident-list" style="display: none;">
							<h3>
								<section class="report_title" data-title-index="${status.count}">
									<a href="reportDetail/${report.report_id}">${report.report_title}</a>
								</section>
							</h3>
							<section class="report_content">${report.report_content}</section>
							<section class="report_date">${report.report_record_time}</section>
							<%-- 							<div class="report-level">level: ${report.report_level}</div> --%>
							<div class="report-level"
								data-report-level="${report.report_level}"
								data-level-index="${status.count}">level:
								${report.report_level}</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${reportList.size() > 3}">
				<section class="button_space">
					<button class="showButton"></button>
					<button class="hideButton">숨기기</button>
				</section>
			</c:if>
		</section>




		<hr>

		<section class="report_article">
			<section class="date_space"></section>

			<c:forEach items="${reportList2}" var="report" varStatus="status">
				<c:choose>
					<c:when test="${status.count <= 3}">
						<h3>
							<section class="report_title" data-title-index="${status.count}">
								<a href="reportDetail/${report.report_id}">${report.report_title}</a>
							</section>
						</h3>
						<section class="report_content">${report.report_content}</section>
						<section class="report_date">${report.report_record_time}</section>
						<div class="report-level"
							data-report-level="${report.report_level}"
							data-level-index="${status.count}">level:
							${report.report_level}</div>
					</c:when>
					<c:otherwise>
						<div class="incident-list" style="display: none;">
							<h3>
								<section class="report_title" data-title-index="${status.count}">
									<a href="reportDetail/${report.report_id}">${report.report_title}</a>
								</section>
							</h3>
							<section class="report_content">${report.report_content}</section>
							<section class="report_date">${report.report_record_time}</section>
							<div class="report-level"
								data-report-level="${report.report_level}"
								data-level-index="${status.count}">level:
								${report.report_level}</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${reportList2.size() > 3}">
				<section class="button_space">
					<button class="showButton"></button>
					<button class="hideButton">숨기기</button>
				</section>
			</c:if>
		</section>
		<hr>
		<section class="report_article">
			<section class="date_space"></section>
			<c:forEach items="${reportList3}" var="report" varStatus="status">
				<c:choose>
					<c:when test="${status.count <= 3}">
						<h3>
							<section class="report_title" data-title-index="${status.count}">
								<a href="reportDetail/${report.report_id}">${report.report_title}</a>
							</section>
						</h3>
						<section class="report_content">${report.report_content}</section>
						<section class="report_date">${report.report_record_time}</section>
						<div class="report-level"
							data-report-level="${report.report_level}"
							data-level-index="${status.count}">level:
							${report.report_level}</div>
					</c:when>
					<c:otherwise>
						<div class="incident-list" style="display: none;">
							<h3>
								<section class="report_title" data-title-index="${status.count}">
									<a href="reportDetail/${report.report_id}">${report.report_title}</a>
								</section>

							</h3>
							<section class="report_content">${report.report_content}</section>
							<section class="report_date">${report.report_record_time}</section>
							<div class="report-level"
								data-report-level="${report.report_level}"
								data-level-index="${status.count}">level:
								${report.report_level}</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${reportList3.size() > 3}">
				<section class="button_space">
					<button class="showButton"></button>
					<button class="hideButton">숨기기</button>
				</section>
			</c:if>

		</section>
		<hr>
	</section>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
var indexcount = 0;
window.addEventListener('DOMContentLoaded', (event) => {
// 	타이틀 색상 바꾸기
	applyStyles();
// 	리포트 날짜 형변환
    formatReportDates();
// 	전체보기 숫자 업데이트
	updateShowButtonWithHiddenReportsCount();
	//숨김, 보임버트 리스너 추라
	addHideButtonEventListeners();
    addShowButtonEventListeners();
    //날짜 입력하기
    insertMonthValues("${dateString}");
    initializeDate();
});
$(document).ready(function() {

    // 이전 달, 다음 달 버튼 클릭 이벤트
    $('#prev_date_btn').click(function() {
        changeMonth(-1); // 이전 달로 변경
    });
    
    $('#next_date_btn').click(function() {
        changeMonth(1); // 다음 달로 변경
    });
	
	
	$('#base_date').change(function() {
var baseDate = $(this).val();
//입력 필드 값이 변경될 때 필요한 로직 실행
// 예: 현재 날짜와 두 달 전 날짜를 표시하는 로직
var currentDate = new Date(baseDate);
var twoMonthsAgoDate = new Date(currentDate);
twoMonthsAgoDate.setMonth(currentDate.getMonth() - 2);

// 두 날짜를 YYYY-MM-DD 형식으로 포맷팅하는 함수
var formatDate = function(date) {
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
};

// 날짜 범위를 span에 표시
document.getElementById('currentDate').textContent = formatDate(twoMonthsAgoDate) + ' ~ ' + formatDate(currentDate);

$.ajax({
    url: 'api/reports',
    method: 'POST',
    contentType: 'application/json',
    data: JSON.stringify({ baseDate: baseDate }),
    success: function(responseData) {
        var dateString = responseData.dateString;
    	updateReports(responseData);
        formatReportDates();        
        addHideButtonEventListeners();
        addShowButtonEventListeners();
        updateShowButtonWithHiddenReportsCount();
        applyStyles();
        
    },
    error: function(xhr, status, error) {
        console.error('Error:', error);
    }
});
});
});


function changeMonth(months) {
    var baseDateElement = $('#base_date')[0];
    var currentDate = new Date(baseDateElement.value);
    currentDate.setMonth(currentDate.getMonth() + months);
    baseDateElement.valueAsDate = currentDate;
    
    var twoMonthsAgoDate = new Date(currentDate);
    twoMonthsAgoDate.setMonth(currentDate.getMonth() - 2);
    
    // 두 날짜를 YYYY-MM-DD 형식으로 포맷팅
    var formatDate = function(date) {
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = currentDate.getDate().toString().padStart(2, '0');
        return year + '-' + month + '-' + day;
    };
    
    // 날짜 범위를 span에 표시
    document.getElementById('currentDate').textContent = formatDate(twoMonthsAgoDate) + ' ~ ' + formatDate(currentDate);
    
    // 날짜 변경 후 .change() 이벤트 강제 호출
    $('#base_date').change();
}


function addEventListeners() {
    document.getElementById('prev_date_btn').addEventListener('click', function() {
        changeMonth(-1); // 이전 달로 변경
    });
    
    document.getElementById('next_date_btn').addEventListener('click', function() {
        changeMonth(1); // 다음 달로 변경
    });
}

function initializeDate() {
    const nowDate = getNowDate();
    document.getElementById('base_date').value = nowDate;
    const twoMonthsAgoDate = gettwoMonthDate();
    document.getElementById('currentDate').textContent = '  ' + twoMonthsAgoDate + ' ~ ' + nowDate + '  ';
	console.log("실행됨");
}

function updateReports(responseData) {
    var reportSectionsHtml = '';
    // dateString 처리
    var dateString = responseData.dateString;
    var baseDate = new Date(dateString + "-01"); // "YYYY-MM-01" 형태로 날짜 객체 생성

    // reports 배열 순회
    responseData.reports.forEach(function(reportList, index) {
        var newDate = new Date(baseDate);
        newDate.setMonth(newDate.getMonth() - index); // index 만큼 월을 빼서 새로운 날짜 계산

        var year = newDate.getFullYear();
        var month = newDate.getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 +1
        var newDateString = year + ' ' + (month < 10 ? '0' + month : month); // "YYYY MM" 형식으로 문자열 생성
        var reportSectionHtml = '<section class="report_article"><section class="date_space">' + newDateString + '</section>';

        // reportList가 비어있는 경우 처리
        if (reportList.length === 0) {
            reportSectionsHtml += '<section class="report_article"><section class="date_space">' + newDateString + '</section><div><br>해당하는 데이터 없습니다</div></section>';
            return; // 다음 reportList로 넘어감
        }

        var reportSectionHtml = '<section class="report_article"><section class="date_space">' + newDateString + '</section>';
        reportList.forEach(function(report, statusIndex) {
        	if (statusIndex < 3) {
                reportSectionHtml += '<div>' + // 이 부분은 빼도 되는데, 위의 JSP 예제에 맞추어 추가합니다.
                    '<h3><section class="report_title" data-title-index="' + (statusIndex + 1) + '">' +
                    '<a href="reportDetail/' + report.report_id + '">' + report.report_title + '</a></section></h3>' +
                    '<section class="report_content">' + report.report_content + '</section>' +
                    '<section class="report_date">' + report.report_record_time + '</section>' +
                    '<div class="report-level" data-report-level="' + report.report_level + '" data-level-index="' + (statusIndex + 1) + '">level: ' + report.report_level + '</div>' +
                    '</div>';
            } else {
                // 3개 이후의 보고서는 숨김 처리
                reportSectionHtml += '<div class="incident-list" style="display: none;">' +
                    '<h3><section class="report_title" data-title-index="' + (statusIndex + 1) + '">' +
                    '<a href="reportDetail/' + report.report_id + '">' + report.report_title + '</a></section></h3>' +
                    '<section class="report_content">' + report.report_content + '</section>' +
                    '<section class="report_date">' + report.report_record_time + '</section>' +
                    '<div class="report-level" data-report-level="' + report.report_level + '" data-level-index="' + (statusIndex + 1) + '">level: ' + report.report_level + '</div>' +
                    '</div>';
            }
        });
        if (reportList.length > 3) {
            reportSectionHtml += '<section class="button_space">' +
                                  '<button class="showButton">전체보기</button>' +
                                  '<button class="hideButton" style="display:none;">숨기기</button>' +
                                  '</section>';
        }

        reportSectionHtml += '</section>';
        
        reportSectionsHtml += reportSectionHtml;
    });

    // 결과 HTML을 페이지에 삽입
    $('#report_backpage').html(reportSectionsHtml);
}

function insertMonthValues(dateString) {
    var dateSpaces = document.querySelectorAll('.date_space');
    dateSpaces.forEach(function(element, index) {
        var year = dateString.substring(0, 4); // 연도 추출
        var month = parseInt(dateString.substring(5)) - index;
        if (month < 1) {
            month += 12;
        }
        element.textContent = year + ' ' + (month < 10 ? '0' + month : month);
    });
}
    
	function addShowButtonEventListeners() {
	    document.querySelectorAll('.showButton').forEach(function(button) {
	        button.addEventListener('click', function(event) {
	            // 클릭된 버튼이 속한 report_article 섹션을 찾습니다.
	            const articleSection = event.target.closest('.report_article');
	            // 해당 섹션 내의 모든 .incident-list 요소를 조회하여 표시합니다.
	            articleSection.querySelectorAll('.incident-list').forEach(function(report) {
	                report.style.display = 'block';
	            });
	            
	            // '숨기기' 버튼을 보이게 하고 '전체보기' 버튼을 숨깁니다.
	            var hideButton = articleSection.querySelector('.hideButton');
	            if (hideButton) {
	                hideButton.style.display = 'inline'; // 또는 'block'
	            }
	            event.target.style.display = 'none';
	        });
	    });
	}
	
	function updateShowButtonWithHiddenReportsCount() {
	    document.querySelectorAll('.report_article').forEach(function(article) {
	        var hiddenReportsCount = article.querySelectorAll('.incident-list').length;	        
	        var showButton = article.querySelector('.showButton');
	        if (showButton) {
	            showButton.innerText = "전체보기(" + hiddenReportsCount + "+)";
	        }
	    });
	}


function addHideButtonEventListeners() {
    document.querySelectorAll('.hideButton').forEach(function(button) {
        button.addEventListener('click', function(event) {
            const articleSection = event.target.closest('.report_article');
            articleSection.querySelectorAll('.incident-list').forEach(function(report) {
                report.style.display = 'none';
            });
            var showButton = articleSection.querySelector('.showButton');
            if (showButton) {
                showButton.style.display = 'inline'; // 또는 'block'
            }
            event.target.style.display = 'none';
        });
    });
}

function applyStyles() {
    document.querySelectorAll('.report-level').forEach((reportLevel) => {
        const level = reportLevel.getAttribute('data-report-level');
        const index = reportLevel.getAttribute('data-level-index');
        const titleElement = reportLevel.closest('.report_article').querySelector('.report_title[data-title-index="' + index + '"]');
		console.log("실행되었어용");
        switch(level) {
            case '1':
                titleElement.style.color = 'green';
                break;
            case '2':
                titleElement.style.color = 'orange';
                break;
            case '3':
                titleElement.style.color = 'red';
                break;
            default:
                break;
        }
        console.log("실행됨");
    });
}

function getNowDate() {
    const now = new Date();
    const year = now.getFullYear();
    let month = (now.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 만듭니다.
    let day = now.getDate().toString().padStart(2, '0'); // 날짜를 두 자리로 만듭니다.
    return year + '-' + month + '-' + day; // YYYY-MM-DD 형식으로 반환합니다.
}

function gettwoMonthDate() {
	var now = new Date();
    now.setMonth(now.getMonth() - 2); // 현재 월에 1을 더합니다.
    var year = now.getFullYear();
    var month = (now.getMonth() + 1 < 10 ? '0' : '') + (now.getMonth() + 1); // 두 자리로 만듭니다.
    var day = (now.getDate() < 10 ? '0' : '') + now.getDate(); // 두 자리로 만듭니다.
    return year + '-' + month + '-' + day; // YYYY-MM-DD 형식으로 반환합니다.
}


//리포트 날짜 형식 변경하기
function formatReportDates() {
    document.querySelectorAll('.report_date').forEach(function(element) {
        var content = element.textContent || element.innerText;
        var isTimestamp = /^\d+$/.test(content);
        var date;
if (isTimestamp) {
            // 타임스탬프 형식이면 바로 Date 객체를 생성합니다.
            var timestamp = parseInt(content, 10);
            date = new Date(timestamp);
        } else {
            // KST 같은 다른 형식이라면, 추가적인 처리를 한 후 Date 객체를 생성합니다.
            // 예시는 간단화를 위해 직접 Date 객체를 생성합니다.
            // 실제로는 content 형식에 맞는 파싱 로직을 적용해야 할 수 있습니다.
            var cleanedDateStr = content.replace(/KST\s+\d{4}/, '').trim();
            date = new Date(cleanedDateStr);
        }
        if (!isNaN(date.getTime())) {
            var options = { month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit', hour12: false };
            var formattedDate = new Intl.DateTimeFormat('en-US', options).format(date);
            element.textContent = formattedDate;
        } else {
            console.error('날짜 변환 오류:', timestamp);
        }
    });
}



</script>
<style>
.hideButton {
	display: none;
}

.report-level {
	display: none;
}
</style>
</html>