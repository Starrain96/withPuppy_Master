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
		
		.list-group-item:before,
		.list-group-item:after, 
		.list-group-item2:before,
		.list-group-item2:after  {
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
		
		.list-group-item:hover:before,
		.list-group-item:hover:after,
		.list-group-item2:hover:before,
		.list-group-item2:hover:after{
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
        
        #tel1, #tel2, #tel3 {
			width: 150px;
        }
    </style>
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
                <h5 class="card-header">프로필 관리</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="row">
                        <div class="col-md-4 text-center d-flex flex-column align-items-center justify-content-center">
						  <img src="https://picsum.photos/200/" alt="John Doe" class="rounded-circle img-fluid">
						  <a href="#" class="mt-3 btn btn-custom">프로필 사진 변경</a>
						</div>
                        <div class="col-md-8">
                            <!-- <h5 class="card-title">John Doe</h5> 
                            <hr>-->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
              						<span class="info-label">이름</span> 
								    <span class="info-value">john</span>
								</li>
                                <li class="list-group-item">
                                	<span class="info-label">전화번호</span>
								    <input type="text" id="tel1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3">
	        						<span class="hypen">-</span>
	        						<input type="text" id="tel2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
				        			<span class="hypen">-</span>
				        			<input type="text" id="tel3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
								</li>
								<li class="list-group-item">
              						<span class="info-label">아이디</span> 
								    <span class="info-value">johndoe</span>
								</li>
                                <li class="list-group-item">
              						<span class="info-label">닉네임</span> <p></p>
								    <input type="text" id="nickname" maxlength="10">
							        <input id="nickname_check" type="button" value="중복확인">
							        <p><span id="successNicknameChk">※닉네임은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span></p>
						    		<input type="hidden" id="nicknameDoubleChk"/>
								</li>
                                <li class="list-group-item">
								  <span class="info-label">이메일</span> 
								  <span class="info-value">john.doe@example.com</span>
								</li>
                                <li class="list-group-item">
              						<span class="info-label">주소</span> <p></p>
								    <input type="text" id="addr1" placeholder="우편번호">
							        <input id='addr_find' type="button" onclick="addrFind()" value="우편번호 찾기"><p></p>
							        <input type="text" id="addr2" placeholder="주소" style="width: 500px;"><p></p>
							        <input type="text" id="addr3" placeholder="상세주소" style="width: 300px;">
							        <input type="text" id="addr4" placeholder="참고항목" style="width: 300px;">
							        <input type="hidden" id="addrDoubleChk"/></td>
								</li>
                            </ul>
                            <div class="mt-3">
							    <a href="#" class="btn btn-custom">수정하기</a>
							</div>
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