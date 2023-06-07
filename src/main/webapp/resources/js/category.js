//카테고리 선택시 호출되는 함수 - 일반 사용자
function btnChange(n11, n22, n3, n4, item) {
	
	n1 = n11;
	n2 = n22;
	
	$('#menuName').empty();
	var cateName = $(item).text();
	console.log(cateName);
	$('#menuName').append(cateName);
	
	//카테고리별 갯수 가져와서 전역변수 저장 -> 페이징 버튼 용
	bringCnt(n1, n2);
	
	//카테고리별 list 불러오기
	bringList(n1, n2, n3, n4, 11);
}

//카테고리 선택시 호출되는 함수 - 관리자 
function btnChange1(n11, n22, n3, n4, item) {
	
	n1 = n11;
	n2 = n22;
	
	$('#menuName').empty();
	var cateName = $(item).text();
	console.log(cateName);
	$('#menuName').append(cateName);
	
	//카테고리별 갯수 가져와서 전역변수 저장 -> 페이징 버튼 용
	bringCnt(n1, n2);
	
	//카테고리별 list 불러오기
	console.log("n3 :" + n3);
	console.log("n4 :" + n4);
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