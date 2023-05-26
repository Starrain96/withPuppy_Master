//회원탈퇴 버튼
$("#delete").click(function(){
$("#card-body").html(`
	<div class="row">
		<div class="col-md-12">
	    <!-- <h5 class="card-title">John Doe</h5> 
	    <hr>-->
	    <ul class="list-group list-group-flush">
			<li class="list-group-item">
	        <span class="info-label">비밀번호</span> 
				<input type="password" id="pw" maxlength="20">
			</li>
	    </ul>
	    <div class="mt-3">
			<button id="delete2" class="btn btn-outline-danger" onclick="delete2()">탈퇴하기</button>
		</div>
	    </div>
	</div>`);
	}); // delete
	
	// 회원탈퇴 버튼2
	function delete2() {
        console.log("delete2");
        var pw = $('#pw').val();
        if (pw != '') {
			if (confirm("정말 탈퇴하시겠습니까? 확인을 선택하면 탈퇴되며 메인 페이지로 이동합니다.")) {
				$.ajax({
				    url: path + '/user/pwCheck',
				    type: 'POST',
				    data: { pw: $('#pw').val() },
				    success: function(result) {
				      if (result === 1) {
				        $.ajax({
				          url: path + '/user/deleteUser',
				          type: 'POST',
				          success: function(result) {
				        	  if (result == '1'){
				            	alert("회원탈퇴가 완료되었습니다.");
				           	 	location.href = "../main.jsp";
				        	  }else{
				        		alert("회원탈퇴가 완료되지 않았습니다."); 
				        	  }				        	 
				          }
				        }); // ajax
				      } else {
				    	  alert("비밀번호가 일치하지 않습니다.");
				      }
				    }
				  }); // ajax
			} 
        } else {
        	 alert("비밀번호를 입력해주세요.");
        	 return; 
        }
    }  // delete2