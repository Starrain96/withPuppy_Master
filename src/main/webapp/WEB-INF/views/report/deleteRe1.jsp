<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 가운데 정렬을 위한 스타일 */
.center {
  text-align: center;
}

table {
  margin: auto;
}

td {
  text-align: center;
}
</style>
<link rel="stylesheet" href="/resources/css/main.css" />
</head>

<body>

<section class="center">
  <h3>신고등록</h3>
  <hr color="red">
  <form action="insertRe" method="get">
    <table>
      <tr>
        <td>등록번호 :</td>
        <td><input name="number" value="1"></td>
      </tr>
      <tr>
        <td>작성자 :</td>
        <td><input name="writer" value="park"></td>
      </tr>
      <tr>
        <td>반려종 :</td>
        <td><input name="animal" value="pomeranian"></td>
      </tr>
      
      <tr>
        <td>실종위치 :</td>
        <td><input name="location1" value="멀티캠퍼스"></td>
      </tr>
      <tr>
        <td>내용 :</td>
        <td><input name="content" value="123"></td>
      </tr>
    </table>
    <br>
    <button type="submit">등록</button>
  </form>
</section>

</body>
</html>
