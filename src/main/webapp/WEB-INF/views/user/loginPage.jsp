<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- header --%>
<%@ include file="/header.jsp"%>
<%-- header END --%>
 
<head>
    <meta charset="UTF-8">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/user.css">
    <title>🐶강아지와 로그인🐶</title>
</head>
    
<% if(userVo == null){ %>
    <div class="login-form">
        <form action="loginUser" method="post">
            <h1>로그인🐶</h1>
            <input name="user_id" type="text" class="text-field" placeholder="아이디">
            <input name="user_pw" type="password" class="text-field" placeholder="비밀번호">
            <input type="submit" class="submit-btn" value="로그인">
        </form>
        <div class="links">
            <a href="signupUser">회원가입</a>
        </div>
    </div>
<%} else {%>
    <a href="../main.jsp">메인페이지</a>
<%} %>