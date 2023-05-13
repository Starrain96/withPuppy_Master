<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	flex-direction: column;
	align-items: center;
}

td {
	width: 100px;
	text-align: center;
}

.top {
	background: black;
	color: white;
}

/*.down {
	background: lime;
}*/
</style>
</head>
<body>
	<table>
		<tr>
			<td class="top">no</td>
			<td class="top">title</td>
			<td class="top">content</td>
			<td class="top">writer</td>
		</tr>

		<c:forEach items="${list}" var="bag">

			<tr>
				<td class="down">${bag.commu_no}</td>
				<td class="down"><a href = "one?commu_no=${bag.commu_no}">${bag.commu_title}</a></td>
				<td class="down">${bag.commu_content}</td>
				<td class="down">${bag.commu_id}</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>