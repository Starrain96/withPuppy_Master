<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<%
    UserVO userVo = (UserVO) session.getAttribute("bag");
    System.out.println("header bag : " + userVo);
    String userPageID = null;
    String userPageLevel = null;
    if (userVo != null) {
    userPageID = userVo.getUser_id();
    userPageLevel = userVo.getUser_level();
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
	margin-left : 15%;
	margin-right : 15%;
  padding-top: 230px;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

thead {
	background-color: #FFE98C
}
</style>
<script type="text/javascript">
var userPageID = "<%=userPageID%>";
function loginCheckCart(){
    if( userPageID != "null"){
        console.log(userPageID);
        location.href="${pageContext.request.contextPath}/shopping/cartList";
    }else{
        alert("로그인해야 이동가능한 페이지입니다.");
    }
}
function loginCheckAsk(){
    if( userPageID != "null"){
        console.log(userPageID);
        location.href="${pageContext.request.contextPath}/cs/selectAskList?Ask_writer=<%=userPageID%>";
    }else{
        alert("로그인해야 이동가능한 페이지입니다.");
    }
}
</script>
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
                        if (userPageLevel.equals("관리자")) {
                %>
                        <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/user/userManagement?page=1"
                        class="nav-link link-secondary">회원관리</a></li>
                <%
                        }
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
            <div class="container-fluid01">
                <!-- Links -->
                <ul class="navbar-nav"
                    style="margin: auto; display: flex; justify-content: center; align-items: center;">
                    
                    <li class="nav-item dropdown link-secondary" style="padding: 0 30px;"><a
                        href="#"
                        class="nav-link dropdown-toggle">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/communities/communitiesMain?page=1">전체게시물</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/communities/Metrolist_category?page=1">수도권</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/communities/Vincelist_category?page=1">지방</a></li>
                         </ul>
                    </li>
                    
                    <li class="nav-item dropdown link-secondary" style="padding: 0 30px;"><a
                        href="#"
                        class="nav-link dropdown-toggle">쇼핑몰</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopping/shoppingList?start=1&end=4&start_num=1&end_num=12">쇼핑몰</a></li>
                            <li><a class="dropdown-item" onclick="loginCheckCart()">장바구니</a></li>
                            <%
                            if((userVo != null)&&(userPageLevel.equals("관리자"))){ %>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopping/shopManageMain?start_num=1&end_num=10">상품관리</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopping/shopManageStatis">통계</a></li>
                            <%} %>
                         </ul>
                    </li>
                    
                    <li class="nav-item ml-auto"><a
                        href="${pageContext.request.contextPath}/main.jsp"
                        class="nav-link link-secondary"> <img
                            src="${pageContext.request.contextPath}/resources/img/homelogo.png"
                            alt="홈" width="70%" height="70%"
                            style="display: block; margin: auto;"></a></li>
                        
                    <li class="nav-item dropdown link-secondary" style="padding: 0 30px;"><a
                        href="#"
                        class="nav-link dropdown-toggle">동물병원</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/petservice/listhospital">동물병원찾기</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/petservice/mainFee">진료비비교</a></li>
                         </ul>
                    </li>
                        
                    <li class="nav-item dropdown link-secondary" style="padding: 0 30px;"><a
                        href="#"
                        class="nav-link dropdown-toggle">고객센터</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cs/selectFaqList">자주묻는질문</a></li>
                            <li><a class="dropdown-item" onclick="loginCheckAsk()">1:1문의</a></li>
                         </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>