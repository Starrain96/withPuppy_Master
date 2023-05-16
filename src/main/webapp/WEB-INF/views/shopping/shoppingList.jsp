<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../shoppingHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와-쇼핑몰</title>

<!-- Latest compiled and minified CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
body {
	margin-right: 15%;
	margin-left: 15%;
}


.card__two {
  &::before,
  &::after {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    transition: opacity .38s ease-in-out, transform .35s ease-in-out;
    content: '';
    opacity: 0;
    pointer-events: none;
    border-bottom: 10px solid #ffe98c;
  }

  &::before {
    transform: scale3d(0, 1, 1);
    border-bottom: 20px solid #ffe98c;
  }

  &::after {
  	position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    transition: opacity 2s cubic-bezier(.165, .84, .44, 1);
    box-shadow: 0 8px 17px 0 rgba(0, 0, 0, .2), 0 6px 20px 0 rgba(0, 0, 0, .15);
    content: '';
    opacity: 0;
    z-index: -1;
  }

  &:hover,
  &:focus {
  transform: scale3d(1.006, 1.006, 1);
    &::before,
    &::after {
      opacity: 1;
    }
  }
}





</style>

<script type="text/javascript">
function btnChange(n) {
	$.ajax({
		url : "shoppingList2",
		data : {
			category2 : n
		},
		success : function(data) {
			$('#productList').empty();
			for (i = 0; i < data.length; i++) {
				var sen = 
					`<div class="container mt-4 col">
						<div class="card card__two" style="width: 80%; margin-left: 10%" onclick="location.href='productDetail?product_id=`
							+ data[i].detail + `'">
						<img class="card-img-top" src="`
							+ data[i].product_img +`"
							alt="Card image" style="width: 100%">
						<div class="card-body">
						<h5 class="card-title">`+ data[i].product_name +`</h5>
						<h5 class="card-text">` + data[i].product_price + `</h5>
					</div>
					</div>
				</div>`;
				$('#productList').append(sen);
			}
		},
		error : function(){
			alert("에러");
		}
	})//ajax
}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light justify-content-center">
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" onclick="btnChange(1);">사료</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(2);">간식</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(3);">건강관리</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(4);">위생/배변</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(5);">미용/목욕</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(6)">급식기/급수기</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(7)">하우스/울타리</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(8)">이동장</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(9)">의류/악세서리</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(57)">목줄/인식표/리드줄</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(61)">장난감</a></li>
			<li class="nav-item"><a class="nav-link" onclick="btnChange(67)">훈련</a></li>
		</ul>
	</nav>
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
							<h5 class="card-title">${bag.product_name}</h5>
							<h5 class="card-text">${bag.product_price}원</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>