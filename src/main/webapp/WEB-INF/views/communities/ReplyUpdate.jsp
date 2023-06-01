<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와🐶</title>
<style type="text/css">
	.body{
		background-color: #FFE98C
	}
		table{
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		text-align: left;
		padding: 8px;
	}

	th {
		background-color: #3aa4c1;
		color: white;
	}

	tr:nth-child(even){
		background-color: #f2f2f2;
	}

	tr:hover {
		background-color: #ddd;
	}

	a:link, a:visited {
		color: #3aa4c1;
		text-decoration: none;
	}

	a:hover, a:active {
		color: #1e80a3;
		text-decoration: underline;
	}

	.top{
		background-color: #f1f1f1;
		font-weight: bold;
	}

	.down{
		border-bottom: 1px solid #ddd;
	}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "Replyread",
			data :{
				reply_no : ${reply_no}
			},
			success: function(x) {
				$("#no").val(x.reply_no);
				$("#content").val(x.reply_content);
			}
		})
		$('#b1').click(function() {
			$('#result').empty()
			$.ajax({
				url : "update_reply",
				data : {
					reply_no : $("#no").val(),
					reply_content : $("#content").val()
				},
				success : function(x) {
					alert("수정이 정상적으로 처리됐습니다!")
					document.location.reload() 
					$('#result').append(x)
				} //success
			}) //ajax
		})//b1
	})


</script>
</head>
<body>

<form>
	No :<input id="no" readonly><br>
	<textarea id="content" rows="10" cols="100"></textarea><br>
</form>
<button id="b1" type="button" class="btn btn-secondary">수정하기📝</button>
<a href="communitiesList?page=1">
<button type="button" class="btn btn-secondary">게시판목록📝</button>
</a>
<br>
<hr>
<div id="result">
</div>
</body>
</html>
