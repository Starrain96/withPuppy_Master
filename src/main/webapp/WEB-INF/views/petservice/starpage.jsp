<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<%
    UserVO userVo = (UserVO) session.getAttribute("bag");
    System.out.println("header bag : " + userVo);
    String userId = userVo.getUser_id();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/star.css" />
</head>
<body>
	<form action="insertStar" id="form" method="post" enctype="multipart/form-data" >
		<div class="container-fluid">
			<!-- 메인 컨텐츠 -->
			<input type="hidden" id="service_id"  name="service_id" value="${bag.service_id}">
			<input type="hidden" id="id" name="id" value="<%=userId%>">
			<div class="col-lg-9 col-md-8 col-sm-12">
				<div class="card">
					<h5 class="card-header">리얼 리뷰 평가</h5>
					<div class="card-body">
						<!-- 프로필 정보 출력 -->
						<div class="row">
							<div class="col-md-8">
								<!-- <h5 class="card-title">John Doe</h5> 
                            <hr>-->
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><span class="info-label">친절</span>
										<span class="info-value"><label>고객응대평가</label> <input
											type="range" id="kind" name="kind" min="0" max="5" step="1"></span>
									</li>
									<li class="list-group-item"><span class="info-label">설명</span>
										<span class="info-value"><label>진료 전 치료 및 가격 설명
												평가</label> <input type="range" id="explain" name="explain" min="0"
											max="5" step="1"></span></li>
									<li class="list-group-item"><span class="info-label">진료</span>
										<span class="info-value"><label>치료 후 완쾌 수준</label> <input
											type="range" id="treat" name="treat" min="0" max="5" step="1"></span>
									</li>
									<li class="list-group-item"><span class="info-label">시설</span>
										<span class="info-value"><label>시설 및 장비 수준</label> <input
											type="range" id="facilities" name="facilities" min="0"
											max="5" step="1"></span></li>
									<li class="list-group-item"><span class="info-label">가격</span>
										<span class="info-value"><label>진료비 수준</label> <input
											type="range" id="price" name="price" min="0" max="5" step="1"></span>
									</li>
									<li class="list-group-item"><span class="info-label">리뷰
											내용</span> <span class="info-value"><textarea id="content"
												name="content" maxlength="500" cols="50" rows="10" placeholder="500자까지 입력 가능합니다."></textarea></span>
									</li>
								</ul>
								<div class="mt-3">
									<button class="btn btn-custom">리뷰 사진 추가</button><input type="file" id="img1" name="file" >
									 <button class="btn btn-outline-danger" data-bs-toggle="modal"
										data-bs-target="#exampleModal" onclick="location'insertBill'" >영수증 사진 추가</button>
								</div>
							</div>
						</div>
						<button type="submit">후기 등록</button>
					</div>
					<div class="card-footer text-muted text-end">강아지와🐶</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>