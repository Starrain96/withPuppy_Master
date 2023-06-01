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
    	<h1>로그인🐶</h1>
        <input name="user_id" id="id" type="text" class="text-field" placeholder="아이디">
       	<input name="user_pw" id="pw" type="password" class="text-field" placeholder="비밀번호">
        <input type="button" class="submit-btn" onclick="loginUser()" value="로그인">
        <p><span id="loginFail" style="font-size: 13px;"></span></p>
        <div class="links">
            <a href="signupUser">회원가입</a>
        </div>
    </div>
<%} else {%>
    
<%} %>
<%
	String contextPath = (String) request.getContextPath();
%>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">
function loginUser() {
	var id = $('#id').val();
	var pw = $('#pw').val();
	$.ajax({
    	type: 'POST',
        url: "<%=contextPath%>"+'/user/loginUser',
        data: { id : id,
            	pw : pw
     },
     	success: function(result) {
        	if (result == '1'){
            	window.location.replace("<%=contextPath%>"+'/main.jsp')
            } else {
            	$('#loginFail').text('아이디 또는 비밀번호를 잘못 입력했습니다!');
        		$('#loginFail').css("color", "red");
            }
      	}
   	});
}
$(document).keyup(function(event) {
    if (event.which === 13) {
    	loginUser();
    }
});
</script>