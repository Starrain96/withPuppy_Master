<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="../resources/js/manage.js"></script>
<script src="../resources/js/category.js"></script>
<link rel="stylesheet" href="../resources/css/manage.css">
</head>

<script type="text/javascript">
	//정렬select 변경시 호출되는 함수
	function sorting() {
		var select = document.getElementById("showNum");
		var selectVal = (select.options[select.selectedIndex].value);
		if (selectVal == 3) {
			bringList(n1, n2, 1, 12, 3);
		} else if (selectVal == 2) {
			bringList(n1, n2, 1, 12, 2);
		} else {
			bringList(n1, n2, 1, 12, 1);
		}
	}
</script>

<body>
	<div class="flex">
		<input type="text" id="searching" placeholder="상품이름을 입력하세요">
		<button onclick="searching()">search</button>
		<div class="sorting">
			<form id="sort_id" action="#" class="sortDetail" onchange="sorting()">
				<select name="showNum" id="showNum">
					<option value="1">기본순</option>
					<option value="2">저가순</option>
					<option value="3">고가순</option>
				</select>
			</form>
		</div>
	</div>
	<hr>
	<div class="tableList">
		<div class="realTable">
			<table>
				<thead>
					<tr>
						<td>상품 번호</td>
						<td>상품명</td>
						<td>카테고리</td>
						<td>재고 수량</td>
						<td>가격</td>
						<td>품절</td>
						<td>판매상태</td>
					</tr>
				</thead>
				<tbody id="manageList">
					<c:forEach items="${list}" var="bag">
						<tr id="editBtn">
							<td>${bag.product_id}</td>
							<td ondblclick="onClick1(${bag.product_id})">${bag.product_name}</td>
							<td>${bag.category2}</td>
							<td>${bag.product_cnt}</td>
							<td>${bag.product_price}</td>
							<td>${bag.soldout_YN}</td>
							<td>${bag.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="sideBar">
			<ul class="category">
				<li class="categoryLi"><a class="cateBtn" id="firstBtn"
					onclick="btnChange1(1,4,1,12,this);">사료</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(5,14,1,12,this);">간식</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(15,23,1,12,this);">건강관리</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(24,29,1,12,this);">위생/배변</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(30,36,1,12,this);">미용/목욕</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(37,41,1,12,this)">급식기/급수기</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(42,46,1,12,this)">하우스/울타리</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(47,49,1,12,this)">이동장</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(50,56,1,12,this)">의류/악세서리</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(57,60,1,12,this)">목줄/인식표/리드줄</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(61,66,1,12,this)">장난감</a></li>
				<li class="categoryLi"><a class="cateBtn"
					onclick="btnChange1(67,67,1,12,this)">훈련</a></li>
			</ul>
			<button id="modal_btn" class="addBtn">상품 등록</button>
		</div>
	</div>

	<!-- 상품등록 모달창 -->
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div class="modal_content">
			<form id="addForm">
				<table>
					<tr>
						<td>상품명 :</td>
						<td><input type="text" name="product_name" class="inputForm"
							id="product_name" placeholder="상품명입력"></td>
					</tr>
					<tr>
						<td>가격 :</td>
						<td><input type="text" name="product_price" class="inputForm"
							id="product_price" placeholder="가격 입력"></td>
					</tr>
					<tr>
						<td>카테고리 :</td>
						<td><input type="text" name="category2" class="inputForm"
							id="category2" placeholder="카테고리 번호 입력"></td>
					</tr>
					<tr>
						<td>상세 정보 :</td>
						<td><input type="text" name="detail" class="inputForm"
							id="detail" placeholder="상품 설명"></td>
					</tr>
					<tr>
						<td>재고 :</td>
						<td><input type="text" name="product_cnt" class="inputForm"
							id="product_cnt" placeholder="재고 입력"></td>
					</tr>
					<tr>
						<td>이미지 url:</td>
						<td><input type="text" name="product_img" class="inputForm"
							id="product_img" placeholder="이미지 url"></td>
					</tr>
				</table>
				<button class="addBtn" onclick="addProduct()">상품 추가하기</button>
			</form>
		</div>
	</div>

	<div class="black_bg1"></div>
	<div class="modal_wrap1">
		<div class="modal_close1">
			<a href="#">close</a>
		</div>
		<div class="modal_content1">
			<form id="updateForm">
				<table class="modal_table">
					<tr>
						<td>상품번호:</td>
						<td><input type="text" name="product_id" class="inputForm_1"
							id="product_id" value="" readonly /></td>
					</tr>
					<tr>
						<td>상품명 :</td>
						<td><input type="text" name="product_name" class="inputForm"
							id="product_name" placeholder="상품명입력"></td>
					</tr>
					<tr>
						<td>가격 :</td>
						<td><input type="text" name="product_price" class="inputForm"
							id="product_price" placeholder="가격 입력"></td>
					</tr>
					<tr>
						<td>카테고리 :</td>
						<td><input type="text" name="category2" class="inputForm"
							id="category2" placeholder="카테고리 번호 입력"></td>
					</tr>
					<tr>
						<td>재고 :</td>
						<td><input type="text" name="product_cnt" class="inputForm"
							id="product_cnt" placeholder="재고 입력"></td>
					</tr>
					<tr>
						<td>이미지 url:</td>
						<td><input type="text" name="product_img" class="inputForm"
							id="product_img" placeholder="이미지 url"></td>
					</tr>
				</table>
				<button type="button" class="addBtn" onclick="editProduct()">상품수정하기</button>
				<button type="button" class="addBtn" onclick="deleteProduct()">상품삭제하기</button>
			</form>
		</div>
	</div>

	<div id="pagingList" class="pagingList"></div>
</body>
</html>