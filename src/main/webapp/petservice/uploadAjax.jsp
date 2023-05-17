<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#uploadBtn').on("click", function(e) {
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++) {
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : "POST",
			success : function(result) {
				alert("Uploaded")
			}
		})
		
	})//uploadBtn
})//document
</script>
</head>
<body>
<div class="uploadDIV">
<input type="file" name="uploadFile" multiple>
</div>
<button id="uploadBtn">Upload</button>

</body>
</html>