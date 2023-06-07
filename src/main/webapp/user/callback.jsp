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
  var naver_id_login = new naver_id_login("pSvOlTLlb71TIAJn2QUg", "http://localhost:8887/withPuppy/user/callback.jsp");
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
/*     alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age')); */
    //location.href=	"naverSocial?name=" + name + "&email=" + email + "&id=" + id
    $.ajax({
      	type: 'POST',
          url: "<%=contextPath%>"+'/user/naverLogin',
          data: { 
              	nid:nid
       			},
         	success: function(data) {
         		console.log("네이버 아이디 로그인 연동되었습니다!");
         		if (data == 1) {
         			alert("네이버 아이디 로그인 연동되었습니다!");
         			location.replace("<%=contextPath%>"+'/main.jsp');
         		} else {
         			alert("네이버 아이디 로그인 연동 실패!");
         			location.replace("<%=contextPath%>"+'user/loginpage');
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
   			}
 	}); --%>
</script>
</body>
</html>