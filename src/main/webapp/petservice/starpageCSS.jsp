<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- header --%>
<%@ include file="/header.jsp"%>
<%-- header END --%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>프로필</title>
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
	width: 100px;
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
</style>
</head>
<div class="container-fluid">
	<!-- 메인 컨텐츠 -->
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
									type="range" id="facilities" name="facilities" min="0" max="5"
									step="1"></span></li>
							<li class="list-group-item"><span class="info-label">가격</span>
								<span class="info-value"><label>진료비 수준</label> <input
									type="range" id="price" name="price" min="0" max="5" step="1"></span>
							</li>
							<li class="list-group-item"><span class="info-label">리뷰
									내용</span> <span class="info-value"><textarea id="content"
										name="content" maxlength="500" cols="50" rows="10"></textarea></span>
							</li>
						</ul>
						<div class="mt-3">
							<a href="#" class="btn btn-custom">리뷰 사진 추가</a>
							<button class="btn btn-outline-danger" data-bs-toggle="modal"
								data-bs-target="#exampleModal">영수증 사진 추가</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted text-end">강아지와🐶</div>
		</div>
	</div>
</div>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>