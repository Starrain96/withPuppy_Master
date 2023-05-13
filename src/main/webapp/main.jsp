<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Latest compiled and minified CSS -->

	<div class="con1">
		<form action="/action_page.php">
			<div class="mb-3 mt-3">
				<label for="email" class="form-label">아이디:</label> 
				<input type="email" class="form-control" id="email"
					placeholder="Enter email" name="email">
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호:</label>
				 <input type="password" class="form-control" id="pwd"
					placeholder="Enter password" name="pswd">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>

</body>
</html>