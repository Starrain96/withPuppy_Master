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
  // 댓글 목록의 li 엘리먼트를 클릭할 때마다, 데이터를 보이거나 가리는 토글 효과 적용
  $(".reply-list li").click(function(event) {
    const clickedLi = event.target;
    // li 요소를 찾는 부분은 클릭된 엘리먼트가 li 안에 있는 하위 엘리먼트일 경우를 생각해 특정 조건을 추가하는 것이 더 안전합니다
    while (clickedLi.tagName.toLowerCase() !== "li") {
      clickedLi = clickedLi.parentElement;
    }
    $(clickedLi).find(".edit-field").toggleClass("hidden");
  });

  $("#b1").click(function() {
    content = $('#reply').val()
    writer = "yang"
    $.ajax({
      url:"insert2",
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
    });
  });
});
</script>

</head>
<body>
	<div class="container">
		<nav>
			<a href="../communitiesMain.jsp">처음페이지로</a> <a href="list2">이전페이지</a>
		</nav>
		<hr>
		<section class="article">
			<p>${vo.commu_no},${vo.commu_title},${vo.commu_content},
				${vo.commu_id}</p>
		</section>
		<hr>
		<section class="reply-form">
			<input id="reply" placeholder="댓글을 입력하세요">
			<button id="b1">댓글달기</button>
			<button id="b2">댓글삭제</button>
		</section>
		<hr>
		<section class="reply-list">
			<h2>댓글 목록</h2>
			<ul id="result">
				<c:forEach items="${list}" var="vo">
					<li>
						<p>${vo.reply_content},${vo.reply_id}</p>
						<button class="edit-button" onclick="editReply(this)">수정</button>
						<div class="edit-field hidden">
							<textarea class="edit-content">${vo.reply_content}</textarea>
							<textarea class="edit-writer">${vo.reply_id}</textarea>
							<button class="save-button" onclick="saveReply(this)">저장</button>
							<button class="cancel-button" onclick="cancelEdit(this)">취소</button>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</div>
</body>
</html>
