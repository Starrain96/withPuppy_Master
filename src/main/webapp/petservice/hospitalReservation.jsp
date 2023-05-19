<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 예약 시스템</title>
<style>
  .time-slot {
    float:left;
    width: 25%;
    box-sizing: border-box;
    padding: 5px;
  }
  .btn {
    display: block;
    width: 100%;
    height: 50px;
    line-height: 50px;
    text-align: center;
    margin-bottom: 5px;
  }
  .clearfix::after { /* float 레이아웃 해제 처리 */
    content: "";
    clear: both;
    display: table;
  }
</style>
<script>
function makeReservation(timeSlot) {
  let reservationTime = document.getElementById("reservation-time");
  reservationTime.value = timeSlot;
  document.getElementById("reservation-form").submit();
}
</script>
</head>
<body>
<div class="container">
  <h2>병원 예약 시스템</h2>
  <form action="submit_reservation.jsp" method="post" id="reservation-form">
    <input type="hidden" name="reservation-time" id="reservation-time">
    <div class="clearfix">
      <% for (int i = 9; i < 18; i++) { %>
        <div class="time-slot">
          <button onclick="makeReservation('<%= i %>:00')" class="btn btn-primary"> <%= i %>:00 </button> <br>
          <button onclick="makeReservation('<%= i %>:30')" class="btn btn-primary"> <%= i %>:30 </button> <br>
        </div>
        <% if ((i - 8) % 4 == 0) { %>
          <div style="clear:both;"></div>
        <% } %>
      <% } %>
    </div>
  </form>
</div>
</body>
</html>