<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<style type="text/css">
	.nav-pills > .nav-item > .active {
		background-color: #FFE98C !important; /* 배경색 */
		color: black !important; /* 글자색을 회색으로 변경 */
	}
</style>
	<%
	UserVO user2Vo = (UserVO) session.getAttribute("bag");
	System.out.println("header bag : " + user2Vo);
	
	String user2Id = "";
	if(user2Vo!=null){ // user2Vo 가 null 값이 아면
	user2Id = user2Vo.getUser_id(); //user2id 가져오기
	}
%>
<div id="csMenuAsk">
	<h3>고객센터</h3>
	<hr>
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="selectFaqList"
			class="nav-link link-secondary">FAQ</a></li>
		<li class="nav-item"><a href="selectAskList?Ask_writer=<%=user2Id%>"
			class="nav-link active">1:1문의</a></li>
	</ul>
</div>