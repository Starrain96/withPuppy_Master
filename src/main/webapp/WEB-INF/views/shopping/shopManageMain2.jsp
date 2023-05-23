<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../shopManageHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">
thead {
	background-color: #FFE98C;
	padding: 0.5rem;
	font-size: 16px;
	font-weight: bold;
}
table {
	margin: 0 auto;
	border-collapse: collapse;
}
table td, table th {
	padding: 0.75rem 1rem;
	text-align: center;
	border: 1px solid #D9D9D9;
}
tbody td:first-child,
thead td:first-child,
thead td:last-child,
tbody td:nth-child(3),
thead td:nth-child(3){
	text-align: left;
}
tbody tr:hover {
	background-color: #F5F5F5;
}
</style>
</head>

<script type="text/javascript">

$(function main() {
	$.ajax({
		url : "shopManageMain2",
		data : {
			start_num : 1,
			end_num : 12
		},
		success : function(data) {
			$('#manageList').empty();
			for (i = 0; i < data.length; i++) {
				var sen =`<tr>
					<td>`+data[i].product_id+`</td>
					<td>`+data[i].product_name+`</td>
					<td>`+data[i].category2+`</td>
					<td>`+data[i].product_cnt+`</td>
					<td>`+data[i].product_price+`</td>
					<td></td>
				</tr>`
				$('#manageList').append(sen);
			}
		}
	})
	
})


function page(n3,n4) {
	$.ajax({
		url : "shopManageMain",
		data : {
			start_num : n3,
			end_num : n4
		},
		success : function(data) {
			$('#productList').empty();
			for (i = 0; i < data.length; i++) {
				var sen =`<tr>
					<td>`+data[i].product_id+`</td>
					<td>`+data[i].product_id+`</td>
					<td>${bag.category2}</td>
					<td>${bag.product_cnt}</td>
					<td>${bag.product_price}</td>
					<td></td>
				</tr>`
				$('#productList').append(sen);
			}
		}
	})
	
}

</script>

<body>
	<table>
		<thead>
			<tr>
				<td>상품 번호</td>
				<td>상품명</td>
				<td>카테고리</td>
				<td>재고 수량</td>
				<td>가격</td>
				<td>품절</td>
			</tr>
		</thead>
		<tbody id = "manageList">
			<c:forEach items="${list}" var="bag">
				<tr>
					<td>${bag.product_id}</td>
					<td>${bag.product_name}</td>
					<td>${bag.category2}</td>
					<td>${bag.product_cnt}</td>
					<td>${bag.product_price}</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>