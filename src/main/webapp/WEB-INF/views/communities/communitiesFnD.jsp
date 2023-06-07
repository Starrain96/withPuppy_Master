<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	#no{
		background-color: #f5f5f5;
    	cursor: not-allowed;
	}

	.top{
		background-color: #f1f1f1;
		font-weight: bold;
	}

	.down{
		border-bottom: 1px solid #ddd;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "read",
			data :{
				commu_no : ${commu_no}
			},
			success: function(x) {
				$("#no").val(x.commu_no);
				$("#title").val(x.commu_title);
				$("#content").val(x.commu_content);
			}
		})
		$('#b1').click(function() {
			$('#result').empty()
			$.ajax({
				url : "update",
				data : {
					commu_no : $("#no").val(),
					commu_title : $("#title").val(),
					commu_content : $("#content").val(),
				},
				success : function(x) {
					alert("수정이 정상적으로 처리됐습니다!");
					history.back(); 
					$('#result').append(x);
				} //success
			}) //ajax
		})//b1
	})


</script>
</head>
<body>

<form>
	No :<input id="no" readonly><br>
	Title :<input id="title"><br>
	<textarea id="content" rows="10" cols="100"></textarea><br>
	Image :<input type="file" id="image" name="file" ><br>
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
