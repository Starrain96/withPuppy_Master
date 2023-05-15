<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.multi.withPuppy.report.ReportVO"%>
<%@page import="java.util.ArrayList"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
	<div class="container mt-3">
		<h3>📢반려동물 신고페이지</h3>
		<div class="form-group d-flex">
			<select class="form-select me-3" name="dogBreeds" id="dogBreeds"
				style="width: 220px">
				<option value="">전체견종(가나다순)</option>
				<option value="">-------------------------------</option>
				<option value="1">대형 (15kg초과)</option>
				<option value="2">중형 (7kg초과~15kg이하)</option>
				<option value="3">소형 ()7kg이하)</option>
			</select> 
			
			<select class="form-select" name="sci"
				onchange="change(this.selectedIndex);" style="width: 150px">
				<option value="" selected>시/군/구</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select> 
			
			
		</div>

		<br>
		<div style="margin-bottom: 10px;">
			<a href="insertRe1">
				<button type="submit" class="btn btn-primary">작성하기</button>
			</a> <a href="deleteRe1">
				<button type="submit" class="btn btn-primary">삭제하기</button>
			</a> <a href="updateRe1">
				<button type="submit" class="btn btn-primary">수정하기</button>
			</a>
		</div>

<div class="row">
	<c:forEach items="${list}" var="vo">
		<div class="col-md-6">
			<a href="detailRe1?number=${vo.number}">
	<div style="border: 1px solid gray; border-radius: 5px; padding: 10px; margin-bottom: 15px;">
	
							<div>
								<img src="${vo.picture1}" alt="동물사진" width="250" height="250">
							</div>
							<div>제목 : ${vo.title}</div>
							<div>반려종 : ${vo.animal}</div>
							<div>내용 : ${vo.content}</div>
							<div style="text-align: right; font-size: small;">작성자: ${vo.writer}</div>
						</div>
						
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
