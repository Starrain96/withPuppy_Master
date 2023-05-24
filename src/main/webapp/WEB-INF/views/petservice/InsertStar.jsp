<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
	$(function () {
		$.ajax({
			url : "insertBill",
			data : {
				ocr : "${bag.ocr}"
			},
			success : function() {
				alert("성공");
				window.close();
			}, //success
			error : function () {
			alert("실패");
			window.close();
			}
		})
	})
	</script>
</body>
</html>