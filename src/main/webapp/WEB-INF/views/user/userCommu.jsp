<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">게시글 목록</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="row">
					<!-- 게시글 목록 -->
					<div class="col-sm-12">
						<div id="length" style="margin-bottom: 10px"></div>
					    <ul class="list-group list-group-flush" id=userCommuList>
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
	userCommuList();
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

function userCommuList() {
$.ajax({
    url : "../user/userCommuList",
    success : function(data) {
    	console.log(data);
    	var lenght = data.length;
    	$('#length').append(lenght + "건");
    	if (data.length!= "0") {
	    	$('#userCommuList').empty();
	    	for (i = 0; i < data.length; i++) {
	    		var commu_date = formatDate(data[i].commu_date);
				var commuList = 
					`<li class="list-group-item" style="cursor:pointer" onClick="location.href='<%=contextPath%>/communities/one?commu_no=`+data[i].commu_no+`'">
                     	<div class="meta-area1">
                        	<span class="info-label">`+data[i].commu_title+`</span>
                        	<span class="badge bg-secondary text-light ms-auto">`+commu_date+`</span>
                    	</div>
                    	<div class="meta-area2">
                        	<div class="meta-child"><span>👁️</span><span id="hit-count">`+data[i].commu_view+`</span></div>
                        	<div class="meta-child"><span>💬</span><span id="comment-count">`+data[i].commu_reply+`</span></div>
                     	</div>
                   	</li>`;
				$('#userCommuList').append(commuList);
			}
    	}
    	
    }
})
}
</script>
</body>
</html>