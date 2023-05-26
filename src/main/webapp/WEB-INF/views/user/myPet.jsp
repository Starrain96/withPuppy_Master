<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>

        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">반려동물 관리</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="container">
	                    <div class="row">
	                    	<!-- 상단 우측 버튼을 위한 영역 -->
	                    	<div class="register-div">
						    	<a class="btn btn-custom" onClick="location.href='addPet'" style="float: right; margin-bottom:20px; margin-right:37px">반려동물 등록</a>
							</div>
	                    </div>
	                    <div class="row">
	                    	<!-- 반려동물을 등록하세요! 영역 -->
	                    	<div class="empty" style="text-align: center;" id="empty">
						    	<span style="font-size: 2.2em; font-weight: bold;">반려동물을 등록하세요!</span>
							</div>
	                    </div>
	                    <div class="row d-flex flex-column align-items-center" id="pet_info">
	                    	<!-- 반려동물이 들어갈 영역 -->
	                    	<%-- <div class="container ms-4">
		                        <div id="pet_img" style="float: left; margin-right:30px; margin-top:70px" class="col-3">
									<img class="img-wrapper" src="<%=contextPath%>/resources/img/profile.png" alt="profile img" id="img">
								</div>
		                        <div style="float: left;" class="col-8">
		                            <ul class="list-group list-group-flush">
		                            	<li class="list-group-item">
										    <span class="info-label">반려동물 이름</span> 
										    <span class="info-value">${mypet.pet_name}</span>
										</li>
		                                <li class="list-group-item">
										    <span class="info-label">반려동물 출생일</span> 
										    <span class="info-value">${mypet.pet_age}</span>
										  </li>
		                                <li class="list-group-item">
		                                	<span class="info-label">반려동물 종</span> 
										    <span class="info-value">${mypet.pet_kind}</span>
										</li>
		                                <li class="list-group-item">
		              						<span class="info-label">반려동물 몸무게</span> 
										    <span class="info-value">${mypet.pet_weight}</span>
										</li>
		                            </ul>
		                     	</div>
	                        </div> --%>
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
<script type="text/javascript">
$(function() {
	petlist();
})

function petlist() {
$.ajax({
    url : "../user/petList",
    success : function(data) {
    	if (data.length!= "0") {
    		var div = document.getElementById('empty');
			div.remove();
	    	$('#pet_info').empty();
	    	for (i = 0; i < data.length; i++) {
	    		if (!data[i].pet_img) { // 프로필 이지미지가 null이면
	    			data[i].pet_img = "profile.png";
	    		}
				var petInfo = 
					`<div class="container ms-4">
		                        <div id="pet_img" style="float: left; margin-right:30px; margin-top:70px" class="col-3">
									<img class="img-wrapper" src="<%=contextPath%>/resources/upload/`+data[i].pet_img+`" alt="profile img" id="img">
								</div>
		                        <div style="float: left;" class="col-8">
		                            <ul class="list-group list-group-flush">
		                            	<li class="list-group-item">
										    <span class="info-label">반려동물 이름</span> 
										    <span class="info-value">`+data[i].pet_name+`</span>
										</li>
		                                <li class="list-group-item">
										    <span class="info-label">반려동물 출생일</span> 
										    <span class="info-value">`+data[i].pet_birth+`</span>
										  </li>
		                                <li class="list-group-item">
		                                	<span class="info-label">반려동물 종</span> 
										    <span class="info-value">`+data[i].pet_kind+`</span>
										</li>
		                                <li class="list-group-item">
		              						<span class="info-label">반려동물 몸무게</span> 
										    <span class="info-value">`+data[i].pet_weight+`kg</span>
										</li>
		                            </ul>
		                            <div style="margin-bottom:20px">
					            		<button class="btn btn-custom" onClick="location.href='updatePetPage?pet_no=`+data[i].pet_no+`'">✏️</button>
					            		<button class="btn btn-custom" onclick="deletePet(`+data[i].pet_no+`)">❌</button>
				            		</div>
		                     	</div>
	                        </div>`;
				$('#pet_info').append(petInfo);
				if (i < data.length-1) {
					$('#pet_info').append(`<hr>`);
				}
			}
    	}
    	
    }
})
}

// 반려동물 등록
function addPet() {
	console.log("등록");
    $.ajax({
        url: "addPet",
        success: function(data) {
            $("#pet_info").html(data);
        }
    });
}

//반려동물 삭제
function deletePet(petno) {
	if (confirm("반려동물을 삭제하시겠습니까?")) {
		$.ajax({
	        url : "deletePet",
	        data : {
	            pet_no : petno
	        },
	        success : function(data) {
	        	alert("반려동물이 삭제되었습니다.");
	        	document.location.reload();
	        }
		})
    }
}
</script>
</body>
</html>