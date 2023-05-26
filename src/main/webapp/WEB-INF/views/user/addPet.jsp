<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
<div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">반려동물 관리</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="container">
	                    <form action="insertPet" id="form" method="post" enctype="multipart/form-data" onsubmit="return checkForm()" target='blankifr'>
	                    <div class="row d-flex flex-column align-items-center" id="pet_info">
	                    	<!-- 반려동물이 들어갈 영역 -->
	                    	<div class="container ms-4">
		                        <div id="pet_img" style="float: left; margin-right:30px; text-align: center" class="col-3">
									<img class="img-wrapper" src="<%=contextPath%>/resources/upload/profile.png" alt="profile img" id="img">
									<label for="file-input" class="upload-btn">반려동물 사진 변경</label>
									<a href="#" class="btn btn-custom" id="file-delete" onclick="deleteImage()">반려동물 사진 삭제</a>
									<input type="file" id="file-input" name="file" onclick="editImg()" style="display: none">
								</div>
		                        <div style="float: left;" class="col-8">
		                            <ul class="list-group list-group-flush">
		                            	<li class="list-group-item">
										    <span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 이름</span> 
								    		<input type="text" id="petName" name="pet_name">
										</li>
		                                <li class="list-group-item">
										    <span class="info-label">반려동물 출생일</span> 
								    		<input type="date" id="petBirth" name="pet_birth">
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
						    	<button class="btn btn-custom" type="submit" style="float: right; margin-right:35px">반려동물 등록</button>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">
 $(function(){
    $('#petBirth').datepicker();
  })
  
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
	}
	
	// 이미지 삭제
	function deleteImage() {
		$("#img").attr("src", "<%=contextPath%>/resources/upload/profile.png");
	}
  
  // 반려동물 등록
  function checkForm(){
	 var petName = $('#petName').val();
	 var petBirth = $('#petBirth').val();
	 var petKind = $('#petKind').val();
	 var petWeight = $('#petWeight').val();
	 if (petName == "" || petBirth == "" || petKind == "" || petWeight == "") {
		 alert("반려동물 등록 실패! 반려동물 정보를 다시 입력해주세요.");
		 return false;
	 }
	 alert("반려동물 등록 완료!");
	 location.replace("<%=contextPath%>/user/myPet");
	 return true;
	}
	 
	 
  
</script>
</body>
</html>
