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
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    justify-content: center;
}

table {
    max-width: 800px;
}

td {
    width: 100px;
    
    text-align: center;
    padding: 10px;
}

.top {
    background-color: #333;
    color: #fff;
}

.down:nth-child(even) {
    background-color: #fafafa;
}

.down:nth-child(odd) {
    background-color: #fff;
}

.down:hover {
    background-color: #fba60b;
}

a:link {
    color: #333;
    text-decoration: none;
    transition: all 0.2s;
}

a:hover {
    color: #fba60b;
}

</style>
</head>
<body>
	<table>
		<tr>
			<td class="top">no</td>
			<td class="top">title</td>
			<td class="top">date</td>
			<td class="top">writer</td>
			<td class="top">views</td>
		</tr>

		<c:forEach items="${list}" var="vo">

			<tr>
				<td class="down">${vo.commu_no}</td>
				<td class="down"><a href = "one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
				<td class="down">${vo.commu_date}</td>
				<td class="down">${vo.commu_id}</td>
				<td class="down">${vo.commu_view}</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>