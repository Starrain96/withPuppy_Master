<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script src="../resources/js/statistics.js"></script> -->
<style type="text/css">

.title {
	font-weight : bold; 
}


.google_chart{
	margin-left : 10%;
	margin-right : 10%; 
}

.sBlock{
	width : 200px;
	height : 80px;
	border : 1px solid #ddd;
	display: inline-block;
	text-align : center;
	margin : 10px;
}

.row1 {
	margin-bottom : 30px;
	text-align : center;
} 

.title{
	margin-bottom : 20px;
}

.saleName{
	margin-top : 5px;
	margin-bottom : 12px;  
}

.saleValue{
	font-size : 20px; 
}

.sorting{
	display: flex;
	margin-left: 30px;
}

</style>

<script type="text/javascript">

function salesAll(){
	console.log("salesAll");
	$.ajax({
        url : "bringSalesAll",
        success : function(data) {
        	$('#saleAll').append(data[0]);
        	$('#saleDay').append(data[1]);
        	$('#saleMonth').append(data[2]);
        	$('#saleYear').append(data[3]);
        }
	})
}

google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

/* 구글차트 그리기 */
function drawBasic(data1, loc) {

	var dataTable = google.visualization.arrayToDataTable(data1);
	
	var options = {
	  title: '',
	  fontSize : 12,
	  hAxis: {
	    title: '',
	    format: 'h:mm a',
	    viewWindow: {
	      min: [7, 30, 0],
	      max: [17, 50, 0]
	    }
	  },
	  vAxis: {
	    title: '',
	  }
	};
	
	if(loc == 1){
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	    chart.draw(dataTable, options);	
	}else if(loc == 2){
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
	    chart.draw(dataTable, options);	
	}else if(loc == 3){
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
	    chart.draw(dataTable, options);	
	}
}

/* 페이지 시작과 동시에 로드해올 것 */
$(window).on('load',function () {
	cateBring();
	salesAll();
});

var arr = [];
var arr1 = [];
var arr2 = [];
/* 카테고리별 통계 */
function cateBring(){
	$.ajax({
        url : "bringStatistics",
        success : function(data) {
        	for(i=0; i<data.length; i++){
        		var a = {s_name : data[i].s_name, s_num : data[i].s_num};
        		arr.push(a);
        	}
        	var data1 = [['Element', '(단위: 만)', { role: 'style', color: '#FFE98C' }]];
        	for (var i = 0; i < arr.length; i++) {
        	  var category = arr[i].s_name;
        	  var value = arr[i].s_num;
        	  data1.push([category, value, '#FFE98C']);
        	}        	
        	drawBasic(data1, 1);
        }
	})
	
	//당일 카테고리별 그래프
	$.ajax({
        url : "todayStatistics",
        success : function(data) {
        	for(i=0; i<data.length; i++){
        		var a = {s_name : data[i].s_name, s_num : data[i].s_num};
        		arr1.push(a);
        	}
        	var data1 = [['Element', '(단위: 만)', { role: 'style', color: '#FFE98C' }]];
        	for (var i = 0; i < arr1.length; i++) {
        	  var category = arr1[i].s_name;
        	  var value = arr1[i].s_num;
        	  data1.push([category, value, '#FFE98C']);
        	}        	
        	drawBasic(data1, 2);
        }
	})
	
	monthlyData(1);	
}

function monthlyData(n){
	arr2 = [];
	//월별 매출 그래프
	$.ajax({
        url : "MonthlyStatistics",
        data : {num : n},
        success : function(data) {
        	for(i=0; i<data.length; i++){
        		var a = {s_name : data[i].s_name, s_num : data[i].s_num};
        		arr2.push(a);
        	}
        	var data1 = [['Element', '(단위: 만)', { role: 'style', color: '#FFE98C' }]];
        	for (var i = 0; i < arr2.length; i++) {
        	  var category = arr2[i].s_name;
        	  var value = arr2[i].s_num;
        	  data1.push([category, value, '#FFE98C']);
        	}        	
        	drawBasic(data1, 3);
        }
	})
}


function changePeriod(){
	var select  = document.getElementById("showNum");
	var selectVal = (select.options[select.selectedIndex].value);
	if(selectVal == 1){
		monthlyData(1);	
	}
	else if(selectVal == 2){
		monthlyData(2);	
	}
	else{
		monthlyData(3);	
	}
}

</script>

</head>

<body>

	<div></div>

	<div class= "title">매출 현황</div> 
	<div class = "row1">
		<div class = "sBlock">
			<div class="saleName">총 판매금액</div>
			<div id="saleAll" class="saleValue"></div>
		</div>
		<div class = "sBlock">
			<div class="saleName">오늘</div>
			<div id="saleDay" class="saleValue"></div>
		</div>
		<div class = "sBlock">
			<div class="saleName">이번달</div>
			<div id="saleMonth" class="saleValue"></div>
		</div>
		<div class = "sBlock">
			<div class="saleName">올해</div>
			<div id="saleYear" class="saleValue"></div>
		</div>
	</div>

	<div>
		<p class= "title">카테고리별 판매금액 - 총 매출</p>
	</div>
  	<div id="chart_div" class= "google_chart"></div>
  	
  	<div>
		<p class= "title">카테고리별 판매금액 - 오늘 매출</p>
	</div>
  	<div id="chart_div2" class= "google_chart"></div>
  	
  	<div>
		<p class= "title">월별 매출</p>
	</div>
	<div class="sorting">
			<form id="sort_id" action="#" class="sortDetail" onchange="changePeriod()">
				<select name="showNum" id="showNum">
					<option value="1">최근 1년</option>
					<option value="2">최근 6개월</option>
					<option value="3">최근 3개월</option>
				</select>
			</form>
		</div>
  	<div id="chart_div3" class= "google_chart"></div>


</body>
</html>