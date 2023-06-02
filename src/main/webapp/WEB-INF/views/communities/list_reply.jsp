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
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a:link, a:visited {
	color: #ffe98c;
	text-decoration: none;
}

a:hover, a:active {
	color: #ffe98c;
	text-decoration: underline;
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
	<c:forEach items="${list_reply}" var="vo2">

		<tr>
			<td class="down">${vo2.reply_id}</td>
			<td class="down">${vo2.reply_content}</td>
			<td class="down">${vo2.reply_date}</td>
		</tr>

	</c:forEach>

</table>
