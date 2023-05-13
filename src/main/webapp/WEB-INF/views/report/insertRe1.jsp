<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>신고등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZEg56QT5Y6Y7XoA2zoSZIj"
      crossorigin="anonymous">
  </head>
  <body>

    <div class="container my-5">
      <h3 class="text-center">신고등록</h3>
      <hr>
      <form action="insertRe" method="get">
        <div class="form-group">
          <label for="title">제목</label>
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." value="실종신고">
        </div>
        <div class="form-group">
          <label for="animal">반려종</label>
          <input type="text" class="form-control" id="animal" name="animal" placeholder="반려종을 입력해주세요." value="pomeranian">
        </div>
        <div class="form-group">
          <label for="location1">실종 위치</label>
          <input type="text" class="form-control" id="location1" name="location1" placeholder="실종 위치를 입력해주세요." value="멀티캠퍼스">
        </div>
        <div class="form-group">
          <label for="content">내용</label>
          <textarea class="form-control" id="content" name="content" rows="10" placeholder="신고 내용을 입력해주세요.">123</textarea>
        </div>
        <div class="form-group">
          <label for="writer">작성자</label>
          <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력해주세요." value="park">
        </div>
		<br>
        <div class="row justify-content-end">
          <div class="col-1">
            <button type="submit" class="btn btn-primary w-100">등록</button>
          </div>
        </div>
      </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZEg56QT5Y6Y7XoA2zoSZIj"
      crossorigin="anonymous"></script>
  </body>
</html>