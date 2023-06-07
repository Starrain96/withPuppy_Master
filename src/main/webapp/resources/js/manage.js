function deleteProduct(){
	var inputValue = document.getElementById('product_id').value;
	$.ajax({
        url : "deleteProduct",
        data : {product_id : inputValue},
        success : function(data) {
        	alert("삭제되었습니다.");
        	document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
			document.location.reload();
        }
	})
}

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
			let result1 = '<option value="Y">Y</option>'
			let result2 = '<option value="판매대기">판매대기</option>'
			console.log(i + ">>>>" + data[i].status)
			if(data[i].soldout_YN == 'Y'){
				result1 = '<option value="N">N</option>'
			}
			if(data[i].status == '판매대기'){
				result2 = '<option value="판매중">판매중</option>'
			}
				var sen =`<tr>
					<td>`+data[i].product_id+`</td>
					<td ondblclick="onClick1(`+data[i].product_id+`)">`+data[i].product_name+`</td>
					<td>`+data[i].categoryDetail+`</td>
					<td>`+data[i].product_cnt+`</td>
					<td>`+data[i].product_price+`</td>
					<td><select class="soldout_YN" id="save1" onchange="updateManage(`+data[i].product_id+`)"><option value=`+data[i].soldout_YN +`>`+data[i].soldout_YN+`</option>` + result1 + `</select></td>
					<td><select class="status" id="save2" onchange="updateManage(`+data[i].product_id+`)"><option value=`+data[i].status+` >`+data[i].status+`</option>` + result2 + `</select></td></tr>`
					
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
			$('input[name=product_name]').attr('value',"");
        	$('input[name=product_price]').attr('value',"");
        	$('input[name=category2]').attr('value',"");
        	$('input[name=product_cnt]').attr('value',"");
        	$('input[name=product_img]').attr('value',"");
		}
		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click', offClick);
	
		function offClick1() {
			document.querySelector('.modal_wrap1').style.display = 'none';
			document.querySelector('.black_bg1').style.display = 'none';
			$('input[name=product_name]').attr('value',"");
        	$('input[name=product_price]').attr('value',"");
        	$('input[name=category2]').attr('value',"");
        	$('input[name=product_cnt]').attr('value',"");
        	$('input[name=product_img]').attr('value',"");
		}
		document.querySelector('.modal_close1').addEventListener('click', offClick1);
	};


//상품 수정 업데이트
function editProduct(){
	$.ajax({
        url : "updateProduct",
        type : 'POST',
        data : $("#updateForm").serialize(),
        success : function(data) {
        	alert("수정되었습니다.");
        	document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
			document.location.reload();
        }
	})
}


//상품 수정 업데이트 판매상태, 품절
function updateManage(p_id){
	let select1 =  document.getElementById("save1");
	let select2 =  document.getElementById("save2");
	var selectVal1 = (select1.options[select1.selectedIndex].value);
	var selectVal2 = (select2.options[select2.selectedIndex].value);
	$.ajax({
        url : "updateManage",
        type : 'POST',
        data : {
        	product_id : p_id,
        	soldout_YN : selectVal1,
        	status : selectVal2
        },
        success : function(data) {
        	alert("수정되었습니다.");
        }
	})
}







//상품 수정시 상품 데이터 가져오기
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

$(function shoppingStart() {
	$("#firstBtn").trigger('click');
})

//이름 검색 기능
function searching(){
	var value = document.getElementById("searching").value;
	$.ajax({
		url : "productSearch",
		data : {
			name : value
		},
		success : function(data){
			$('#pagingList').empty();
			if(data.length == 0){
				$('#manageList').empty();
				var sen = "검색된 값이 없습니다.";
				$('#manageList').append(sen);
			}
			else{
				$('#manageList').empty();
				for (i = 0; i < data.length; i++) {
					let result1 = '<option value="Y">Y</option>'
					let result2 = '<option value="판매대기">판매대기</option>'
					console.log(i + ">>>>" + data[i].status)
					if(data[i].soldout_YN == 'Y'){
						result1 = '<option value="N">N</option>'
					}
					if(data[i].status == '판매대기'){
						result2 = '<option value="판매중">판매중</option>'
					}
					var sen =`<tr id = "editBtn">
						<td>`+data[i].product_id+`</td>
						<td  ondblclick="onClick1(`+data[i].product_id+`)">`+data[i].product_name+`</td>
						<td>`+data[i].categoryDetail+`</td>
						<td>`+data[i].product_cnt+`</td>
						<td>`+data[i].product_price+`</td>
						<td><select class="soldout_YN" id="save1" onchange="updateManage(`+data[i].product_id+`)"><option value=`+data[i].soldout_YN +`>`+data[i].soldout_YN+`</option>` + result1 + `</select></td>
						<td><select class="status" id="save2" onchange="updateManage(`+data[i].product_id+`)"><option value=`+data[i].status+` >`+data[i].status+`</option>` + result2 + `</select></td></tr>`
					$('#manageList').append(sen);
				}
			}
		}
	})
}
 