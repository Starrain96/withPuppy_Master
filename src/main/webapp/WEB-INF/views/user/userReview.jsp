<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">리뷰 목록</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="row">
					<!-- 게시글 목록 -->
					<div class="col-sm-12">
						<div id="length" style="margin-bottom: 10px"></div>
					    <ul class="list-group list-group-flush" id=userReviewList>
					        <!-- <li class="list-group-item">
                                <div class="meta-area1">
                                    <span>제목</span>
                                    <span class="badge bg-secondary text-light ms-auto">2022-01-01</span>
                                </div>
                                <div class="meta-area2">
                                    <div class="meta-child"><span>👁️</span><span id="hit-count">숫자</span></div>
                                    <div class="meta-child"><span>💬</span><span id="comment-count">숫자</span></div>
                                </div>
                            </li> -->
					    </ul>
					</div>
					</div>
                </div>
                <div class="card-footer text-muted text-end">
                   	강아지와🐶
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	userReviewList();
})

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}

function userReviewList() {
$.ajax({
    url : "../user/userReviewList",
    success : function(data) {
    	console.log(data);
    	var lenght = data.length;
    	$('#length').append(lenght + "건");
    	if (data.length!= "0") {
	    	$('#userReviewList').empty();
	    	for (i = 0; i < data.length; i++) {
	    		var review_date = formatDate(data[i].date);
	    		var review_avg = parseFloat(data[i].kind + data[i].explain + data[i].treat + data[i].facilities + data[i].price)/5
				var reviewList = 
					`<li class="list-group-item" style="cursor:pointer" onClick="location.href='<%=contextPath%>/petservice/hospital?service_id=`+data[i].service_id+`'">
                     	<div class="meta-area1">
                        	<span class="info-label">`+data[i].service_name+`</span>
                        	<span class="badge bg-secondary text-light ms-auto">`+review_date+`</span>
                    	</div>
                     	<div class="meta-area3">
                        	<span>`+data[i].content+`</span>
                    	</div>
                    	<div class="meta-area2">
                        	<div class="meta-child"><span>⭐ `+review_avg+`</span></div>
                     	</div>
                   	</li>`;
				$('#userReviewList').append(reviewList);
			}
    	}
    	
    }
})
}
</script>
</body>
</html>