<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<head>
<title>강아지와🐶</title>
<style type="text/css">
.body {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color : #FFE98C;
	margin-left: 15%;
	margin-right: 15%;
}
.test{
	text-decoration: none;
	color: black;
}
.test:hover{
	text-decoration: underline;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"list2",
			success: function(x) {
				$('#result').append(x)
			}
		})
	})
</script>
</head>
<body>
	<div id = "result" class="container mt-3">
		<a href = "../communities/communitiesList" class = test>전체 게시물</a>			
	<div class="d-grid">
</div>
	</div>
	

</body>
</html>