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
//세션에서 값을 꺼내는 방법 
String user_id = (String) session.getAttribute("user_id");
System.out.println("user_id : " + user_id);
/* userVO bag = (userVO)session.getAttribute("bag");
System.out.println("bag : " + bag); */
String contextPath = (String) request.getContextPath();
%>
<div class="col text-center container">
	<div class="row">
		<button style="width:30px; height:30px; float:left">뒤</button>
	</div>
	<div class="row d-flex flex-column align-items-center">
		<div class="img-wrapper">
			<img src="<%=contextPath%>/resources/img/profile.png" alt="profile img" id="img">
		</div>
		<label for="file-input" class="upload-btn">프로필 사진 변경</label>
		<a href="#" class="btn btn-custom" id="file-delete" onclick="deleteImage()">프로필 사진 삭제</a>
		<input type="file" id="file-input" name="file-input" onclick="editImg()" style="display: none">
	</div>
</div>
<div class="col-md-8">
    <h3>개인정보 수정</h3>
	<ul class="list-group list-group-flush">
		<li class="list-group-item"><span class="info-label">이름</span>
			<span class="info-value">${bag.user_name}</span>
		</li>
		<li class="list-group-item"><span class="info-label">전화번호</span>
			<input type="text" id="tel1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3">
			<span class="hypen">-</span>
			<input type="text" id="tel2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
			<span class="hypen">-</span>
			<input type="text" id="tel3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
			<input type="hidden" id="telDoubleChk">
		</li>
		<li class="list-group-item"><span class="info-label">아이디</span>
			<span class="info-value">${bag.user_id}</span></li>
		<li class="list-group-item"><span class="info-label">닉네임</span><p></p>
			<input type="text" id="nickname" maxlength="10"> 
			<input id="nickname_check" type="button" onclick="nicknameCheck()" value="중복확인">
			<p>
				<span id="successNicknameChk" style="font-size: 15px;">※닉네임은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span>
			</p> <input type="hidden" id="nicknameDoubleChk" />
		</li>
		<li class="list-group-item"><span class="info-label">이메일</span>
			<span class="info-value">${bag.user_email}</span>
		</li>
		<li class="list-group-item"><span class="info-label">주소</span><p></p>
			<input type="text" id="addr1" placeholder="${bag.user_addr1}"><p></p>
			<input type="text" id="addr2" placeholder="${bag.user_addr2}" style="width: 500px;"><p></p>
			<input type="text" id="addr3" placeholder="${bag.user_addr3}" style="width: 300px;">
			<input type="text" id="addr4" style="width: 300px;">
			<input type="hidden" id="addrDoubleChk">
		</li>
	</ul>
	<div class="mt-3">
		<a href="#" class="btn btn-custom" onclick="editUser()">수정하기</a>
	</div>
	<hr>
	<h3>비밀번호 수정</h3>
	<ul class="list-group list-group-flush">
		<li class="list-group-item"><span class="info-label">현재 비밀번호</span>
			<input type="password" id="cur_pw" maxlength="20">
	        <p><span id="successPwChk1" style="font-size: 15px;">※현재 비밀번호를 입력해주세요</span></p>
	        <input type="hidden" id="pwDoubleChk1"/>
		</li>
		<li class="list-group-item"><span class="info-label">새 비밀번호</span>
			<input type="password" id="new_pw" maxlength="20">
	        <p><span id="successPwChk2" style="font-size: 15px;">※비밀번호는 문자, 숫자, 특수문자(!@#$%^&*)의 조합 8 ~ 20자리로 입력이 가능합니다.</span></p>
	        <input type="hidden" id="pwDoubleChk2"/>
	    </li>
		<li class="list-group-item"><span class="info-label">새 비밀번호 확인</span>
			<input type="password" id="new_pw2" maxlength="20">
		    <p><span id="successPwChk3"></span></p>
			<input type="hidden" id="pwDoubleChk3"/>
		</li>
	</ul>
	<div class="mt-3">
		<a href="#" class="btn btn-custom" onclick="editPw()">수정하기</a>
	</div>
</div>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	var tel = `${bag.user_tel}`;
	var tel1 = tel.slice(0, 3); // 첫 번째 번호
	var tel2 = tel.slice(3, 7); // 두 번째 번호
	var tel3 = tel.slice(7, 11); // 세 번째 번호
	$('#tel1').val(tel1);
	$('#tel2').val(tel2);
	$('#tel3').val(tel3);
	$('#nickname').val("${bag.user_nickname}");
	$('#addr1').val("${bag.user_addr1}");
	$('#addr2').val("${bag.user_addr2}");
	$('#addr3').val("${bag.user_addr3}");
	$('#addr4').val("${bag.user_addr4}");
	$('#nicknameDoubleChk').val(true);
})
	
	
	/* $("#edit").click(function() {
    	var nickname = $('#nickname').val();
    	var addr1 = $('#addr1').val();
    	var addr2 = $('#addr2').val();
    	var addr3 = $('#addr3').val();
    	var addr4 = $('#addr4').val();
    	var addr5 = $('#addr1').val() + "/" + $('#addr2').val() + "/" + $('#addr3').val() + "/" + $('#addr4').val();
        	
        	
	}); // edit */
	
	// 닉네임 체크
	function nicknameCheck() {
		var nickname = $('#nickname').val();
    	console.log(nickname);
        if (nickname != '' && nickname.length >= 2) { 
            $.ajax({
                type: 'POST',
                url: "<%=contextPath%>"+'/user/nicknameCheck',
                data: {nickname:nickname},
                success: function(result) {
                    if (result == '0') {
                        $('#successNicknameChk').text('사용 가능한  닉네임입니다.');
                        $('#successNicknameChk').css("color", "green");
                        $('#nicknameDoubleChk').val(true);
                    } else {
                        $('#successNicknameChk').text('이미 사용중인 닉네임입니다.');
                        $('#successNicknameChk').css("color", "red");
                        $('#nicknameDoubleChk').val(false);
                    }
                },
                error: function() {
                    console.log("실패!");
                } 	
            });
        } else if (nickname != '' && nickname.length < 2) { // 닉네임 글자수가 2보다 작은 경우
    		$('#successNicknameChk').text('닉네임은 2자 이상 입력 가능합니다.');
    		$('#successNicknameChk').css("color", "red");
    		$('#nicknameDoubleChk').val(false);
    	} else { // 닉네임 입력하지 않은 경우
        	$('#successNicknameChk').text('닉네임을 입력해주세요.');
        	$('#successNicknameChk').css("color", "red");
        	$('#nicknameDoubleChk').val(false);
            $('#nickname').focus();
        }
    } // nicknameCheck
	
	// 우편번호 찾기
	function addrFind() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr4").value = extraAddr;
                
                } else {
                    document.getElementById("addr4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
                $('#addrDoubleChk').val(true);
            }
        }).open();
    } // addrFind
    
    function editUser() {
    	var form = new FormData();
        form.append( "file-input", $("#file-input")[0].files[0] );
    	var tel = $('#tel1').val() + $('#tel2').val() + $('#tel3').val();
    	var nickname = $('#nickname').val();
    	var addr1 = $('#addr1').val();
    	var addr2 = $('#addr2').val();
    	var addr3 = $('#addr3').val();
    	var addr4 = $('#addr4').val();
    	var addr5 = $('#addr1').val() + "/" + $('#addr2').val() + "/" + $('#addr3').val() + "/" + $('#addr4').val();
    	form.append("user_tel", tel);
    	form.append("user_nickname", nickname);
    	form.append("user_addr1", addr1);
    	form.append("user_addr2", addr2);
    	form.append("user_addr3", addr3);
    	form.append("user_addr4", addr4);
    	form.append("user_addr5", addr5);
    	
    		$.ajax({
                type: 'POST',
                url: "<%=contextPath%>"+'/user/updateUser',
                data: { user_img : formData,
                		user_tel : tel,
                		user_nickname : nickname,
                		user_addr1 : addr1,
                		user_addr2 : addr2,
                		user_addr3 : addr3,
                		user_addr4 : addr4,
                		user_addr5 : addr5
                },
                enctype : 'multipart/form-data',
                contentType: false,
                processData: false,
                success: function(result) {
                	 if (result === 1){
                		alert("수정 완료!");
                    	window.location.replace("myPage.jsp")
                	}
                    
                },
                error: function() {
                	alert("수정 실패!");
                } 	
            });
    }
    
    // 현재 비밀번호 입력
    $('#cur_pw').change(function (event) {
    	event.preventDefault();
    	var pw = $('#cur_pw').val();
    	$.ajax({
	        url: "<%=contextPath%>"+'/pwCheck',
	        type: 'POST',
	        data: { pw: $('#pw').val() },
	        success: function (result) {
	            if (result === 1) { 
	            	$('#successPwChk1').text('비밀번호가 일치합니다.');
	            	$('#successPwChk1').css("color", "green");
	                $('#pwDoubleChk1').val(true);
	                        
	            } else { 
	            	$('#successPwChk1').text('비밀번호가 일치하지 않습니다.');
	            	$('#successPwChk1').css("color", "red");
	                $('#pwDoubleChk1').val(false);
	            }
	        },
	        error: function () { 
	            console.log('현재 비밀번호 불일치')
	        }
	    }); // ajax
    }); // cur_pw
    
    // 새 비밀번호 입력
    $('#new_pw').change(function (event) {
    	event.preventDefault();
    	var pw = $('#new_pw').val();
    	var passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
    	if (pw.length < 8) { // 비밀번호 유효성 불만족
        	$('#successPwChk2').text('비밀번호는 8 ~ 20자로 입력하셔야합니다.');
        	$('#successPwChk2').css("color", "red");
            $('#pwDoubleChk2').val(false);
                    
        } else if (passwordRule.test(pw) && pw.length >= 8) { // 비밀번호 유효성 만족
        	$.ajax({
                url: "<%=contextPath%>"+'/pwCheck',
                type: 'POST',
                data: { pw: pw },
                success: function (result) {
                    if (result === 1) { // 비밀번호 일치
                        $('#successPwChk2').text('현재 사용 중인 비밀번호입니다. 다시 입력해주세요.');
                        $('#successPwChk2').css("color", "red");
                        $('#pwDoubleChk2').val(false);
                    } else { // 비밀번호 불일치
                        $('#successPwChk2').text('사용 가능한 비밀번호입니다.');
                        $('#successPwChk2').css("color", "green");
                        $('#pwDoubleChk2').val(true);
                    }
                },
                error: function () {
                    console.log('비밀번호 일치여부 검사에 실패하였습니다.');
                }
            });
                    
        } else { // 비밀번호 유효성 불만족
        	$('#successPwChk2').text('비밀번호를 정확히 입력해주세요.');
        	$('#successPwChk2').css("color", "red");
        	$('#pwDoubleChk2').val(false);
            $('#new_pw').focus();
        }
    }); // new_pw

 	// 새 비밀번호 입력2
    $('#new_pw2').change(function (event) {
        event.preventDefault();
        var pw = $('#new_pw').val();
        var pw2 = $('#new_pw2').val();
        if (pw == pw2) { // 비밀번호 확인 만족
            $('#successPwChk3').html('비밀번호가 일치합니다.');
            $('#successPwChk3').css("color", "green");
            $('#pwDoubleChk3').val(true);
                    
        } else if (pw != pw2) { // 비밀번호 확인 불만족
            $('#successPwChk3').text('비밀번호가 일치하지 않습니다.');
            $('#successPwChk3').css("color", "red");
            $('#pwDoubleChk3').val(false);
            $('#pw2').focus();
        }
    }); // new_pw2
    
    // 비밀번호 수정
    function editPw() {
        if ($('#pwDoubleChk1').val() == 'true' && $('#pwDoubleChk2').val() == 'true' && $('#pwDoubleChk3').val() == 'true') {
        	$.ajax({
                url: "<%=contextPath%>"+'/updatePw',
                type: 'POST',
                data: { pw: $('#new_pw').val() },
                success: function(result) {
                	if (result === 1){
                		alert("비밀번호 수정 완료!");
                    	window.location.replace("myPage.jsp")
                	}
                },
                error: function() {
                	alert("비밀번호 수정 실패!");
                } 	
            });
        }
    } // editPw
    
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
    
    function deleteImage() {
    	var img = document.getElementById("img");
    	img.src = "<%=contextPath%>/resources/img/profile.png";
    }
    
    function editImg() {
        console.log('이미지선택');
    } // editPw
    
</script>
</body>
</html>