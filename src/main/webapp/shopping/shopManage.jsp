<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../shopManageHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/main.css" />
<style type="text/css">
body,
ul,
li {
    padding: 0;
    margin: 0;
    list-style: none;
}

a {
    color: inherit;
    text-decoration: none;
}

.left-side-bar > ul ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 100%;
    background-color: #ddd;
}

body {
    height: 10000px;
}

.left-side-bar {
    background-color: #ddd;
    height: 100%;
    width: 180px;
    position: fixed;
    left: -155px;
    transition: left .3s;
}

.left-side-bar > .status-ico {
    text-align: right;
    padding: 10px;
}

.left-side-bar > ul li {

    position: relative;
}

.left-side-bar ul {
    text-align: center;
    padding: 0;
}

.left-side-bar ul > li > a {
    display: block;
    padding: 10px;
    white-space: nowrap;
    font-weight : normal;
}

.left-side-bar > ul > li:first-child > a,
.left-side-bar > ul > li:last-child > a {
    font-weight: bold;
}

.left-side-bar:hover {
    left: 0;
}

.left-side-bar ul > li:hover ul {
	position : relative;
    display: block;
    left : 0;
}

.left-side-bar ul > li:hover > a {
    color: black;
    font-weight : bold;
    background-color: #ffe98c;
}

.left-side-bar > .status-ico > span:last-child {
    display: none;
}

.left-side-bar:hover > .status-ico > span:last-child {
    display: block;
}

.left-side-bar:hover > .status-ico > span:first-child {
    display: none;
}
</style>
</head>
<body>
	<div class="left-side-bar">
        <div class="status-ico">
            <span>▶</span>
            <span>▼</span>
        </div>

        <ul>
            <li>
                <a href="#">물품 관리</a>
                <ul>
                    <li><a href="#">상품 추가</a></li>
                    <li><a href="#">상품 삭제</a></li>
                    <li><a href="#">상품 정보 수정</a></li>
                </ul>
            </li>
            <li>
                <a href="#">상품 통계</a>
                <ul>
                    <li><a href="#">날짜별 통계</a></li>
                    <li><a href="#">물품별 통계</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>