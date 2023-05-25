<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../shopManageHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
.google_chart{
	margin-left : 10%;
	margin-right : 10%;
}
</style>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../resources/js/statistics.js"></script>

<body>
	<div>
		<p>카테고리별 판매금액</p>
	</div>
  	<div id="chart_div" class= "google_chart"></div>
  	
  	<div id = "cateResult">
  	
  	
  	</div>
  	
</body>
</html>