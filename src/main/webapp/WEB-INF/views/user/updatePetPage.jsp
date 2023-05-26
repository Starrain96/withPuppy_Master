<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
<%
String pet_no = request.getParameter("pet_no");
%>
        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">반려동물 관리</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="container">
	                    <form action="updatePet" id="form" method="post" enctype="multipart/form-data" onsubmit="return checkForm()" target='blankifr'>
	                    <div class="row d-flex flex-column align-items-center" id="pet_info">
	                    	<!-- 반려동물이 들어갈 영역 -->
	                    	<div class="container ms-4">
		                        <div id="pet_img" style="float: left; margin-right:30px; text-align: center" class="col-3">
									<img class="img-wrapper" src="" alt="profile img" id="img">
									<label for="file-input" class="upload-btn">반려동물 사진 변경</label>
									<a href="#" class="btn btn-custom" id="file-delete" onclick="deleteImage()">반려동물 사진 삭제</a>
									<input type="file" id="file-input" name="file" onclick="editImg()" style="display: none">
								</div>
		                        <div style="float: left;" class="col-8">
		                        	<input type="hidden" id ="petNo" name="pet_no" value="<%=pet_no%>">
		                            <ul class="list-group list-group-flush">
		                            	<li class="list-group-item">
										    <span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 이름</span> 
								    		<input type="text" id="petName" name="pet_name">
										</li>
		                                <li class="list-group-item">
										    <span class="info-label">반려동물 출생일</span> 
								    		<input type="text" id="petBirth" name="pet_birth">
										</li>
		                                <li class="list-group-item">
		                                	<span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 종</span> 
										    <input type="text" id="petKind" name="pet_kind">
										</li>
		                                <li class="list-group-item">
		              						<span class="info-label">반려동물 몸무게</span> 
										    <input type="text" id="petWeight" name="pet_weight" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;kg
										</li>
		                            </ul>
		                     	</div>
	                        </div>
	                    </div>
	                    <div class="row">
	                    	<!-- 하단 우측 버튼을 위한 영역 -->
	                    	<div class="register-div">
						    	<button class="btn btn-custom" type="submit" style="float: right; margin-right:35px">반려동물 수정</button>
							</div>
	                    </div>
	                    </form>
	                    <iframe name='blankifr' style='display:none;'></iframe>
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
var img;
$(function() {
	petlist();
})
function petlist() {
	$.ajax({
		url: "../user/petList",
		success: function(data) {
			for (i = 0; i < data.length; i++) {
				if (data[i].pet_no == <%=pet_no%>) {
					if (!data[i].pet_img) { // 프로필 이지미지가 null이면
						$("#img").attr("src", "<%=contextPath%>/resources/upload/profile.png");
					} else {
						$("#img").attr("src", "<%=contextPath%>/resources/upload/"+data[i].pet_img);
					}
				   	img = data[i].pet_img;
				   	console.log($("#img").attr("src"));
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

// 이미지 삭제
function deleteImage() {
	$("#img").attr("src", "<%=contextPath%>/resources/upload/profile.png");
}

function checkForm() {
    var petname = $('#petName').val();
    var petbirth = $('#petBirth').val();
    var petkind = $('#petKind').val();
    var petweight = $('#petWeight').val();
    var petimg = $('#file-input').val();
    
    if (petname == "" || petbirth == "" || petkind == "" || petweight == "") {
        alert("정보를 모두 입력하세요!");
        console.log("정보 미입력");
        return false;
    }
    alert("반려동물 정보 수정 완료!")
    location.replace("<%=contextPath%>/user/myPet");
    return true;
}
</script>
</body>
</html>