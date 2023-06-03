<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와-쇼핑몰</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/shopping.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="../resources/js/category.js"></script> 
<script src="../resources/js/shoppingList.js"></script> 
</head>

<body>
	<nav class="navbar navbar-expand-sm bg-light justify-content-center">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" id="firstBtn"
				onclick="btnChange(1,4,1,12,this);">사료</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(5,14,1,12,this);">간식</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(15,23,1,12,this);">건강관리</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(24,29,1,12,this);">위생/배변</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(30,36,1,12,this);">미용/목욕</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(37,41,1,12,this)">급식기/급수기</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(42,46,1,12,this)">하우스/울타리</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(47,49,1,12,this)">이동장</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(50,56,1,12,this)">의류/악세서리</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(57,60,1,12,this)">목줄/인식표/리드줄</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(61,66,1,12,this)">장난감</a></li>
			<li class="nav-item"><a class="nav-link"
				onclick="btnChange(67,67,1,12,this)">훈련</a></li>
		</ul>
	</nav>
	<hr>
	
	<div class= "sorting">
		<h5 id="menuName">사료</h5>
		<form id = "sort_id" action="#" class="sortDetail" onchange="sorting()">
			<select name="showNum" id = "showNum">
				<option value="1">기본순</option>
				<option value="2">저가순</option>
				<option value="3">고가순</option>
			</select> 
			<!-- <input type="submit" value="적용" /> -->
		</form>
	</div>
	<hr>
	<div>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4"
			id="productList">
			<c:forEach items="${list}" var="bag">
				<div class="container mt-4 col">
					<div class="card card__two" style="width: 80%; margin-left: 10%"
						onclick="location.href='productDetail?product_id=${bag.detail}'">
						<img class="card-img-top" src="${bag.product_img}"
							alt="Card image" style="width: 100%">
						<div class="card-body">
							<div class="card-title t1">${bag.product_name}</div>
							<div class="card-text t2">${bag.product_price}원</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="pagination justify-content-center" id = "pageBtn">
	</div>
</body>
</html>