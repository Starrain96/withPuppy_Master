<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../resources/css/user.css">
</head>
<%
String contextPath = (String) request.getContextPath();
%>
<div class="col-md-4 text-center d-flex flex-column align-items-center justify-content-center">
						<div class="img-wrapper">
							<img src="<%=contextPath%>/resources/img/profile.png" alt="profile img" id="img">
						</div>
						<label for="file-input" class="upload-btn">반려동물 사진 변경</label>
						<a href="#" class="btn btn-custom" id="file-delete" onclick="deleteImage()">반려동물 사진 삭제</a>
						<input type="file" id="file-input" name="file-input" onclick="editImg()" style="display: none">
						</div>
                        <div class="col-md-8">
                            <!-- <h5 class="card-title">John Doe</h5> 
                            <hr>-->
                            
                            <ul class="list-group list-group-flush">
                            	<li class="list-group-item">
								    <span class="info-label" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/(\..*)\./g, '$1');">반려동물 이름</span> 
								    <input type="text" id="petName">
								</li>
                                <li class="list-group-item">
								    <span class="info-label">반려동물 출생일</span> 
								    <input type="date" id="petBirth">
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
                            <div class="mt-3" style="display: flex; justify-content: center; align-items: center;">
							    <a href="#" id="add" onclick="insertPet()"class="btn btn-custom">반려동물 등록</a>
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
  
  // 반려동물 등록
  function insertPet(){
	 var petName = $('#petName').val();
	 var petBirth = $('#petBirth').val();
	 var petKind = $('#petKind').val();
	 var petWeight = $('#petWeight').val();
	 $.ajax({
		 type: 'POST',
		 url: "<%=contextPath%>"+'/user/insertPet',
         data: { pet_name : petName,
        	 	pet_birth : petBirth,
        	 	pet_kind : petKind,
        	 	pet_weight : petWeight
         },
		 success: function(data) {
			 if (data == '1'){
         		alert("반려동물 등록 완료!");
             	window.location.replace("<%=contextPath%>"+'/user/myPet')
         	}
	     },
         error: function() {
         	alert("반려동물 등록 실패! 반려동물 정보를 다시 입력해주세요.");
         } 
	    });
	}
  
</script>
</body>
</html>