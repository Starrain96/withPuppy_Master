<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.multi.withPuppy.report.ReportVO"%>
<%@page import="java.util.ArrayList"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-3">
  <h3>📢유기동물 신고페이지</h3>
  <a href="insertRe1">
             <button type="submit" class="btn btn-primary">작성하기</button>
  </a>
  <a href="deleteRe1">
             <button type="submit" class="btn btn-primary">삭제하기</button>
  </a>
  <a href="updateRe1">
             <button type="submit" class="btn btn-primary">수정하기</button>
  </a>
   <table class="table">
    <thead class="table-success">
	<tr>
        <th>등록번호</th>
        <th>작성자</th>
        <th>반려종</th>
        <th>실종위치</th>
        <th>내용</th>
    </tr>
 </thead>
 <tbody>
		<c:forEach items="${list}" var="vo"> 

<tr>
				<td class="down">${vo.number}</td>
				<td class="down">${vo.writer}</td>
				<td class="down">${vo.animal}</td>
				<td class="down">${vo.location1}</td>
				<td class="down">${vo.content}</td>
			</tr>

		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>