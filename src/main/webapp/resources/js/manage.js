function main_(n, cnt) {
	$.ajax({
		url : "shopManageMain2",
		data : {
			start_num : 10*n,
			end_num : 10*n+cnt-1
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
}

//처음 시작시 페이지네이션을 위해 전체 갯수 가져옴
/*
$(function start(){
	$.ajax({
		url : "productCnt",
		data : {
		},
		success : function(data) {
			$('#paging').empty();
			var sen1 = `<button onclick=""><</button>`
			$('#paging').append(sen1);
			for(i=0; i<data/10-1; i++){
				j=i+1;
				var sen = `<button onclick="main_(`+j+`,10)">`+j+`</button>`				
				$('#paging').append(sen);
			}
			var sen2 = `<button onclick="">></button>`
			$('#paging').append(sen2);
		}
	})
})
*/
$(function shoppingStart() {
	$("#firstBtn").trigger('click');
})

//이름 검색 기능
function searching(){
	var value = document.getElementById("searching").value;
	console.log("ajax : " + value);
	$.ajax({
		url : "productSearch",
		data : {
			name : value
		},
		success : function(data){
		$('#pagingList').empty();
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
}

//------------------------------------------------------------shoppingList랑 동일한 함수

var productCnt=0;
var n1, n2;

//카테고리 선택시 호출되는 함수
function btnChange(n11, n22, n3, n4, item) {
	
	n1 = n11;
	n2 = n22;
	
	$('#menuName').empty();
	var cateName = $(item).text();
	$('#menuName').append(cateName);
	
	//카테고리별 갯수 가져와서 전역변수 저장 -> 페이징 버튼 용
	bringCnt(n1, n2);
	
	//카테고리별 list 불러오기
	bringList(n1, n2, n3, n4, 1);
}

//상품 갯수 가져오는 함수 (카테고리 시작번호, 끝번호)
function bringCnt(n1, n2){
	$.ajax({
		url : "allCnt",
		data : {
			start : n1,
			end : n2
		},
		success : function(data){
			productCnt = data;
		}
	})
}

//쇼핑몰 list 가져오는 함수
function bringList(n1, n2, n3, n4, sortN){
	$.ajax({
		url : "shoppingList"+sortN,
		data : {
			start : n1,
			end : n2,
			start_num : n3,
			end_num : n4
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
			$('#pagingList').empty();
			var btnCnt=0
			if(productCnt%12==0){
				btnCnt = productCnt/12-1;
			}else{
				btnCnt = productCnt/12;
			}
			for(i=0; i<btnCnt; i++){
				btn = `<button class = "pageBtn" onclick="bringList(`+ n1 +`,`+n2+`,`+ (i*12+1) +`,`+(i*12+12)+`,`+sortN+`)">`+(i+1)+`</button>`;
				$('#pagingList').append(btn);
			}
		},
		error : function(){
			alert("에러");
		}
	})//ajax
}