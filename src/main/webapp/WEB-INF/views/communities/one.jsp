<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

h1 {
	font-size: 32px;
	color: #333;
	margin-bottom: 20px;
}

hr {
	border-color: #f9c13d;
	margin: 30px 0;
}

.container {
	max-width: 600px;
	margin: 0 auto;
}

.reply-form {
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.reply-form input {
	flex: 1;
	padding: 10px;
	border-radius: 5px;
	border: none;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
}

.reply-form button {
	margin-left: 10px;
	background-color: #f9c13d;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.reply-form button:hover {
	background-color: #ffc729;
}

.reply-list {
	margin-top: 30px;
}

.reply-list li {
	padding: 10px;
	margin-bottom: 10px;
	list-style: none;
	background-color: #f9f9f9;
	border-radius: 5px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
}

.reply-list li:before {
	content: "- ";
	font-weight: bold;
}

.reply-section {
  padding: 10px;
  margin-bottom: 10px;
  background-color: #f9f9f9;
  border-radius: 5px;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
}

.reply-info {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 5px;
}

.reply-id {
  font-weight: bold;
}

.reply-date {
  color: #777;
  font-size: 12px;
}

.reply-content {
  font-size: 14px;
  line-height: 1.5;
}

.edit-delete {
  background-color: #ff3d3d;
  margin-left: 10px;
  background-color: #f9c13d;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.edit-delete:hover {
  background-color: #ff5f5f;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
  $("#b1").click(function() {
    content = $('#reply').val()
    writer = "yang"
    $.ajax({
      url:"../reply/insert_reply",
      data:{
          commu_no:${vo.commu_no},
          reply_content:content,
          reply_id:writer
      },
      success: function(x) {
		$('#commu_de').click(function() {
			$('#result').empty()
			$.ajax({
				url : "delete",
				data : {
					commu_no : ${vo.commu_no}
				},
				success : function(x) {
					history.back();
					$('#result').append(x)
				} //success
			}) //ajax
		})//commu_de
      }//success
    })//ajax
  })//b1
  bringReplyList();
})//fun

function bringReplyList() {
	  $.ajax({
	    url: "../reply/list_reply",
	    data: {
	      commu_no: ${vo.commu_no}
	    },
	    success: function(x) {
	      $('#result').empty();
	      for (i = 0; i < x.length; i++) {
	        var reply = x[i];
	        var replySection =`<div class="reply-section" id="reply-section` + i + `">
	          <div class="reply-info">
	          <span class="reply-id">` + reply.reply_id + `</span>
	          <span class="reply-date">` + reply.reply_date + `</span>
	          </div>
	          <div class="reply-content" id="reply-content` + i + `">` + reply.reply_content + `</div>
	          <div id="reply-btn">
	          <button id ="btn-update" onclick="upBtn(` + i + `, `+reply.reply_no+`, '`+reply.reply_content+`')" class ="edit-delete">수정</button>
	          <button id="btn-delete" onclick="delBtn('+reply.reply_no+')" class="edit-delete">삭제</button></div>
	          </div>`;
	    // onclick 을 써서 paramater 을 넘겨주자.
	          
	    
	        $('#result').append(replySection);
	      }
	    }
	  })
	}
function upBtn (i, no, content) {
	     $('#reply-content'+ i +'').empty();
	     var reply_update = `<textarea id="reply-update"></textarea>`
	     $('#reply-content'+ i +'').append(reply_update);
	    document.getElementById("reply-update").value = content;
	    $('#reply-btn').empty();
	    var upOkBtn = `<button id ="btn-update" onclick="upOkBtn(`+no+`)" class ="edit-delete">수정</button>`
	    $('#reply-btn').append(upOkBtn);
	}
function upOkBtn (no) {
	    	console.log(no);
	    $.ajax({
	        url: "../reply/update_reply",
	        data: {
	          reply_no: no,
	          reply_content : $("#reply-update").val()
	        },
	        success: function(x) {
	        	document.location.reload();
	        }
	      })
	}

function delBtn(deletNum){
  			$('#result').empty();
			$.ajax({
				url : "../reply/delete_reply",
				data : {
					reply_no : deletNum
				},
				success : function(x) {
					alert("삭제처리가 완료 됐습니다!");
					document.location.reload();
					$('#result').append(x);
				} //success
			}) //ajax
  		}

</script>

</head>
<body>
	<div class="container">
		<nav>
			<a href="communitiesMain?page=1" class="edit-delete">처음페이지로</a> <a href="communitiesList?page=1" class= "edit-delete">이전페이지</a>
		</nav>
		<hr>
		<section class="article">
			<p>No : ${vo.commu_no}</p>
			<!-- 번호를 출력하는 부분 -->
			<p>Writer : ${vo.commu_id}</p>
			<!-- 작성자를 출력하는 부분 -->
			<p>Title : ${vo.commu_title}</p>
			<!-- 제목을 출력하는 부분 -->
			<p>Content : ${vo.commu_content}</p>
			<!-- 내용을 출력하는 부분 -->
			<p>
				Image : <img src="../resources/upload/${vo.commu_img}">
			</p>
			<!-- 내용을 출력하는 부분 -->
		</section>
		<a href="communitiesFnD?commu_no=${vo.commu_no} & page=1"><button class= "edit-delete">수정📝</button></a>
		<button id="commu_de" class= "edit-delete">삭제📝</button>
		<hr>
		<section class="reply-list">
			<div id="result">
			</div>
		</section>

		<section class="reply-form">
			<input id="reply" placeholder="댓글을 입력하세요">
			<button id="b1">댓글달기</button> 
		</section>
	</div>
</body>
</html>
