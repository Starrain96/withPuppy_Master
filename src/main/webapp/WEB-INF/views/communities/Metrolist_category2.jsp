<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<table>
			<tr>
				<td class="top">번호</td>
				<td class="top">제목</td>
				<td class="top">작성일</td>
				<td class="top">글쓴이</td>
				<td class="top">조회수</td>
			</tr>

			<c:forEach items="${Metrolist_category2 }" var="vo">
				<tr>
					<td>${vo.commu_no}</td>
					<td><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
					<td>${vo.commu_date}</td>
					<td>${vo.commu_id}</td>
					<td>${vo.commu_view}</td>
				</tr>
			</c:forEach>

		</table>