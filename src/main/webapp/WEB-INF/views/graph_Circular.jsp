<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
	
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<canvas id="pie-chart" width="100" height="100"></canvas>
<div id="total-info" style="text-align: center; margin-top: 20px;"></div> <!-- 여기에 전체 인원수를 표시 -->

<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        url: '/assetmanager/graphData',
        type: 'GET',
        success: function(response) {
            var labels = [];
            var data = [];
            var backgroundColors = ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"];
            var total = 0; // 전체 인원수를 저장할 변수
            var activeCount = 0; // 출근과 출장 인원수를 저장할 변수

            Object.keys(response).forEach(function(key) {
                var label = mapAttendanceToLabel(key);
                labels.push(label);
                data.push(response[key]);
                total += response[key];

                // 출근(1)과 출장(4)인 경우만 카운트
                if (key === '1' || key === '4') {
                    activeCount += response[key];
                }
            });

            var ctx = document.getElementById("pie-chart").getContext('2d');
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: "근무 현황",
                        backgroundColor: backgroundColors,
                        data: data
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: '근무 현황표'
                    },
                    onClick: function(evt, element) {
                        if (element.length > 0) {
                            var index = element[0]._index; // 클릭된 요소의 인덱스
                            var label = this.data.labels[index]; // 라벨
                            var value = this.data.datasets[0].data[index]; // 데이터 값

                            // 데이터를 화면에 표시
                            alert('선택된 항목: ' + label + '\n인원 수: ' + value);
                        }
                    }
                }
            });

            // 전체 인원수 표시
            document.getElementById('total-info').innerHTML = '활성 인원: ' + activeCount + ' / 전체 인원: ' + total;
        },
        error: function(xhr, status, error) {
            alert("데이터를 불러오는데 실패했습니다.");
        }
    });
});

function mapAttendanceToLabel(attendance) {
    switch(attendance) {
        case '1': return "출근";
        case '2': return "연차";
        case '3': return "병가";
        case '4': return "출장";
        case '0': return "퇴근";
        default: return "기타";
    }
}

</script>
</html>
