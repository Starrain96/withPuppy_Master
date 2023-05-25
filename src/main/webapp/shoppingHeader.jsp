<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<% 
    UserVO userVo = (UserVO) session.getAttribute("bag");
	String user_level=null;
	if(userVo != null){
	user_level = userVo.getUser_level();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<script type="text/javascript">
var user_level = "<%=user_level%>";
function loginCheck(){
	if( user_level != "null"){
		console.log(user_level);
		location.href="cartList";
	}else{
		alert("로그인해야 이동가능한 페이지입니다.");
	}
}
</script>

<body>
	<header
		class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
		<a href="../main.jsp"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use>
            </svg> <span class="fs-4" style="color: black; font-weight: bold">강아지와</span>
		</a>
		<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
			<input type="search" class="form-control" placeholder="Search..."
				aria-label="Search">
		</form>

		<ul class="nav nav-pills">
			<li class="nav-item"><a href="shoppingList?start=1&end=4&start_num=1&end_num=12" class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a class="nav-link link-dark" onclick="loginCheck()">장바구니</a></li>
			<%if(user_level!=null && user_level.equals("관리자")) {%>
			<li class="nav-item"><a href="shopManageMain?start_num=1&end_num=10" class="nav-link link-dark">관리자</a></li>
			<%}else{}%>
		</ul>
	</header>
	