<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$("#b1").click(function() {
				content = $('#reply').val()
				writer = "yang"
		$.ajax({
				url:"insert",
				data:{
					 commu_no:${vo.commu_no},
					 commu_content:content,
					 commu_id:writer
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
<a href="bbs.jsp">처음페이지로</a>
<a href="list2">게시물 전체 목록페이지</a>
<hr color="red">

게시물검색 처리 요청이 완료되었습니다.
<br>
${vo.commu_no}, ${vo.commu_title}, 
${vo.commu_content}, ${vo.commu_id}
<hr color="red">
댓글달기: <input id="reply"><button id = "b1">댓글달기</button><button id = "b2">댓글삭제</button><br>
<hr color="red">
<div id="result">
	<c:forEach items="${list}" var="vo"> 
	- ${vo.content}, ${vo.writer} <br>
	</c:forEach>
</div>
</body>
</html>