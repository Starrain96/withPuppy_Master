var productCnt = 0;
var n1, n2;

$(function shoppingStart() {
	$("#firstBtn").trigger('click');
})

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
			$('#productList').empty();
			for (i = 0; i < data.length; i++) {
				var sen = 
					`<div class="container mt-4 col">
						<div class="card card__two" style="width: 80%; margin-left: 10%" onclick="location.href='productDetail?product_id=`
							+ data[i].detail + `'">
						<img class="card-img-top" src="`
							+ data[i].product_img +`"
							alt="Card image" style="width: 100%">
						<div class="card-body">
						<div class="card-title t1">`+ data[i].product_name +`</div>
						<div class="card-text t2">` + data[i].product_price + `원</div>
					</div>
					</div>
				</div>`;
				$('#productList').append(sen);
				}
			$('#pageBtn').empty();
			var btnCnt=0
			if(productCnt%12==0){
				btnCnt = productCnt/12-1;
			}else{
				btnCnt = productCnt/12;
			}
			for(i=0; i<btnCnt; i++){
				btn = `<button class = "pageBtn" onclick="bringList(`+ n1 +`,`+n2+`,`+ (i*12+1) +`,`+(i*12+12)+`,`+sortN+`)">`+(i+1)+`</button>`;
				$('#pageBtn').append(btn);
			}
		},
		error : function(){
			alert("에러");
		}
	})//ajax
}

//정렬select 변경시 호출되는 함수
function sorting(){
	var select  = document.getElementById("showNum");
	var selectVal = (select.options[select.selectedIndex].value);
	if(selectVal == 3){
		bringList(n1, n2, 1, 12, 3);
	}
	else if(selectVal == 2){
		bringList(n1, n2, 1, 12, 2);
	}
	else{
		bringList(n1, n2, 1, 12, 1);
	}
}
