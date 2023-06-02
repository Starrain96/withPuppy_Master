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
	<br>
	<h4>진료비 총 등록 건 수 : ${billCount}</h4>
	<br>
</div>
<hr>
<div id="listFee">
	<div id="listFeeDetail" class="row">
		<div id="fee1" class="col">
			<table class="table">
				<thead>
					<tr>
						<th>검진/접종</th>
					</tr>
				</thead>
				<tbody>
						<tr><td><a href="selectDx?bill_dx=진료비초진">진료비초진</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=진료비재진">진료비재진</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=진료비야간">진료비야간</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=광견병접종">광견병접종</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=켄넬코프접종">켄넬코프접종</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=종합백신접종">종합백신접종</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=코로나접종">코로나접종</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=인플루엔자접종">인플루엔자접종</a></td></tr>
				</tbody>
			</table>
		</div>
		<div id="fee2" class="col">
			<table class="table">
				<thead>
					<tr>
						<th>수술</th>
					</tr>
				</thead>
				<tbody>
						<tr><td><a href="selectDx?bill_dx=고관절수술">고관절수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=골절수술">골절수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=슬개골탈구수술">슬개골탈구수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=자궁축농증수술">자궁축농증수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=체리아이수술">체리아이수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=경계성종양수술">경계성종양수술</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=중성화수컷">중성화수컷</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=중성화암컷">중성화암컷</a></td></tr>
				</tbody>
			</table>
		</div>
		<div id="fee3" class="col">
			<table class="table">
				<thead>
					<tr>
						<th>치료</th>
					</tr>
				</thead>
				<tbody>
						<tr><td><a href="selectDx?bill_dx=전신마취">전신마취</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=호흡마취">호흡마취</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=주사마취">주사마취</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=근육주사">근육주사</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=정맥주사">정맥주사</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=피하주사">피하주사</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=발치">발치</a></td></tr>
						<tr><td><a href="selectDx?bill_dx=스케일링">스케일링</a></td></tr>
				</tbody>
			</table>
		</div>
	</div>


</div>

</body>
</html>