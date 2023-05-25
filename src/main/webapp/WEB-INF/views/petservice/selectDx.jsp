<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>

<div id="searchFee">
	<h3>진료비 평균가 조회</h3>
	<hr>
	<form action="selectDx" method="get">
		<input type="search" name="bill_dx" size="60"
			placeholder="검색할 진료항목을 입력해주세요." onfocus="this.placeholder=''"
			onblur="this.placeholder='검색할 진료항목을 입력해주세요.'">
		<button type="submit">검색</button>
	</form>
</div>
<hr>
<div id="statFee">
	<h4>${vo.bill_dx} 평균가 비교</h4>
	<br>
	<!-- 진료비 비교할 지역 선택 및 현재 위치로 이동 -->
    <div style="display: flex;">
  		<select style="width: 150px; margin-right: 10px;" class="form-select" name="selSido" id="selSido"></select>
  		<select style="width: 150px; margin-right: 10px;" class="form-select" name="selGugun" id="selGugun"></select>
  		<button style="margin-right: 10px;" id="submit">선택 완료</button>
  		<button style="margin-right: 10px;" id="gps">현재 위치</button>
	</div>
	<br>
	<div id="statFeeDetail" class="row">
		<div id="sido2" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th colspan="2"><div id = "sidoName">시/도 평균가</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>최저가</td>
						<td><div id="minSido2"></div></td>
					</tr>
					<tr>
						<td>평균가</td>
						<td><div id="avgSido2"></div></td>
					</tr>
					<tr>
						<td>최고가</td>
						<td><div id="maxSido2"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="gugun2" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th colspan="2"><div id = "gugunName">구/군 평균가</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>최저가</td>
						<td><div id="minGugun2"></div></td>
					</tr>
					<tr>
						<td>평균가</td>
						<td><div id="avgGugun2"></div></td>
					</tr>
					<tr>
						<td>최고가</td>
						<td><div id="maxGugun2"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="total2" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th colspan="2">전국 평균가</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>최저가</td>
						<td><div id="minTotal2"></div></td>
					</tr>
					<tr>
						<td>평균가</td>
						<td><div id="avgTotal2"></div></td>
					</tr>
					<tr>
						<td>최고가</td>
						<td><div id="maxTotal2"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<hr>
<div id="listFee">
	<div id="listFeeDetail" class="row">
		<div id="fee1" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th>검진/접종</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="selectDx?bill_dx=진료비초진">진료비초진</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=진료비재진">진료비재진</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=진료비야간">진료비야간</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=광견병접종">광견병접종</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=켄넬코프접종">켄넬코프접종</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=종합백신접종">종합백신접종</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=코로나접종">코로나접종</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=인플루엔자접종">인플루엔자접종</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="fee2" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th>수술</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="selectDx?bill_dx=고관절수술">고관절수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=골절수술">골절수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=슬개골탈구수술">슬개골탈구수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=자궁축농증수술">자궁축농증수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=체리아이수술">체리아이수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=경계성종양수술">경계성종양수술</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=중성화수컷">중성화수컷</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=중성화암컷">중성화암컷</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="fee3" class="col">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th>치료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="selectDx?bill_dx=전신마취">전신마취</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=호흡마취">호흡마취</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=주사마취">주사마취</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=근육주사">근육주사</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=정맥주사">정맥주사</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=피하주사">피하주사</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=발치">발치</a></td>
					</tr>
					<tr>
						<td><a href="selectDx?bill_dx=스케일링">스케일링</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b11359f91c9e299d4b89d25de10ea57b&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

// 주소 선택 ajax
$('document').ready(function() {
	
	// 주소 선택 관련 필요 변수
	var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["대덕구","동구","서구","유성구","중구"];
	var area4 = ["광산구","남구","동구","북구","서구"];
	var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["남구","동구","북구","중구","울주군"];
	var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	// 시/도 선택 박스 초기화
	$("select[name^=selSido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
	  	});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});

	 // 시/도 선택시 구/군 설정
	 $("select[name^=selSido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 구군 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  //시,도 선택에 따른 구군 자동 변환
	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	 
});
 

$(function() {
	
	// 내 위치 위도 경도 팝업 geolocation 및 kakao map api 이용.
	function geolocation(){
	
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;

		console.log(lat, lon) // 콘솔 출력 테스트용
	  
		var geocoder = new kakao.maps.services.Geocoder();

		geocoder.coord2Address(lon, lat, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var address = result[0].address;
				var sido = address.region_1depth_name; // 시/도
				var gugun = address.region_2depth_name; // 구/군
				
	    		console.log(sido, gugun); // 콘솔 출력 테스트용
				
	    		compareCity(sido, gugun); // 시도, 구군 진료비 비교 함수 호출
			}
		}); 
	});
	}
	
 	// 전국 진료비 비교 함수
 	function compareTotal() {
 		$.ajax({
 			url : "compareTotal",
 			data : {
 				bill_dx : "${vo.bill_dx}"
 			},
 			success : function(x) {
 				$('#minTotal2').append(x[0] + "원");
 				$('#avgTotal2').append(x[1] + "원");
 				$('#maxTotal2').append(x[2] + "원");
 			}
 		}) //ajax
 	}
 	
 	// 도시 진료비 비교
 	function compareCity(selSido, selGugun) {
 	    
 		$('#sidoName').empty()
 		$('#minSido2').empty()
 		$('#avgSido2').empty()
 		$('#maxSido2').empty()
 		$('#gugunName').empty()
 		$('#minGugun2').empty()
 		$('#avgGugun2').empty()
 		$('#maxGugun2').empty()
 		
 		$.ajax({
 			url : "compareSido",
 			data : {
 				bill_dx : "${vo.bill_dx}",
 				bill_addr : selSido
 			},
 			success : function(x) {
 					$('#sidoName').empty()
 		 			$('#sidoName').append(selSido + " 평균가");
 	 				$('#minSido2').append(x[0] + "원");
 	 				$('#avgSido2').append(x[1] + "원");
 	 				$('#maxSido2').append(x[2] + "원");
 			},
 			error: function() {
 	            $('#sidoName').empty().append(selSido + " 데이터 없음");
 	            $('#minSido2').empty().append("없음");
 	            $('#avgSido2').empty().append("없음");
 	            $('#maxSido2').empty().append("없음");
 	        }
 		})
 		
 		$.ajax({
 			url : "compareGugun",
 			data : {
 				bill_dx : "${vo.bill_dx}",
 				bill_addr : selGugun
 			},
 			success : function(x) {
 					$('#gugunName').empty()
 		 			$('#gugunName').append(selGugun + " 평균가");
 	 				$('#minGugun2').append(x[0] + "원");
 	 				$('#avgGugun2').append(x[1] + "원");
 	 				$('#maxGugun2').append(x[2] + "원");
 			},
 			error: function() {
 	            $('#gugunName').empty().append(selGugun + " 데이터 없음");
 	            $('#minGugun2').empty().append("없음");
 	            $('#avgGugun2').empty().append("없음");
 	            $('#maxGugun2').empty().append("없음");
 	        }
 		})
 	}

 	compareTotal(); // 전체 비교
 	geolocation(); //위치 호출
 	
 	$('#submit').click(function() {
 		var selSido = $('#selSido').val();
 		var selGugun = $('#selGugun').val();
 		compareCity(selSido, selGugun);
 	})
 	
 	//현재 위치 버튼 클릭시 위치 호출
 	$('#gps').click(function() {
 	 	geolocation(); 
 	})
 	
}) //$function
 
</script>

</body>
</html>