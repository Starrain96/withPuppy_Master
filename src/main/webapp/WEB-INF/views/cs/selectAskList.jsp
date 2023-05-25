<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="askCSMenuHeader.jsp"%>
<%
String userId = userVo.getUser_id();
String userLevel = userVo.getUser_level();
%>
<hr>
<div id="askView">
<%
	if(!userLevel.equals("관리자")){%>
	<h4>내 1:1 문의</h4>
	<%} else{%>
	<h4>사용자 1:1 문의</h4>
	<%}%>
	<hr>
	<form action="selectAskOne" method="get">
		제목 <input type="search" name="ask_title" size="40"
			placeholder="검색할 제목을 입력해주세요." onfocus="this.placeholder=''"
			onblur="this.placeholder='검색할 문의사항을 입력해주세요.'">
		<button type="submit">검색</button>
	</form>
	<table class="table">
		<thead class="table-primary">
			<tr>
				<th style="width: 10px">no</th>
				<th style="width: 350px">제목</th>
				<th style="width: 100px">ID</th>
				<th style="width: 100px">작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.ask_no}</td>
					<td><a href="selectAskOneNo?Ask_no=${vo.ask_no}">${vo.ask_title}</a></td>
					<td>${vo.ask_writer}</td>
					<td><fmt:formatDate value="${vo.ask_date}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
<%
	if(!userLevel.equals("관리자")){%>
	<button type="button" onclick="location='writeAsk'">글쓰기</button>
	<%} %>
</div>

</body>
</html>