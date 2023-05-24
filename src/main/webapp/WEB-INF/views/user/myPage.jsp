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
<link rel="stylesheet" href="../resources/css/user.css">
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="../resources/js/mypage.js"></script>
<script type="text/javascript">
var path = "<%=contextPath %>";
</script>
</body>
</html>