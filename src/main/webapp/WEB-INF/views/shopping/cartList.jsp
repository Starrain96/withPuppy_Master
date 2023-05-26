<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../shoppingHeader.jsp"%>
<%
	String user_id = userVo.getUser_id();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/cart.css">
<script src="../resources/js/cartList.js"></script> 
</head>
<script type="text/javascript">

var user_id1 = "<%=user_id%>";
</script>
<body>
	<div class="cart-wrapper">
		<ul class="cart-list" id="cart_list">
		</ul>
		<div class="cartTotal" id="cartTotal"></div>
	</div>
</body>
</html>