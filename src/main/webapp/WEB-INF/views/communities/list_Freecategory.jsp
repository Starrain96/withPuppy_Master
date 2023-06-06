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
	background-color: #ffe98c;
	color: black;
}

tr:nth-child(even) {
	background-color: #ffe98c;
}

tr:hover {
	background-color: #ddd;
}

.top {
	background-color: #ffe98c;
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

	<c:forEach items="${Freelist_category}" var="vo">

		<tr>
			<td class="down">${vo.commu_no}</td>
			<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
			<td class="down">${vo.commu_date}</td>
			<td class="down">${vo.commu_id}</td>
			<td class="down">${vo.commu_view}</td>
		</tr>

	</c:forEach>

</table>
