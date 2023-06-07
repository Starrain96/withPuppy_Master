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
<%
	String contextPath = (String) request.getContextPath();
%>
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
        <div class="social">
	        <div id="naver_id_login" style="display:none"></div>
	        <img id="naverLogin" class="social-icon" src="<%=contextPath%>/resources/img/social-login-icon-n.png">
	        <div id="kakao_id_login" class="social-icon">
	        	<a href="javascript:loginWithKakao()">
	        	<img src="<%=contextPath%>/resources/img/social-login-icon-k.png"></a>
	        </div>
        </div>
    </div>
<%} else {%>
    
<%} %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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

// 네이버 소셜 로그인

$(document).on("click", "#naverLogin", function(){ 
	var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
	btnNaverLogin.click();
});
var naver_id_login = new naver_id_login("pSvOlTLlb71TIAJn2QUg", "http://localhost:8887/withPuppy/user/callback.jsp");
var state = naver_id_login.getUniqState();
naver_id_login.setDomain("http://localhost:8887/withPuppy");
naver_id_login.setState(state);
//naver_id_login.setPopup();
naver_id_login.init_naver_id_login();



//2. 카카오 초기화
Kakao.init('7dbc3e7a51df45caeb2bf1a6ac3235de');
console.log( Kakao.isInitialized() ); // 초기화 판단여부

// 3. 데모버전으로 들어가서 카카오로그인 코드를 확인.
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            console.log(authObj); // access토큰 값
            Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

            getInfo();
        },
        fail: function (err) {
            console.log(err);
        }
    });
}

// 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // 이메일, 성별, 닉네임, 프로필이미지
            var email = res.kakao_account.email;
            console.log(email);
            idx = email.indexOf("@"); 
            kid = email.substring(0, idx);
            $.ajax({
              	type: 'POST',
                  url: "<%=contextPath%>"+'/user/kakaoLogin',
                  data: { 
                	  	kid:kid
               			},
                 	success: function(data) {
                 		console.log("카카오 아이디 로그인 연동되었습니다!");
                 		if (data == 1) {
                 			alert("카카오 아이디 로그인 연동되었습니다!");
                 			location.replace("<%=contextPath%>"+'/main.jsp');
                 		} else {
                 			alert("카카오 아이디 로그인 연동 실패!");
                 			location.replace("<%=contextPath%>"+'user/loginpage');
                 		}
                  	}
             	});
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
        }
    });
}
</script>