<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/user.css">
</head>
<%
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
						<li class="list-group-item"><a href="<%=contextPath%>/user/userCommu">내 활동기록</a>
							<ul class="list-group2 list-group-flush">
								<li class="list-group-item2"><a href="<%=contextPath%>/user/userCommu">커뮤니티</a></li>
								<li class="list-group-item2"><a href="<%=contextPath%>/user/userShopping">쇼핑몰</a></li>
								<li class="list-group-item2"><a href="<%=contextPath%>/user/userReview">리뷰</a></li>
							</ul>
						</li>
                    </ul>
                </div>
            </div>
        </div>