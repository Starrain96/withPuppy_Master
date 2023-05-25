<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="askCSMenuHeader.jsp"%>
<%
    String userId = userVo.getUser_id(); //사용할 값 정의하는 부분
%>
<hr>
<div id="updateAskCompleteView">
	<h4>1:1문의 수정</h4>
	<hr>
	1:1문의 게시글 수정 완료
	<hr>
	<button type="button" onclick="location='selectAskList?Ask_writer=<%= userId %>'">1:1문의
		게시판 돌아가기</button>
</div>

</body>
</html>