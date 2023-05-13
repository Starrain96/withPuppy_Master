<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<li class="nav-item"><a href="shoppingList" class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a href="listhospital?category=동물병원" class="nav-link link-secondary">반려동물서비스</a></li>
			<li class="nav-item"><a href="selectFaqList" class="nav-link link-secondary">고객센터</a></li>
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
		<hr color="red">
		<h4>카테고리</h4>
		<hr color="red">
		<ul class="nav nav-pills">
			<li class="nav-item"><a href="selectFaqOne2?faq_category=회원"
				class="nav-link link-secondary">회원정보</a></li>
			<li class="nav-item"><a href="selectFaqOne2?faq_category=커뮤니티"
				class="nav-link link-secondary">커뮤니티</a></li>
			<li class="nav-item"><a href="selectFaqOne2?faq_category=쇼핑몰"
				class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a href="selectFaqOne2?faq_category=반려동물서비스"
				class="nav-link link-secondary">반려동물서비스</a></li>
			<li class="nav-item"><a href="selectFaqOne2?faq_category=유기동물신고"
				class="nav-link link-secondary">유기동물신고</a></li>
		</ul>
	</div>
	<hr color="red">
	<h4>검색</h4>
	<hr color="red">
	<form action="selectFaqOne" method="get">
		제목 <input type="search" name="faq_title" size="60"
			placeholder="검색할 문의사항을 입력해주세요." onfocus="this.placeholder=''"
			onblur="this.placeholder='검색할 문의사항을 입력해주세요.'">
		<button type="submit">검색</button>
	</form>
	<div id="faqView">
		<hr color="red">
		<h4>리스트</h4>
		<hr>
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th style="width: 10px">no</th>
					<th style="width: 120px">category</th>
					<th>title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.faq_no}</td>
						<td>${vo.faq_category}</td>
						<td><a href="#" onclick="return false;" class="hideView">${vo.faq_title}</a></td>
					</tr>
					<tr class="hiddenRow" style="display: none;">
						<td class="table-active" colspan="3">${vo.faq_content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".hideView").click(function() {
				parent = $(this).closest('tr');
				hiddenRow = parent.next('.hiddenRow');
				status = hiddenRow.css('display');
				if (status === 'none') {
					hiddenRow.css('display', '');
				} else {
					hiddenRow.css('display', 'none');
				}
			});
		});
	</script>

</body>
</html>