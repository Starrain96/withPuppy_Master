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

.edit-field {
	display: flex;
	flex-direction: column;
}

.edit-field.hidden {
	display: none;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
  $("#b1").click(function() {
    content = $('#reply').val()
    writer = "yang"
    $.ajax({
      url:"../reply/insert2",
      data:{
          commu_no:${vo.commu_no},
          reply_content:content,
          reply_id:writer
      },
      success: function(x) {
          alert("성공!")
          $('#result').append("- " + content +", "+ writer + "<br>")
          $('#reply').val('') // 작성 후 글자 사라지게 하는것
          // val() : 입력한 값을 가져온다.
          // val("안녕") : 안녕 이란 값을 input 에 value안으로 넣는다.
      }
    })
  })
	
})

</script>

</head>
<body>
	<div class="container">
		<nav>
			<a href="communitiesMain">처음페이지로</a> <a href="communitiesList?page=1">이전페이지</a>
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
		<a href="communitiesFnD?commu_no=${vo.commu_no} & page=1"><button>수정/삭제📝</button></a>
		<hr>
		<section class="reply-list" style="display: none;">
			<ul id="result">
				<c:forEach items="${list2}" var="vo2">
					<li>
						<p>${vo2.reply_id} : ${vo2.reply_content},  ${vo2.reply_date}</p>
						</li>
				</c:forEach>
			</ul>
		</section>

		<section class="reply-form">
			<input id="reply" placeholder="댓글을 입력하세요">
			<button id="b1">댓글달기</button>
			<button id="b2">댓글삭제</button>
		</section>
	</div>
</body>
</html>
