<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<%
	UserVO userVo = (UserVO) session.getAttribute("bag");
System.out.println("header bag : " + userVo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/main.css" />

</head>
<style>
.container {
  padding-right: 10%;
  padding-left: 10%;
}
.navbar-fluid ul.navbar-nav {
	margin-left: auto;
}
header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 9999;
}
body {
  padding-top: 230px;
}

</style>
<body>
	<header class="border-bottom">

		<nav class="header-nav"
			style="display: flex; justify-content: flex-end; margin-right: auto; background-color: #FFFFFF;">
			<ul class="nav nav-pills">
				<%if (userVo == null) {%>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/user/loginPage"
					class="nav-link link-secondary">로그인</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/user/myPage"
					class="nav-link link-secondary">마이페이지</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/shopping/cartList"
					class="nav-link link-secondary">장바구니</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/user/logoutUser"
					class="nav-link link-secondary">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</nav>

		<nav style="background-color: #F2EAD3;"
			class="navbar navbar-expand-sm justify-content-center">
			<div class="container-fluid">
				<!-- Links -->
				<ul class="navbar-nav"
					style="margin: auto; display: flex; justify-content: center; align-items: center;">
					<li class="nav-item" style="padding: 0 30px;"><a
						href="${pageContext.request.contextPath}/communities/communitiesMain?page=1"
						class="nav-link link-secondary">커뮤니티</a></li>
					<li class="nav-item" style="padding: 0 30px;"><a
						href="${pageContext.request.contextPath}/shopping/shoppingList?start=1&end=4&start_num=1&end_num=12"
						class="nav-link link-secondary">쇼핑몰</a></li>
					<li class="nav-item ml-auto"><a
						href="${pageContext.request.contextPath}/main.jsp"
						class="nav-link link-secondary"> <img
							src="${pageContext.request.contextPath}/resources/img/homelogo.png"
							alt="홈" width="70%" height="70%"
							style="display: block; margin: auto;"></a></li>
					<li class="nav-item" style="padding: 0 30px;"><a
						href="${pageContext.request.contextPath}/petservice/listhospital"
						class="nav-link link-secondary">동물병원</a></li>
					<li class="nav-item" style="padding: 0 30px;"><a
						href="${pageContext.request.contextPath}/cs/selectFaqList"
						class="nav-link link-secondary">고객센터</a></li>
				</ul>
			</div>
		</nav>

	</header>
