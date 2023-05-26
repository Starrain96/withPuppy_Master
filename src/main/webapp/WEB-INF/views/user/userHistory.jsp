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
					    <ul class="list-group list-group-flush">
					        <li class="list-group-item">
					            <div class="d-flex justify-content-between align-items-center">
					                <a href="#">제목</a>
					                <span class="badge bg-secondary text-light">2022-01-01</span>
					            </div>
					        </li>
					        <li class="list-group-item">
					            <div class="d-flex justify-content-between align-items-center">
					                <a href="#">제목</a>
					                <span class="badge bg-secondary text-light">2022-01-02</span>
					            </div>
					        </li>
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

</body>
</html>