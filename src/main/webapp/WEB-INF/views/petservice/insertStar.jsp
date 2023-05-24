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
		if (("${bag.ocr}")==("")) {
			window.close();
		} else {
			$.ajax({
				url : "insertBill",	 // OCR API 호출
				data : {
					ocr : "${bag.ocr}"	// 입력된 OCR 이미지 이름
				},
				success : function() {
					alert("성공");
					window.close();
				}, //success
				error : function () {
				alert("실패");
				window.close();
				} //error
			})//ajax
		} // else
	}) // fun 
	</script>
</body>
</html>