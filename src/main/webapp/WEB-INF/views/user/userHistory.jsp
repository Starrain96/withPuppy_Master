<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- header --%>
    <%@ include file="/header.jsp"%>
    <%-- header END --%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>프로필</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/user.css">
</head>
<div class="container-fluid">
    <div class="row">
        <!-- 사이드 메뉴 -->
        <div class="col-lg-3 col-md-4 col-sm-12">
            <div class="card">
                <h5 class="card-header">마이페이지</h5>
                <div class="card-body p-0">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a href="#">프로필 관리</a></li>
                        <li class="list-group-item"><a href="#">내 반려동물</a></li>
                        <li class="list-group-item"><a href="#">내 활동기록</a>
                        	<ul class="list-group2 list-group-flush">
					        <li class="list-group-item2"><a href="#">커뮤니티</a></li>
					        <li class="list-group-item2"><a href="#">쇼핑몰</a></li>
					        <li class="list-group-item2"><a href="#">리뷰</a></li>
					        <li class="list-group-item2"><a href="#">반려동물 신고</a></li>
					    </ul></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">게시글 목록</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="row">
					<!-- 게시글 목록 -->
					<div class="col-sm-12">
					    <ul class="list-group list-group-flush">
					        <li class="list-group-item">
					            <div class="d-flex justify-content-between align-items-center">
					                <a href="#">제목</a>
					                <span class="badge bg-secondary text-light">2022-01-01</span>
					            </div>
					        </li>
					        <li class="list-group-item">
					            <div class="d-flex justify-content-between align-items-center">
					                <a href="#">제목</a>
					                <span class="badge bg-secondary text-light">2022-01-02</span>
					            </div>
					        </li>
					    </ul>
					</div>
					</div>
                </div>
                <div class="card-footer text-muted text-end">
                   	강아지와🐶
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>