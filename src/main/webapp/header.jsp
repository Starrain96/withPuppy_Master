<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<%
    UserVO userVo = (UserVO) session.getAttribute("bag");
    System.out.println("header bag : " + userVo);
    String user_level = null;
	if(userVo != null){
		user_level = userVo.getUser_level();
	}
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
<body>
	<header
		class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
		<a href="${pageContext.request.contextPath}/main.jsp"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use>
            </svg> <span class="fs-4" style="color: black; font-weight: bold">강아지와</span>
		</a>

		<ul class="nav nav-pills">
			<!-- <li class="nav-item"><a href="#" class="nav-link active"
                aria-current="page">Home</a></li> -->
            <li class="nav-item"><a href="${pageContext.request.contextPath}/communities/communitiesMain?page=1" class="nav-link link-secondary">커뮤니티</a></li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/shopping/shoppingList?start=1&end=4&start_num=1&end_num=12" class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/petservice/listhospital" class="nav-link link-secondary">동물병원</a></li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/cs/selectFaqList" class="nav-link link-secondary">고객센터</a></li>
			<%if (userVo == null) {%>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/user/loginPage" class="nav-link link-secondary">로그인</a></li>
            <%} else { %>
            	<% if (user_level != null && user_level.equals("관리자")) { %>
                	<li class="nav-item"><a href="${pageContext.request.contextPath}/user/userManagement" class="nav-link link-secondary">회원관리</a></li>
                <%} %>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/user/myPage" class="nav-link link-secondary">마이페이지</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/user/logoutUser" class="nav-link link-secondary">로그아웃</a></li>
            <%} %>

		</ul>
	</header>