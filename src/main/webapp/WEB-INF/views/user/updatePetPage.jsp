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
<%
String contextPath = (String) request.getContextPath();
String pet_no = request.getParameter("pet_no");
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
                <h5 class="card-header">반려동물 관리</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="container">
	                    <div class="row d-flex flex-column align-items-center" id="pet_info">
	                    	<!-- 반려동물이 들어갈 영역 -->
	                    	<div class="container ms-4">
		                        <div id="pet_img" style="float: left; margin-right:30px; text-align: center" class="col-3">
									<img class="img-wrapper" src="<%=contextPath%>/resources/img/profile.png" alt="profile img" id="img">
									<label for="file-input" class="upload-btn">반려동물 사진 변경</label>
									<a href="#" class="btn btn-custom" id="file-delete" onclick="deleteImage()">반려동물 사진 삭제</a>
									<input type="file" id="file-input" name="file-input" onclick="editImg()" style="display: none">
								</div>
		                        <div style="float: left;" class="col-8">
		                            <ul class="list-group list-group-flush">
		                            	<li class="list-group-item">
										    <span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 이름</span> 
								    		<input type="text" id="petName">
										</li>
		                                <li class="list-group-item">
										    <span class="info-label">반려동물 출생일</span> 
								    		<input type="text" id="petBirth">
										</li>
		                                <li class="list-group-item">
		                                	<span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 종</span> 
										    <input type="text" id="petKind">
										</li>
		                                <li class="list-group-item">
		              						<span class="info-label">반려동물 몸무게</span> 
										    <input type="text" id="petWeight" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;kg
										</li>
		                            </ul>
		                     	</div>
	                        </div>
	                    </div>
	                    <div class="row">
	                    	<!-- 하단 우측 버튼을 위한 영역 -->
	                    	<div class="register-div">
						    	<a class="btn btn-custom" onclick="updatePet()" style="float: right; margin-right:35px">반려동물 수정</a>
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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function() {
	petlist();
})
function petlist() {
	$.ajax({
		url: "../user/petList",
		success: function(data) {
			for (i = 0; i < data.length; i++) {
				if (data[i].pet_no == <%=pet_no%>) {
					$('#petName').val(data[i].pet_name);
					
					// pet_birth 값을 Date 객체로 변환
					var birthDate = new Date(data[i].pet_birth);
					
					// 날짜 형식을 'yyyy-mm-dd'로 변환
					var formattedDate = birthDate.getFullYear() + '-' + ('0' + (birthDate.getMonth() + 1)).slice(-2) + '-' + ('0' + birthDate.getDate()).slice(-2);
					
					$('#petKind').val(data[i].pet_kind);
					$('#petWeight').val(data[i].pet_weight);
					break; // pet_no와 일치하는 정보를 찾았으므로 반복문 종료
				}
			}
			// 새로운 Datepicker 초기화
			$('#petBirth').val(formattedDate).datepicker({
				dateFormat: 'yy-mm-dd',
				defaultDate: formattedDate
			});
		}
	});
}
//이미지 미리보기
var sel_file;

$(document).ready(function() {
    $("#file-input").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

    filesArr.forEach(function(f) {
        if (!f.type.match(reg)) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

// 이미지 등록
function editImg() {
    console.log('이미지선택');
} // editPw

// 이미지 삭제
function deleteImage() {
	var img = document.getElementById("img");
	img.src = "<%=contextPath%>/resources/img/profile.png";
}

function updatePet(){
	console.log(<%=pet_no%>);
	console.log(<%=pet_no%>);
}
</script>
</body>
</html>