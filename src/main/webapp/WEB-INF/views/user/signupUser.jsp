<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- header --%>
    <%@ include file="/header.jsp"%>
    <%-- header END --%>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
 <title>🐶강아지와 로그인🐶</title>
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
		body {
		margin-right: 5%;
		margin-left: 5%;
	}

	.text {
		background-color: aliceblue;
		border: 1px solid black;
		border-radius: 5px;
		height: 30px;
		width: 300px;
	}

	div.create {
		width: 800px;
		text-align: center;
		padding: 30px;
		margin: auto;
	}

	table {
		height: 300px;
		width: 1000px;
		border-top: 3px solid #ffe98c;
		margin-right: auto;
		margin-left: auto;
	}

	table tr {
		border-bottom: 1px solid #E1E1E1;
	}

	.col1 {
		padding: 30px;
		text-align: left;
		font-weight: bold;
		font-size: 1em;
	}

	.col2 {
		text-align: left;
		padding: 10px;
		padding-right: 10px;
	}

	#id_check,
	#nickname_check,
	#addr_find,
	#email_check {
		height: 29px;
		width: 80px;
		color: white;
		background-color: #60626C;
		border: none;
		border-radius: 5px;
	}

	#email_check, #addr_find {
		margin-top: 10px;
		height: 29px;
		width: 120px;
	}

	.cancle,
	.go {
		height: 40px;
		width: 180px;
		color: white;
		background-color: #60626C;
		border: none;
		border-radius: 5px;
		font-size: 1.2em;
	}

	.cancle:hover,
	.go:hover {
		background-color: #ffe98c;
		color: black;
		border: 2px solid #ffe98c;
	}

	span {
		font-size: 0.7em;
	}

	h1 {
		margin: 50px;
	}
