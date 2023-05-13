<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강아지 게시판</title>
    <style>
        body{
            background-color: #f3f3f3;
            color: #333;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .container{
            max-width: 800px;
            margin: auto;
        }
        .title{
            text-align: center;
            font-size: 28px;
            margin: 30px 0;
            color: #645cff;
        }
        .form-group{
            margin-bottom: 20px;
        }
        label{
            display: block;
            margin-bottom: 5px;
            font-size: 18px;
            font-weight: 600;
            color: #333;
            transition: color 0.3s;
        }
        label:hover{
            color: #645cff;
        }
        input[type="text"], select, textarea{
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 8px;
            transition: border-color 0.3s;
            font-size: 18px;
            color: #333;
            box-sizing: border-box;
        }
        input[type="text"]:focus, select:focus, textarea:focus{
            border-color: #645cff;
        }
        textarea{
            height: 200px;
        }
        button[type="submit"]{
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            background-color: #645cff;
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        button[type="submit"]:hover{
            background-color: #4f47c1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="title">강아지 게시판 글쓰기</h2>
        <form action="/insert" method="get">
            <div class="form-group">
                 <label for="category">카테고리</label>
                 <select id="category" name="category">
                    <option value="">선택하세요</option>
                    <option value="자유게시판">자유게시판</option>
                    <option value="수도권">수도권</option>
                    <option value="지방">지방</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" id="writer" name="writer" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required></textarea>
            </div>
            <button type="submit">글작성</button>
        </form>
    </div>
</body>
</html>
