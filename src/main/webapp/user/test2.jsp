<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
    <style>
	/* 드롭다운 버튼 스타일 */
.dropdown-btn {
  background-color: #3498db;
  color: white;
  padding: 10px;
  border: none;
  cursor: pointer;
}

/* 드롭다운 목록 스타일 */
.dropdown-content {
  display: none;
  background-color: #f1f1f1;
  min-width: 160px;
  border: 1px solid #ddd;
  position: absolute;
}

/* 드롭다운 목록 아이템 스타일 */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* 드롭다운 목록 아이템 스타일 (마우스 오버 상태) */
.dropdown-content a:hover {
  background-color: #ddd;
}

/* 드롭다운 버튼에 마우스를 올렸을 때 목록 표시 */
.dropdown:hover .dropdown-content {
  display: block;
}

/* 하위 메뉴 목록 스타일 */
.dropdown .dropdown-content {
  position: static;
  display: none;
}

/* 하위 메뉴 버튼 스타일 */
.dropdown .dropdown-btn {
  background-color: #ddd;
  color: black;
}
    </style>
    <!-- <script src="https://code.jquery.com/jquery-3.6.4.js"></script> -->
<body>
<div class="dropdown">
  <button class="dropdown-btn">메뉴</button>
  <div class="dropdown-content">
    <a href="#">링크 1</a>
    <a href="#">링크 2</a>
    <div class="dropdown">
      <button class="dropdown-btn">하위 메뉴</button>
      <div class="dropdown-content">
        <a href="#">하위 링크 1</a>
        <a href="#">하위 링크 2</a>
      </div>
    </div>
    <a href="#">링크 3</a>
  </div>
</div>
</body>
</html>