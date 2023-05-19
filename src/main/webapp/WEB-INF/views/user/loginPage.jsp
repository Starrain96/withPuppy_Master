<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%-- header --%>
<%@ include file="/header.jsp"%>
<%-- header END --%>
    
<head>
    <meta charset="UTF-8">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>🐶강아지와 로그인🐶</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .login-form {
            border-radius: 10px;
            width: 300px;
            background-color: #fafafa;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,.2);
        }

        .login-form h1 {
            font-size: 26px;
            text-align: center;
            margin-bottom: 30px;
        }

        .text-field {
            font-size: 14px;
            padding: 10px;
            margin-bottom: 15px;
            border-color: #ffffff;
            border-radius: 10px;
            width: 100%;
        }
        
        .text-field:focus {
            outline: none;
            border-color: #ffe98c;
            box-shadow: 0 0 0 0.2rem rgba(255, 233, 140, 0.25);
        }

        .submit-btn {
        	font-weight: bold;
            font-size: 14px;
            color: #000;
            padding: 10px;
            border-radius: 10px;
            background-color: #ffe98c;
            border: none;
            width: 100%;
            cursor:pointer;
            transition: background-color ease-in-out 0.3s;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #464646;
            text-decoration: none;
            font-size: 14px;
            text-decoration-line: underline;
            cursor:pointer;
        }
    </style>
</head>
    
<% if(session.getAttribute("id") == null){ %>
    <div class="login-form">
        <form action="loginPage" method="post">
            <h1>로그인🐶</h1>
            <input name="id" type="text" class="text-field" placeholder="아이디">
            <input name="pw" type="password" class="text-field" placeholder="비밀번호">
            <input type="submit" class="submit-btn" value="로그인">
        </form>
        <div class="links">
            <a href="signupUser">회원가입</a>
        </div>
    </div>
<%} else {%>
    <a href="main.jsp">메인페이지</a>
    <a href="mypage">마이페이지</a>
<%} %>