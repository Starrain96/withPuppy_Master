<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

th {
	background-color: #3aa4c1;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a:link, a:visited {
	color: #3aa4c1;
	text-decoration: none;
}

a:hover, a:active {
	color: #1e80a3;
	text-decoration: underline;
}

.top {
	background-color: #f1f1f1;
	font-weight: bold;
}

.down {
	border-bottom: 1px solid #ddd;
}
</style>

<table>
	<tr>
		<th class="top">번호</th>
		<th class="top">제목</th>
		<th class="top">작성일</th>
		<th class="top">글쓴이</th>
		<th class="top">조회수</th>
	</tr>

	<c:forEach items="${list}" var="vo">

		<tr>
			<td class="down">${vo.commu_no}</td>
			<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
			<td class="down">${vo.commu_date}</td>
			<td class="down">${vo.commu_id}</td>
			<td class="down">${vo.commu_view}</td>
		</tr>

	</c:forEach>

</table>
