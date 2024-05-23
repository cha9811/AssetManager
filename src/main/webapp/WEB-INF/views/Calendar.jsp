<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
  /* body 스타일 */
   html, body { 
/*     overflow: hidden; */
/*     font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
/*     font-size: 14px;  */
   } 
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
   #calendar {    overflow: auto; /* 필요 시 스크롤바 표시 */
   }

 #calendar-container {
    height: 80vh; /* 상대적인 높이 설정 */
  }
<   
</style>

</head>
<body>
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  <script>
  (function(){
    $(function(){
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '500px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면(기본 설정: 달)
//         initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능
        selectable: true, // 달력 일자 드래그 설정 가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        events: [ // 이벤트 목록
          { title: 'All Day Event', start: '2021-07-01' },
          { title: 'Long Event', start: '2021-07-07', end: '2021-07-10' },
          { groupId: 999, title: 'Repeating Event', start: '2021-07-09T16:00:00' },
          { groupId: 999, title: 'Repeating Event', start: '2021-07-16T16:00:00' },
          { title: 'Conference', start: '2021-07-11', end: '2021-07-13' },
          { title: 'Meeting', start: '2021-07-12T10:30:00', end: '2021-07-12T12:30:00' },
          { title: 'Lunch', start: '2021-07-12T12:00:00' },
          { title: 'Meeting', start: '2021-07-12T14:30:00' },
          { title: 'Happy Hour', start: '2021-07-12T17:30:00' },
          { title: 'Dinner', start: '2021-07-12T20:00:00' },
          { title: 'Birthday Party', start: '2021-07-13T07:00:00' },
          { title: 'Click for Google', url: 'http://google.com/', start: '2021-07-28' }
        ],
        select: function(arg) {
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            });
          }
          calendar.unselect();
        },
        eventAdd: function(obj) {
          console.log(obj);
        },
        eventChange: function(obj) {
          console.log(obj);
        },
        eventRemove: function(obj) {
          console.log(obj);
        }
      });
      calendar.render();
    });
  })();
</script>
</body>
</html>
<!-- 출처: https://nowonbun.tistory.com/368 [명월 일지:티스토리] -->