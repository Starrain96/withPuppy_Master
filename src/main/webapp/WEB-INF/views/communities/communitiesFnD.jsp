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

	a:link, a:visited {
		color: #3aa4c1;
		text-decoration: none;
	}

	a:hover, a:active {
		color: #1e80a3;
		text-decoration: underline;
	}

	.top{
		background-color: #f1f1f1;
		font-weight: bold;
	}

	.down{
		border-bottom: 1px solid #ddd;
	}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			$.ajax({
				url: "list",
				data : {
					page : $(this).text()
				},
				success: function(x) {
					$("#result").html(x)
				},
				error: function() {
					alert("nope")
				}
		})		
	})
		$.ajax({
			url: "read",
			data :{
				commu_no : ${commu_no}
			},
			success: function(x) {
				$("#no").val(x.commu_no);
				$("#title").val(x.commu_title);
				$("#content").val(x.commu_content);
				$("#img").val(x.commu_img);
			}
		})
		$('#b1').click(function() {
			$('#result').empty()
			$.ajax({
				url : "update",
				data : {
					commu_no : $("#no").val(),
					commu_title : $("#title").val(),
					commu_content : $("#content").val()
				},
				success : function(x) {
					alert("수정이 정상적으로 처리됐습니다!")
					document.location.reload() 
					$('#result').append(x)
				} //success
			}) //ajax
		})//b1
		$('#b2').click(function() {
			$('#result').empty()
			$.ajax({
				url : "delete",
				data : {
					commu_no : $("#delete").val()
				},
				success : function(x) {
					alert("삭제처리가 완료 됐습니다!")
					document.location.reload()
					$('#result').append(x)
				} //success
			}) //ajax
		})//b2
	})


</script>
</head>
<body>

<form>
	No :<input id="no" readonly><br>
	Title :<input id="title"><br>
	<textarea id="content" rows="10" cols="100"></textarea><br>
	Image :<input id="img"><br>
</form>
<button id="b1" type="button" class="btn btn-secondary">수정하기📝</button>
<a href="communitiesList?page=1">
<button type="button" class="btn btn-secondary">게시판목록📝</button>
</a>
<br>
<hr>
<h3>삭제할 게시물 번호를 입력해주세요</h3>
<input id="delete">
<button id="b2" type="button" class="btn btn-secondary">삭제하기📝</button>
<%
	int pages = (int)request.getAttribute("pages");
    for (int p = 1; p <= pages; p++) {
%>	
	
		<button class ="pages"><%= p %></button>
	
<%
	}
%>
<div id="result">
		<table>
		<tr>
			<td class="top">번호</td>
			<td class="top">제목</td>
			<td class="top">글쓴이</td>
			<td class="top">작성일</td>
			<td class="top">조회수</td>
		</tr>

		<c:forEach items="${list}" var="vo">

			<tr>
				<td class="down">${vo.commu_no}</td>
				<td class="down"><a href = "one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
				<td class="down">${vo.commu_date}</td>
				<td class="down">${vo.commu_id}</td>
				<td class="down">${vo.commu_view}</td>
			</tr>

		</c:forEach>
		</table>
</div>
</body>
</html>
