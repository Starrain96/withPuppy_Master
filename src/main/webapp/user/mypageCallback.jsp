<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
<%
	String contextPath = (String) request.getContextPath();
%>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("pSvOlTLlb71TIAJn2QUg", "http://localhost:8887/withPuppy/user/mypageCallback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	name = naver_id_login.getProfileData('name')
	email = naver_id_login.getProfileData('email')
	idx = email.indexOf("@"); 
    nid = email.substring(0, idx);
    console.log(nid)
    $.ajax({
      	type: 'POST',
          url: "<%=contextPath%>"+'/user/naverSocial',
          data: { 
              	nid:nid
       			},
         	success: function(data) {
         		console.log("네이버 아이디 로그인 연동되었습니다!");
         		if (data == 1) {
         			alert("네이버 아이디 로그인 연동되었습니다!");
         			location.replace("<%=contextPath%>"+'/user/myPage');
         		}
          	}
     	});
  }
 <%-- $.ajax({
  	type: 'POST',
      url: "<%=contextPath%>"+'/user/naverSocial',
      data: { name : name,
          	email : email,
          	nickname : nickname,
          	id:id
   			},
     	success: function(result) {
        	if (result == '1'){
            	window.location.replace("<%=contextPath%>"+'/main.jsp')
            } else {
            	$('#loginFail').text('아이디 또는 비밀번호를 잘못 입력했습니다!');
        		$('#loginFail').css("color", "red");
            }
      	}
 	}); --%>
</script>
</body>
</html>