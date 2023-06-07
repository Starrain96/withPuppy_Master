<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<style type="text/css">

	table{
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		text-align: left;
		padding: 8px;
	}

	th {
		background-color: #ffe98c;
		color: black;
	}

	tr:nth-child(even){
		background-color: #f2f2f2;
	}

	tr:hover {
		background-color: #ddd;
	}

	.top{
		background-color: #ffe98c;
		font-weight: bold;
	}

	.down{
		border-bottom: 1px solid #ddd;
	}

	/* 전체 body의 스타일 */
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	/* 검색 폼의 스타일 */
	.search {
		display: flex;
		flex-direction: row;
		padding: 25px;
		align-items: center;
		justify-content: center;
		border-top: 1px solid #ccc;
		background-color: #fff;
	}
	/* 검색 폼 내부 요소의 스타일 */
	select,
	input[type="text"] {
		height: 40px;
		border: 2px solid #ccc;
		border-radius: 4px;
		padding: 5px;
		margin-right: 5px;
		font-size: 16px;
		background-color: #fdf5e6;
		outline: none;
	}

	select {
		background-color: #fdf5e6;
		background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg>');
		background-repeat: no-repeat;
		background-position: calc(100% - 8px) 10px;
		padding-right: 25px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}

	select:focus {
		border-color: #fba60b;
	}

	input[type="text"] {
		flex-grow: 1;
		background-color: #fdf5e6;
		outline: none;
	}

	input[type="text"]:focus {
		border-color: #fba60b;
	}

	/* 검색 버튼의 스타일 */
	.btn-search {
		background-color: #fba60b;
		border: 2px solid #fba60b;
		color: #fff;
		padding: 5px 20px;
		border-radius: 4px;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.2s;
		margin-right: 5px;
	}

	.btn-search:hover {
		background-color: #e7a00d;
		border-color: #e7a00d;
	}

	/* 글쓰기 버튼의 스타일 */
	.btn-write {
		background-color: #fba60b;
		border: 2px solid #fba60b;
		color: #fff;
		padding: 5px 20px;
		border-radius: 4px;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.2s;
		margin-right: 5px;
	}

	.btn-write:hover {
		background-color: #e7a00d;
		border-color: #e7a00d;
	}

	/* 컨테이너의 스타일 */
	.container {
		max-width: 800px;
		margin: 0 auto;
		padding-top: 50px;
		padding-bottom: 50px;
		background-color: #fff;
		border: 2px solid #ccc;
		box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2);
		text-align: center;
	}

	/* 타이틀의 스타일 */
	h1 {
		font-size: 36px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 25px;
		color: #fba60b;
	}

	/* 서브 타이틀의 스타일 */
	h2 {
		font-size: 24px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 25px;
		color: #333;
	}

	/* 게시물 제목의 스타일 */
	.post-title {
		font-size: 24px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 10px;
		color: #333;
	}

	/* 게시물 내용의 스타일 */
	.post-content {
		font-size: 16px;
		line-height: 1.5;
		margin-bottom: 15px;
	}

	/* 게시물 작성자의 스타일 */
	.post-writer {
		color: #333;
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 16px;
		font-weight: bold;
	}

	/* 게시물 날짜의 스타일 */
	.post-date {
		color: #333;
		position: absolute;
		bottom: 10px;
		left: 10px;
		font-size: 16px;
	}
	.pages {
	display: inline-block;
	margin: 5px;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
	cursor: pointer;
	background-color: white;
	color: #3aa4c1;
	font-size: 16px;
	font-weight: bold;
	transition: background-color 200ms linear, color 200ms linear;
}

.pages:hover {
	background-color: #3aa4c1;
	color: white;
}
</style>


		<table>
		<tr>
			<td class="top">번호</td>
			<td class="top">제목</td>
			<td class="top">작성일</td>
			<td class="top">글쓴이</td>
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