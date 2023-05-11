<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>리얼후기</title>
    <style>
      body {
        margin: 5%;
        padding: 5%;
      }
      h1 {
        font-size: 16px;
        font-weight: bold;
        margin: 10px;
        display: flex;
        align-items: center;
      }
      .review-button {
        margin-left: auto;
        padding: 5px 10px;
        border: none;
        background-color: #008CBA;
        color: white;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
      }
      .review-container {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        margin-top: 50px;
        padding: 0 10px;
      }
      .review-item {
        width: 20%;
        padding: 10px;
        border: 1px solid #ccc;
        margin: 0 5px;
        text-align: center;
      }
      .review-item h2 {
        font-size: 18px;
        font-weight: bold;
      }
      .review-title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-top: 30px;
      }
      .review-avg {
      text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-top: 30px;
      }
      .review-all {
      text-align: center;
        font-size: 14px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <div class="review-title">리얼후기</div>
    <h1>
      <button class="review-button">후기 작성하기</button>
    </h1>
    <div class="review-all">총점</div>
    <div class="review-avg">4.5점</div>
    <div class="review-container">
      <div class="review-item">
        <h2>친절</h2>
        <p>여기에 글을 작성해주세요.</p>
      </div>
      <div class="review-item">
        <h2>설명</h2>
        <p>여기에 글을 작성해주세요.</p>
      </div>
      <div class="review-item">
        <h2>진료</h2>
        <p>여기에 글을 작성해주세요.</p>
      </div>
      <div class="review-item">
        <h2>시설</h2>
        <p>여기에 글을 작성해주세요.</p>
      </div>
      <div class="review-item">
        <h2>가격</h2>
        <p>여기에 글을 작성해주세요.</p>
      </div>
    </div>
  </body>
</html>

