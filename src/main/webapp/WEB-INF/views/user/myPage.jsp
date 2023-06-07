<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
<%
//세션에서 값을 꺼내는 방법 
String user_id = (String) session.getAttribute("user_id");
System.out.println("user_id : " + user_id);
/* userVO bag = (userVO)session.getAttribute("bag");
System.out.println("bag : " + bag); */
%>
		<div class="col-lg-9 col-md-8 col-sm-12">
			<div class="card">
				<h5 class="card-header">프로필 관리</h5>
				<div class="card-body" id="card-body">
					<!-- 프로필 정보 출력 -->
					<div class="row" id="row">
						<div class="col-md-4 text-center d-flex flex-column align-items-center justify-content-center">
                            <img class="img-wrapper" src="<%=contextPath%>/resources/upload/${bag.user_img}">
                        </div>
						<div class="col-md-8">
							<div class="d-flex flex-row justify-content-end">
								<div class="social-label"><span class="info-label">소셜 로그인 연동</span></div>
								
						        <div id="naver_id_login" style="display:none"></div>
						        <img id="naverLogin" class="social-icon-m" src="<%=contextPath%>/resources/img/social-login-icon-n.png">
						        <div id="kakao_id_login" class="social-icon-m">
						        	<a href="javascript:loginWithKakao()">
						        	<img src="<%=contextPath%>/resources/img/social-login-icon-k.png"></a>
						        </div>
					        </div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><span class="info-label">이름</span>
									<span class="info-value">${bag.user_id}</span></li>
								<li class="list-group-item"><span class="info-label">전화번호</span>
									<span class="info-value">${bag.user_tel}</span></li>
								<li class="list-group-item"><span class="info-label">아이디</span>
									<span class="info-value">${bag.user_id}</span></li>
								<li class="list-group-item"><span class="info-label">닉네임</span>
									<span class="info-value">${bag.user_nickname}</span></li>
								<li class="list-group-item"><span class="info-label">이메일</span>
									<span class="info-value">${bag.user_email}</span></li>
								<li class="list-group-item"><span class="info-label">주소</span>
								<p></p> <span class="info-label">우편번호</span><span class="info-value">${bag.user_addr1}</span>
								<p></p> <span class="info-label">주소</span><span class="info-value">${bag.user_addr2}</span>
								<p></p> <span class="info-label">상세주소</span><span class="info-value">${bag.user_addr3}</span>
								<p></p> <span class="info-label">참고항목</span><span class="info-value">${bag.user_addr4}</span>
								<p></p></li>
								<div id="normalTooltip">
									<svg viewBox="0 0 27 27" xmlns="http://www.w3.org/2000/svg"><g fill="#60626C" fill-rule="evenodd"><path d="M13.5 27C20.956 27 27 20.956 27 13.5S20.956 0 13.5 0 0 6.044 0 13.5 6.044 27 13.5 27zm0-2C7.15 25 2 19.85 2 13.5S7.15 2 13.5 2 25 7.15 25 13.5 19.85 25 13.5 25z"/><path d="M12.05 7.64c0-.228.04-.423.12-.585.077-.163.185-.295.32-.397.138-.102.298-.177.48-.227.184-.048.383-.073.598-.073.203 0 .398.025.584.074.186.05.35.126.488.228.14.102.252.234.336.397.084.162.127.357.127.584 0 .22-.043.412-.127.574-.084.163-.196.297-.336.4-.14.106-.302.185-.488.237-.186.053-.38.08-.584.08-.215 0-.414-.027-.597-.08-.182-.05-.342-.13-.48-.235-.135-.104-.243-.238-.32-.4-.08-.163-.12-.355-.12-.576zm-1.02 11.517c.134 0 .275-.013.424-.04.148-.025.284-.08.41-.16.124-.082.23-.198.313-.35.085-.15.127-.354.127-.61v-5.423c0-.238-.042-.43-.127-.57-.084-.144-.19-.254-.318-.332-.13-.08-.267-.13-.415-.153-.148-.024-.286-.036-.414-.036h-.21v-.95h4.195v7.463c0 .256.043.46.127.61.084.152.19.268.314.35.125.08.263.135.414.16.15.027.29.04.418.04h.21v.95H10.82v-.95h.21z"/></g></svg>
									  
									 <span id="normalTooltipText">집사 : 신입<br>
										프로 집사 : 게시글 10개 + 댓글 10개 + 방문 5회<br>
										훈련사 : 게시글 50개 + 댓글 50개 + 방문 10회<br>
										인플루언서 : 게시글 100개 + 댓글 100개 + 방문 30회<br>
										📍 매일 자정에 업데이트 됩니다.
									</span>
								</div>
								<li class="list-group-item">
									<span class="info-label">회원 등급</span>
									<span class="info-value">${bag.user_level}</span>
								</li>
								<li class="list-group-item"><span class="info-label">방문 횟수</span>
									<span class="info-value">${bag.user_visit}</span>
								</li>
							</ul>
							<div class="mt-3">
								<a href="editUser" id="edit" class="btn btn-custom">수정하기</a>
								<button id="delete" class="btn btn-outline-danger">탈퇴하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer text-muted text-end">강아지와🐶</div>
			</div>
		</div>
	</div>
</div>


<!-- Latest compiled and minified JavaScript -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="../resources/js/mypage.js"></script>
<script type="text/javascript">
var path = "<%=contextPath %>";
if (!"${bag.user_img}") { // 프로필 이지미지가 null이면
	$("#img").attr("src", "<%=contextPath%>/resources/upload/profile.png");
} else {
	$("#img").attr("src", "<%=contextPath%>/resources/upload/${bag.user_img}");
}

//네이버 소셜 로그인

$(document).on("click", "#naverLogin", function(){ 
	var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
	btnNaverLogin.click();
});
var naver_id_login = new naver_id_login("pSvOlTLlb71TIAJn2QUg", "http://localhost:8887/withPuppy/user/mypageCallback.jsp");
var state = naver_id_login.getUniqState();
naver_id_login.setDomain("http://localhost:8887/withPuppy");
naver_id_login.setState(state);
//naver_id_login.setPopup();
naver_id_login.init_naver_id_login();


// 2. 카카오 초기화
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
            console.log(kid);
            $.ajax({
              	type: 'POST',
                  url: "<%=contextPath%>"+'/user/kakaoSocial',
                  data: { 
                      	kid: kid
               			},
                 	success: function(data) {
                 		console.log("카카오 아이디 로그인 연동되었습니다!");
                 		if (data == 1) {
                 			alert("카카오 아이디 로그인 연동되었습니다!");
                 			location.replace("<%=contextPath%>"+'/user/myPage');
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
</body>
</html>