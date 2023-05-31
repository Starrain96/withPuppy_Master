<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/userManagement.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
    <div class="col">
        <!-- 메인 컨텐츠 -->
        <div class="card">
            <h5 class="card-header">회원 관리</h5>
            <div class="card-body">
            	<!-- search conditions area -->
                <div class="card-child container-fluid">
                	<div class="row">
	                	<div class="col-11">
	                		<div class="d-flex align-items-center mb-4">
	                			<div class="search-area-text">회원등급</div>
	                			<div class="dropdown">
							  		<button class="btn dropdown-toggle custom-dropdown-btn" type="button" id="grade" data-bs-toggle="dropdown" aria-expanded="false">
							    		전체
							  		</button>
							  		<ul class="dropdown-menu" id="grade-menu" aria-labelledby="grade">
							    		<li><a class="dropdown-item">전체</a></li>
							    		<li><a class="dropdown-item">집사</a></li>
							    		<li><a class="dropdown-item">프로집사</a></li>
							   		 	<li><a class="dropdown-item">훈련사</a></li>
							    		<li><a class="dropdown-item">인플루언서</a></li>
							   		 	<li><a class="dropdown-item">관리자</a></li>
							  		</ul>
								</div>
	                		</div>
	                		<div class="d-flex align-items-center">
	                			<div class="search-area-text">검색</div>
	                			<div class="dropdown">
							  		<button class="btn dropdown-toggle custom-dropdown-btn" type="button" id="condition" data-bs-toggle="dropdown" aria-expanded="false">
							    		전체
							  		</button>
							  		<ul class="dropdown-menu" id="condition-menu" aria-labelledby="condition">
							    		<li><a class="dropdown-item">전체</a></li>
							    		<li><a class="dropdown-item">이름</a></li>
							   		 	<li><a class="dropdown-item">아이디</a></li>
							  		</ul>
								</div>
								<input type="text" class="form-control" id="search-input" placeholder="검색어 입력">
	                		</div>
	                	</div>
	                	<div class="col-1 d-flex align-items-center">
	                		<button class="btn custom-btn">검 색</button>
	                	</div>
                	</div>
                </div>
                <!-- table area -->
                <div class="card-child" id="result">
                	<table class="table" style="width:100%">
                		<colgroup>
						    <col style="width: 50px;">
						    <col style="width: auto;">
						    <col style="width: auto;">
						    <col style="width: auto;">
						    <col style="width: auto;">
						    <col style="width: auto;">
						    <col style="width: 50px;">
						</colgroup>
						<thead style="background-color:#ffe98c">
							<tr>
								<th scope="col">번호</th>
							    <th scope="col">아이디</th>
							    <th scope="col">이름</th>
							    <th scope="col">이메일</th>
							    <th scope="col">등급</th>
							    <th scope="col">가입일</th>
							    <th scope="col">탈퇴</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="one">
							<tr style="height:42px;">
								<th scope="row">${one.user_no}</th>
							    <td>${one.user_id}</td>
							    <td>${one.user_name}</td>
							    <td>${one.user_email}</td>
							    <td>${one.user_level}</td>
							    <td>${one.user_joindate}</td>
							    <td style="vertical-align: middle;">
							    	<div style="display: flex; align-items: center; justify-content: center; height: 100%;">
							  			<input class="delete" type="checkbox" name="color">
							  		</div>
							  	</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
                </div>
				<div id="pagenationBtn">
				<%
					int pages = (int)request.getAttribute("pages");
					for(int p = 1; p <= pages; p++){
				%>
					<button class="pages"><%= p %></button>
				<%		
					}
				%>
					</div>
            </div>
            <div class="card-footer text-muted text-end">
                   	강아지와🐶
            </div>
        </div>
        </div>
    </div>
</div>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
$('#grade-menu a.dropdown-item').click(function() {
	var selectedItemText = $(this).text();
	$('#grade').text(selectedItemText);
});
$('#condition-menu a.dropdown-item').click(function() {
	var selectedItemText = $(this).text();
	$('#condition').text(selectedItemText);
});

$(function() {
	$('.pages').click(function() {
		$.ajax({
			url: "userList",
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
})
</script>

</body>
</html>