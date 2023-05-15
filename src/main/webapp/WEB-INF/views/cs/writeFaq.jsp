<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/main.css" />

</head>
<body>
	<header
		class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
		<a href="main.jsp"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use>
            </svg> <span c2lass="fs-4" style="color: black; font-weight: bold">강아지와</span>
		</a>
		<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
			<input type="search" class="form-control" placeholder="Search..."
				aria-label="Search">
		</form>

		<ul class="nav nav-pills">
			<!-- <li class="nav-item"><a href="#" class="nav-link active"
                aria-current="page">Home</a></li> -->
			<li class="nav-item"><a href="#" class="nav-link link-secondary">커뮤니티</a></li>
			<li class="nav-item"><a href="shoppingList"
				class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a href="listhospital?category=동물병원"
				class="nav-link link-secondary">반려동물서비스</a></li>
			<li class="nav-item"><a href="selectFaqList"
				class="nav-link link-secondary">고객센터</a></li>
			<li class="nav-item"><a href="#" class="nav-link link-secondary">유기견
					신고</a></li>
		</ul>
	</header>

	<div>
		<h3>고객센터</h3>
		<hr color="red">
		<ul class="nav nav-pills">
			<li class="nav-item"><a href="selectFaqList"
				class="nav-link active">FAQ</a></li>
			<li class="nav-item"><a href="selectAskList"
				class="nav-link link-secondary">1:1문의</a></li>
		</ul>
	</div>
	<hr color="red">
	<div id="faqWriteView">
		<h4>FAQ 문의 작성</h4>
		<form action="insertFaq" method="get">
			<table class="table">
				<tr>
					<td style="width: 100px">category :</td>
					<td><select name="faq_category">
							<option value="회원">회원</option>
							<option value="커뮤니티">커뮤니티</option>
							<option value="쇼핑몰">쇼핑몰</option>
							<option value="반려동물서비스">반려동물서비스</option>
							<option value="유기동물신고">유기동물신고</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px">title :</td>
					<td><input name="faq_title" value="FAQ 제목 추가 테스트1"></td>
				</tr>
				<tr>
					<td style="width: 100px">content :</td>
					<td><textarea cols="50" rows="10"
							style="width: 200px; height: 100px;" name="faq_content">FAQ 내용 추가 테스트1</textarea></td>
				</tr>
				<tr>
					<td style="width: 100px">writer :</td>
					<td><input name="faq_writer" value="admin"></td>
				</tr>
			</table>
			<button type="submit">글쓰기 완료</button>
		</form>
	</div>

</body>
</html>