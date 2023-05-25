<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="faqCSMenuHeader.jsp"%>
<%@ include file="faqCategoryHeader.jsp"%>

<%
String userLevel ="";
if(userVo!=null){
userLevel = userVo.getUser_level();
}
%>

<div id="faqTitleSearch">
	<hr>
	<h4>검색</h4>
	<hr>
	<form action="selectFaqOne" method="get">
		제목 <input type="search" name="faq_title" size="60"
			placeholder="검색할 문의사항을 입력해주세요." onfocus="this.placeholder=''"
			onblur="this.placeholder='검색할 문의사항을 입력해주세요.'">
		<button type="submit">검색</button>
	</form>
</div>

<div id="faqListView">
	<hr>
	<h4>리스트</h4>
	<hr>
	<table class="table">
		<thead class="table-primary">
			<tr>
				<th style="width: 10px">no</th>
				<th style="width: 120px">category</th>
				<th>title</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.faq_no}</td>
					<td>${vo.faq_category}</td>
					<td><a href="#" onclick="return false;" class="hideView">${vo.faq_title}</a> 
					<%
					if(userLevel.equals("관리자")){%>
					<button type="button" onclick="location='updateFaqNo?faq_no=${vo.faq_no}'">수정</button>
					<button type="button" onclick="location='deleteFaq?faq_no=${vo.faq_no}'">삭제</button>
					<%}%>
					</td>
				</tr>
				<tr class="hiddenRow" style="display: none;">
					<td class="table-active" colspan="4">${vo.faq_content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%
	if(userLevel.equals("관리자")){%>
	<hr>
	<button type="button" onclick="location='writeFaq'">글쓰기</button>
	<%}%>
	
	
</div>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	//리스트 title 클릭시 content display 여부
	$(document).ready(function() {
		$(".hideView").click(function() {
			parent = $(this).closest('tr');
			hiddenRow = parent.next('.hiddenRow');
			status = hiddenRow.css('display');
			if (status === 'none') {
				hiddenRow.css('display', '');
			} else {
				hiddenRow.css('display', 'none');
			}
		});
	});
</script>

</body>
</html>