<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ include file="/mypageHeader.jsp"%>
        <!-- 메인 컨텐츠 -->
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="card">
                <h5 class="card-header">쇼핑 목록</h5>
                <div class="card-body">
                    <!-- 프로필 정보 출력 -->
                    <div class="row">
					<!-- 게시글 목록 -->
						<div class="col-sm-12">
							<div id="length" style="margin-bottom: 10px"></div>
						    <ul class="list-group list-group-flush" id="userShoppingList">
						        <!-- 쇼핑 목록 -->
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
	userShoppingList();
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

function userShoppingList() {
	  $.ajax({
	    url: "../user/userShoppingList",
	    success: function (data) {
	    	console.log(data);
	      	var lenght = data.length;
	     	$('#length').append(lenght + "건");
	      for (var i = 0; i < data.length; i++) {
	        var shopping_date = formatDate(data[i].order_date);
	        var shoppingList =
	          `<li class="list-group-item">
	            <div class="meta-area3">
	              <p>
	                ` + data[i].order_id + `<br>
	                ` + shopping_date + `
	              </p>
	            </div><hr>
	            <span class="info-label">주문 상품 정보</span><br><hr>`;
	          
	        var productList = data[i].productList;
	        console.log(productList);
	        
	        shoppingList += `<div>`;
	        for (var j = 0; j < productList.length; j++) {
	        	if (data[i].order_id == productList[j].order_id){
		          shoppingList +=
		            `<div class="d-flex align-items-center">
		              <img class="productImg" src=` + productList[j].product_img + ` alt="image"/>
		              <div class="author">
		                <div><span>` + productList[j].product_name + `</span></div>
		                <div><span>` + productList[j].product_price + `원</span></div>
		                <div id=""><span>` + productList[j].ordered_cnt + `개</span></div>
		              </div>
		            </div><hr>`;
	        	}
	        }
	        shoppingList += `</div>
	          <div>
	            <span class="info-label" style="margin-bottom: 20px; margin-top: 20px">총 금액</span><span class="info-value">` + data[i].total_price + `원</span>
	          </div>
	          <hr>
	          <span class="info-label">배송지 정보</span><br><hr>
	          <div class="meta-area1">
	              <p>
	              <span class="info-label">수령인</span><span class="info-value">` + data[i].receiver_name + `</span><br>
	              <span class="info-label">연락처</span><span class="info-value">` + data[i].receiver_phone + `</span><br>
	              <span class="info-label">배송지명</span><span class="info-value">` + data[i].receiver_id + `</span><br>
	              <span class="info-label">배송지</span><br>
	              <span class="info-value">` + data[i].addr1 + `</span><br>
	              <span class="info-value">` + data[i].addr2 + `</span><br>
	              <span class="info-value">` + data[i].addr3 + `</span>
	            </p>
	          </div>
	        </li>`;
	        
	        $('#userShoppingList').append(shoppingList);
	      }
	    }
	  });
	}

/* function productList() {
$.ajax({
    url : "../user/userShoppingProductList",
    success : function(data) {
    	console.log(data);
    	$('#productList').empty();
    	for (i = 0; i < data.length; i++) {
    		if (data[i].order_id == 44) {
			var productList = 
				`<div class="d-flex  align-items-center">
					<img class="productImg" src=`+ data[i].product_img +` alt="image"/>
					<div class="author">
						<div><span>`+data[i].product_name+`</span></div>
						<div><span>`+data[i].product_price+`원</span>
							<div id=""><span>`+data[i].ordered_cnt+`개</span></div>
						</div>
					</div>
				</div>`;
			$('#productList').append(productList);
    	}
		}	
    }
})
} */
</script>
</body>
</html>