</style>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%
    	String contextPath = (String) request.getContextPath();
    %>
    <script type="text/javascript">
    
    $(function() {
    $('#id_check').click(function (event) {
    	event.preventDefault();
    	var id = $('#id').val();
        if (id != '' && id.length >= 8) { // 아이디 글자수가 8보다 큰 경우
            // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
            $.ajax({
                type: 'POST',
                url: "<%=contextPath%>"+'/user/idCheck',
                data: {id:id},
                success: function(result) {
                    if (result == '0') {
                        $('#successIdChk').text('사용 가능한 아이디입니다.');
                        $('#successIdChk').css("color", "green");
                        $('#idDoubleChk').val(true);
                    } else {
                        $('#successIdChk').text('이미 사용중인 아이디입니다.');
                        $('#successIdChk').css("color", "red");
                        $('#idDoubleChk').val(false);
                    }
                },
                error: function() {
                    console.log("실패!");
                } 	
            });
        } else if (id != '' && id.length < 8) { // 아이디 글자수가 8보다 작은 경우
    		$('#successIdChk').text('아이디는 8자 이상 입력 가능합니다.');
    		$('#successIdChk').css("color", "red");
    		$('#idDoubleChk').val(false);
    	} else { // 아이디를 입력하지 않은 경우
        	$('#successIdChk').text('아이디를 입력해주세요.');
        	$('#successIdChk').css("color", "red");
        	$('#idDoubleChk').val(false);
            $('#id').focus();
        }
    	}); // id_check
    	
    	$('#pw').change(function (event) {
        	event.preventDefault();
        	var pw = $('#pw').val();
        	var passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
        	if (pw.length < 8) { // 비밀번호 유효성 불만족
            	$('#successPwChk').text('비밀번호는 8 ~ 20자로 입력하셔야합니다.');
            	$('#successPwChk').css("color", "red");
                $('#pwDoubleChk').val(false);
                        
            } else if (passwordRule.test(pw) && pw.length >= 8) { // 비밀번호 유효성 만족
            	$('#successPwChk').text('사용 가능한 비밀번호입니다.');
            	$('#successPwChk').css("color", "green");
                $('#pwDoubleChk').val(true);
                        
            } else { // 비밀번호 유효성 불만족
            	$('#successPwChk').text('비밀번호를 정확히 입력해주세요.');
            	$('#successPwChk').css("color", "red");
            	$('#pwDoubleChk').val(false);
                $('#pw').focus();
            }
        }); // pw
    
        $('#pw2').change(function (event) {
        	event.preventDefault();
        	var pw = $('#pw').val();
        	var pw2 = $('#pw2').val();
        	if (pw == pw2) { // 비밀번호 확인 만족
            	$('#successPwChk2').html('비밀번호 일치');
            	$('#successPwChk2').css("color", "green");
                $('#pwDoubleChk2').val(true);
                        
            } else if (pw != pw2) { // 비밀번호 확인 불만족
            	$('#successPwChk2').text('비밀번호 불일치');
            	$('#successPwChk2').css("color", "red");
            	$('#pwDoubleChk2').val(false);
                $('#pw').focus();
            }
        }); // pw2
        
        $('#name').change(function (event) {
        	event.preventDefault();
        	var name = $('#name').val();
        	if (name != '') { // 공백이 아니면
                $('#nameDoubleChk').val(true);
                        
            } else { // 공백이면
            	$('#successNameChk').text('이름을 입력해주세요');
            	$('#successNameChk').css("color", "red");
            	$('#nameDoubleChk').val(false);
                $('#name').focus();
            }
        }); // pw2
        
        $("select[name=mailslc]").change(function() {
        	var emailInput = $('#email');
            var selectedOption = $(this).val();

            if (selectedOption === 'self') {
                emailInput.val(''); // 이메일 입력란 비우기
            } else {
                emailInput.val($("select[name=mailslc] option:selected").text()); // 선택한 도메인으로 이메일 입력란 채우기
            }
        }); // mail
        
        $('#email_check').click(function() {
        	$('#emailDoubleChk').val(false);
        	var mailid = $('#mailid').val();
            var email = $('#email').val();
            var eamil = mailid + '@' + email; // 이메일 주소값 얻어오기!
    		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
    		var checkInput = $('#emailCheck'); // 인증번호 입력하는곳 
            var successEmailChk = $('#successEmailChk');

            if (mailid === '' || email === '') {
                successEmailChk.text('이메일을 정확히 입력해주세요.');
                successEmailChk.css('color', 'red');
                return;
            }
            
    		$.ajax({
    			type : 'POST',
    			url : "<%=contextPath%>"+'/user/emailCheck',
    			data: {email:eamil},
    			success : function (data) {
    				console.log("data : " +  data);
    				checkInput.attr('disabled',false);
    				code =data;
    				alert('인증번호가 전송되었습니다.')
    			}			
    		}); // end ajax
    	}); // end send eamil
    	
     	// 인증번호 비교 
    	// blur -> focus가 벗어나는 경우 발생
    	$('#emailCheck').blur(function () {
    		const inputCode = $(this).val();
    		const $resultMsg = $('#successEmailChk');
    		
    		if(inputCode === code){
    			$resultMsg.html('인증번호가 일치합니다.');
    			$resultMsg.css('color','green');
    			$('#email_check').attr('disabled',true);
    			$('#mailid').attr('readonly',true);
    			$('#email').attr('readonly',true);
    			$('#email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
    	        $('#email').attr('onChange', 'this.selectedIndex = this.initialSelect');
    	        $('#emailDoubleChk').val(true);
    		}else{
    			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
    			$resultMsg.css('color','red');
    			$('#emailDoubleChk').val(false);
    		}
    	}); // emailCheck
    	
    	$('#nickname_check').click(function (event) {
        	event.preventDefault();
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
        	}); // nickname_check
        
    }); // func
    
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
    
    function go() {
    	var id = $('#id').val();
    	var pw = $('#pw').val();
    	var name = $('#name').val();
        var email = $('#mailid').val() + '@' + $('#email').val(); // 이메일 주소값 얻어오기!
    	var tel = $('#tel1').val() + $('#tel2').val() + $('#tel3').val();
    	var nickname = $('#nickname').val();
    	var addr1 = $('#addr1').val();
    	var addr2 = $('#addr2').val();
    	var addr3 = $('#addr3').val();
    	var addr4 = $('#addr4').val();
    	var addr5 = $('#addr1').val() + "/" + $('#addr2').val() + "/" + $('#addr3').val() + "/" + $('#addr4').val();
    	var interest = $('input[name=service]:checked').val();

    	
    	if ($('#idDoubleChk').val(true) && $('#pwDoubleChk').val(true) && $('#pwDoubleChk2').val(true) &&
    			$('#nameDoubleChk').val(true) && $('#emailDoubleChk').val(true) && $('#addrDoubleChk').val(true)){
    		$.ajax({
                type: 'POST',
                url: "<%=contextPath%>"+'/user/goUser',
                data: { user_id : id,
                		user_pw : pw,
                		user_name : name,
                		user_email : email,
                		user_tel : tel,
                		user_nickname : nickname,
                		user_addr1 : addr1,
                		user_addr2 : addr2,
                		user_addr3 : addr3,
                		user_addr4 : addr4,
                		user_addr5 : addr5,
                		user_interest : interest
                },
                success: function(result) {
                	if (result == '1'){
                		alert("회원가입 완료!");
                    	window.location.replace("loginPage.jsp")
                	}
                    
                },
                error: function() {
                	alert("회원가입 실패! 회원 정보를 다시 입력해주세요.");
                } 	
            });
    	}
    }
    
    </script>
</head>
<center><h1>회원가입🐶</h1></center>
    <form method="post" action="">
    <div class="container">
    <div class="insert">
        <table>
	    <tr>
	        <td class="col1">아이디*</td>
	        <td class="col2">
	            <input type="text" id="id" minlength="8" maxlength="20">
	            <input id="id_check" type="button" value="중복확인">
	            <p><span id="successIdChk">※아이디는 8 ~ 20자리로 입력이 가능합니다.</span></p>
	            <input type="hidden" id="idDoubleChk"/>
	        </td>
	    </tr>
	    <tr>
	        <td class="col1">비밀번호*</td>
	        <td class="col2">
	            <input type="password" id="pw" maxlength="20">
	            <p><span id="successPwChk">※비밀번호는 문자, 숫자, 특수문자(!@#$%^&*)의 조합
	            8 ~ 20자리로 입력이 가능합니다.</span></p>
	            <input type="hidden" id="pwDoubleChk"/>
	        </td>
	    </tr>
	    <tr>
	        <td class="col1">비밀번호 확인*</td>
	        <td class="col2">
	        	<input type="password" id="pw2" maxlength="20">
		        <p><span id="successPwChk2"></span></p>
				<input type="hidden" id="pwDoubleChk2"/>
			</td>
	    </tr>
	    <tr>
	        <td class="col1">이름*</td>
	        <td class="col2"><input type="text" id="name" maxlength="16">
	        <p><span id="successNameChk"></span></p>
	        <input type="hidden" id="nameDoubleChk"/></td>
	    </tr>
	    <tr>
	        <td class="col1">이메일*</td>
	        <td class="col2">
	            <input type="text" id="mailid">
	            <span class="a">@</span>
	            <input type="text" id="email">
	            <select name="mailslc">
	                <option value="self" selected>직접입력</option>
	                <option value="naver">naver.com</option>
	                <option value="gm">gmail.com</option>
	                <option value="da">daum.com</option>
	            </select>
	            <input id="email_check" type="button" value="본인인증">
	            <input type="hidden" id="emailDoubleChk"/>
	            <p></p>
	            <input type="text" id="emailCheck" placeholder="인증번호 입력" disabled="disabled">
	            <p><span id="successEmailChk"></span></p>
	        </td>
	    </tr>
	    <tr>
	        <td class="col1">전화번호*</td>
	        <td class="col2">
	        <input type="text" id="tel1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3">
	        <span class="hypen">-</span>
	        <input type="text" id="tel2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
	        <span class="hypen">-</span>
	        <input type="text" id="tel3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
	        </td>
	    </tr>
	    <tr>
	        <td class="col1">닉네임*</td>
	        <td class="col2">
	        <input type="text" id="nickname" maxlength="10">
	        <input id="nickname_check" type="button" value="중복확인">
	        <p><span id="successNicknameChk">※닉네임은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span></p>
    		<input type="hidden" id="nicknameDoubleChk"/></td>
	    </tr>
	    <tr>
	        <td class="col1">주소*</td>
	        <td class="col2">
	        <input type="text" id="addr1" placeholder="우편번호">
	        <input id='addr_find' type="button" onclick="addrFind()" value="우편번호 찾기"><p></p>
	        <input type="text" id="addr2" placeholder="주소" style="width: 500px;"><p></p>
	        <input type="text" id="addr3" placeholder="상세주소" style="width: 300px;">
	        <input type="text" id="addr4" placeholder="참고항목" style="width: 300px;">
	        <input type="hidden" id="addrDoubleChk"/></td>
	    </tr>
	    <tr>
	        <td class="col1">선호 카테고리</td>
	        <td class="col2">
			<label>
			<input type="radio" name="service" value="community">커뮤니티</label>
			<span style="margin-right: 100px;"></span>
			<label>
			<input type="radio" name="service" value="shopping">쇼핑몰</label>
			<span style="margin-right: 100px;"></span>
			<label>
			<input type="radio" name="service" value="pet-service">반려동물 서비스</label>
			<span style="margin-right: 100px;"></span>
			<label>
			<input type="radio" name="service" value="pet-report">반려동물 신고</label></td>
	    </tr>
    </table>
  </div>
  <div class="create">
        <input class="cancle" type="button" value="가입취소" onclick="location.href='loginPage.jsp'">
        <input class="go" type="button" value="회원가입" onclick="go()">
  </div>
  </div>
  </form>
</body>
</html>