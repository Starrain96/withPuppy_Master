var productCnt=0;
var n1, n2;

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
					<td ondblclick="onClick1(`+data[i].product_id+`)">`+data[i].product_name+`</td>
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

//모달 팝업 
function onClick() { /* 상품추가하기 */
	document.querySelector('.modal_wrap').style.display = 'block';
	document.querySelector('.black_bg').style.display = 'block';
}
function onClick1(p_id) {/* 상품수정하기 */
	document.querySelector('.modal_wrap1').style.display = 'block';
	document.querySelector('.black_bg1').style.display = 'block';
	$('input[name=product_id]').attr('value',p_id);
	bringProductInfo(p_id);
	
}
	window.onload = function() {
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}
		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click', offClick);
	
		function offClick1() {
			document.querySelector('.modal_wrap1').style.display = 'none';
			document.querySelector('.black_bg1').style.display = 'none';
		}
		document.querySelector('.modal_close1').addEventListener('click', offClick1);
	};

function editProduct(){
	$.ajax({
        url : "updateProduct",
        type : 'POST',
        data : $("#updateForm").serialize(),
        success : function(data) {
        	alert("수정되었습니다.");
        }
	})
}

function bringProductInfo(p_id){
	$.ajax({
        url : "bringInfo",
        data : {product_id : p_id},
        success : function(data) {
        	$('input[name=product_name]').attr('value',data.product_name);
        	$('input[name=product_price]').attr('value',data.product_price);
        	$('input[name=category2]').attr('value',data.category2);
        	$('input[name=product_cnt]').attr('value',data.product_cnt);
        	$('input[name=product_img]').attr('value',data.product_img);
        }
	})
}

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
				var sen =`<tr id = "editBtn">
					<td>`+data[i].product_id+`</td>
					<td  ondblclick="onClick1(`+data[i].product_id+`)">`+data[i].product_name+`</td>
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
				var sen =`<tr id = "editBtn">
					<td>`+data[i].product_id+`</td>
					<td  ondblclick="onClick1(`+data[i].product_id+`)">`+data[i].product_name+`</td>
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
