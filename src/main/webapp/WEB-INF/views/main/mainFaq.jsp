<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
	<thead>
		<tr>
			<th style="width: 50px">no</th>
			<th style="width: 300px">content</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td style="width: 50px">${vo.faq_no}</td>
				<td style="width: 300px"><a href="${pageContext.request.contextPath}/cs/selectFaqOne?faq_title=${vo.faq_title}">${vo.faq_title}</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>