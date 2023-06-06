<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table" style="width:100%">
	<colgroup>
		<col style="width: 50px;">
		<col style="width: auto;">
		<col style="width: auto;">
		<col style="width: auto;">
		<col style="width: auto;">
		<col style="width: auto;">
		<col style="width: 100px;">
		<col style="width: 50px;">
	</colgroup>
	<thead style="background-color:#ffe98c">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">이메일</th>
			<th scope="col">등급</th>
			<th scope="col">가입일</th>
			<th scope="col">상태</th>
			<th scope="col">탈퇴</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="one">
				<tr style="height:42px;">
					<th scope="row">${one.user_no}</th>
					<td>${one.user_id}</td>
					<td>${one.user_name}</td>
					<td>${one.user_email}</td>
					<td>${one.user_level}</td>
					<td>${one.user_joindate}</td>
					<td>
						<c:choose>
							<c:when test="${one.user_state == 1}">
							 	<span style="color: green;">활동</span>
							</c:when>
							<c:otherwise>
							 	<span style="color: red;">탈퇴</span>
							</c:otherwise>
						</c:choose>
					</td>
					<td style="vertical-align: middle;">
						<div style="display: flex; align-items: center; justify-content: center; height: 100%;">
							<c:choose>
					        	<c:when test="${one.user_state == 0}">
					            	<input class="delete-disabled" type="checkbox" checked disabled>
					           	</c:when>
					        	<c:otherwise>
					            	<input class="delete" type="checkbox" name="chkBox">
					       		</c:otherwise>
					   		</c:choose>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>