<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- header --%>
    <%@ include file="/header.jsp"%>
    <%-- header END --%>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
 <title>🐶강아지와 로그인🐶</title>
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
		body {
		    margin-right: 5%;
		    margin-left: 5%;
		    background-color: #ffe98c;
		}
		.con1 {
		    margin-right: 5%;
		    float: right;
		    width: 300px;
		}
		.login-form {
		    /* border: 3px solid red; */
		    border-radius: 5px;
		    width: 300px;
		    background-color: #eeeff1;
		    padding: 20px;
		    margin: 200px auto;
		}
		.login-form h1 {
		    font-size: 32px;
		    text-align: center;
		    margin-bottom: 50px;
		}
		.text-field {
		    font-size: 14px;
		    padding: 10px;
		    margin-bottom: 10px;
		    border-radius: 5px;
		    border: none;
		    width: 100%;
		    box-sizing: border-box;
		}
		/* 같은 width 100% 인데 submit 은 박스사이징을 안해도 되는 이유는
		        submit에는 자동으로 border-box가 적용이 된다 */
		.submit-btn {
		    font-size: 14px;
		    color: #000;
		    padding: 10px;
		    border-radius: 5px;
		    background-color: #ffe98c;
		    border: none;
		    width: 100%;
		}
		.links {
		    text-align: center;
		    margin: 10px;
		}
		.links a {
		    color: #9b9b9b;
		    text-decoration: none;
		    font-size: 12px;
		    text-decoration-line: underline;
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
</body>
</html>