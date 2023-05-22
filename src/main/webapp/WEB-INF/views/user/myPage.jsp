<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- header --%>
<%@ include file="/header.jsp"%>
<%-- header END --%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>마이페이지</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.container-fluid {
	padding: 50px 10%;
}

.card-header {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: #ffe98c;
	color: #000;
	height: 70px;
}

.card-footer {
	background-color: #F5F5F5;
}

.list-group-item {
	margin-bottom: 0.75rem !important;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	font-size: 1.2em;
	padding-top: 1.2rem !important;
	padding-bottom: 1.2rem !important;
}

.list-group-item2 {
	margin-bottom: 0.75rem !important;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	font-size: 0.95em;
}

.list-group-item .list-group-item2 .info-label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 1rem;
}

.list-group-item .list-group-item2 .info-value {
	display: inline-block;
	margin-right: 2rem;
}

.list-group-item:hover, .list-group-item2:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
}

.list-group-item a, .list-group-item2 a {
	color: #333;
	text-decoration: none;
	display: block;
	padding: 0.5rem;
}

.list-group-item a:hover, .list-group-item2 a:hover {
	color: #555;
}

.list-group-item:before, .list-group-item:after, .list-group-item2:before,
	.list-group-item2:after {
	content: "";
	position: absolute;
	width: 5px;
	height: 100%;
	left: 0;
	background-color: #ffe98c;
	transform: translateY(-100%);
	transition: transform 0.3s ease;
}

.list-group-item:before, .list-group-item2:before {
	top: 0;
}

.list-group-item:after, .list-group-item2:after {
	bottom: 0;
	transform: translateY(100%);
}

.list-group-item:hover:before, .list-group-item:hover:after,
	.list-group-item2:hover:before, .list-group-item2:hover:after {
	transform: translateY(0);
}

.info-label {
	display: inline-block;
	width: 150px;
	font-weight: bold;
}

.info-value {
	display: inline-block;
}

/* 추가 스타일 */
.btn-custom {
	color: white;
	background-color: #60626C;
}

.btn-custom:hover {
	background-color: #ffe98c;
	color: black;
}
.img-wrapper {
    position: relative;
    width: 200px;
    height: 200px;
    overflow: hidden;
    border-radius: 50%;
}

.img-wrapper img {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    height: 100%;
    width: auto;
}
</style>
</head>
<%
//세션에서 값을 꺼내는 방법 
String user_id = (String) session.getAttribute("user_id");
System.out.println("user_id : " + user_id);
/* userVO bag = (userVO)session.getAttribute("bag");
System.out.println("bag : " + bag); */
String contextPath = (String) request.getContextPath();
%>
<div class="container-fluid">
	<div class="row">
		<!-- 사이드 메뉴 -->
		<div class="col-lg-3 col-md-4 col-sm-12">
			<div class="card">
				<h5 class="card-header">마이페이지</h5>
				<div class="card-body p-0">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
						<a href="<%=contextPath%>/user/myPage">프로필 관리</a></li>
						<li class="list-group-item"><a href="<%=contextPath%>/user/myPet">내 반려동물</a></li>
						<li class="list-group-item"><a href="<%=contextPath%>/user/userHistory">내 활동기록</a>
							<ul class="list-group2 list-group-flush">
								<li class="list-group-item2"><a href="<%=contextPath%>/user/userHistory">커뮤니티</a></li>
								<li class="list-group-item2"><a href="#">쇼핑몰</a></li>
								<li class="list-group-item2"><a href="#">리뷰</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 -->
		<div class="col-lg-9 col-md-8 col-sm-12">
			<div class="card">
				<h5 class="card-header">프로필 관리</h5>
				<div class="card-body" id="card-body">
					<!-- 프로필 정보 출력 -->
					<div class="row" id="row">
						<div
							class="col-md-4 text-center d-flex flex-column align-items-center justify-content-center">
							<div class="img-wrapper">
							<img src="<%=contextPath%>/resources/img/profile.png" alt="profile img" id="img">
							</div>
						</div>
						<div class="col-md-8">
							<!-- <h5 class="card-title">John Doe</h5> 
                            <hr>-->
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
								<li class="list-group-item"><span class="info-label">회원
										등급</span> <span class="info-value">${bag.user_level}</span></li>
								<li class="list-group-item"><span class="info-label">방문
										횟수</span> <span class="info-value">${bag.user_visit}</span></li>
							</ul>
							<div class="mt-3">
								<a href="#" id="edit" class="btn btn-custom">수정하기</a>
								<button id="delete" class="btn btn-outline-danger"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									탈퇴하기</button>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">

//회원탈퇴 버튼
$("#delete").click(function(){
$("#card-body").html(`<!-- 프로필 정보 출력 -->
	<div class="row">
		<div class="col-md-12">
	    <!-- <h5 class="card-title">John Doe</h5> 
	    <hr>-->
	    <ul class="list-group list-group-flush">
			<li class="list-group-item">
	        <span class="info-label">비밀번호</span> 
				<input type="password" id="pw" maxlength="20">
			</li>
	    </ul>
	    <div class="mt-3">
			<button id="delete2" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
				 탈퇴하기
			</button>
		</div>
	    </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">경고</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body" id="modal-body">
	                	정말 탈퇴하시겠습니까? 확인을 선택하면 탈퇴되며 메인 페이지로 이동합니다.
	            </div>
	            <div class="modal-footer">
	                <button type="button" id="cancel" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                <form id="delete-form">
	                <button type="button" id="delete_ok" class="btn btn-primary">확인</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>`);
	}); // delete
	
	$("#delete_ok").click(function(){
		$.ajax({
	        url: "<%=contextPath%>"+'/pwCheck',
	        type: 'POST',
	        data: { pw: $('#pw').val() },
	        success: function (result) {
	            if (result === 1) { 
	                $.ajax({
	                    url: "<%=contextPath%>"+'/deleteUser',
	                    type: 'POST',
	                    success: function() {
	                        alert("회원탈퇴가 완료되었습니다.");
	                        location.href = "/main";
	                    },
	                    error: function(data) {
	                        alert("회원탈퇴 중 오류가 발생하였습니다.");
	                    }
	                }); // ajax
	            } else { 
	                $('#modal-body').text('비밀번호가 일치하지 않습니다.'); 
	            }
	        },
	        error: function () { 
	            $('#modal-body').text('서버와 통신에 실패하였습니다.');
	        }
	    }); // ajax
	}); // delete_ok

$("#edit").click(function(){
	$("#row").load("<%=contextPath%>"+'/user/editUser');
	}); // edit

</script>
</body>
</html>