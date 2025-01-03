<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>권한 관리</title>
<!-- base:css -->
<link rel="stylesheet"
	href="/erp/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/erp/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">제목을 여기다</h4>
					<p class="card-description">인원수를 여기다</p>
					<div class="table-responsive">
						<table class="table table-hover" id="dynamicTable">
							<thead>
								<tr>
									<th>주소</th>
									<th>http 메서드</th>
									<th>추가일</th>
									<th>추가자</th>
									<th>규칙</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->



	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<!-- container-scroller -->
	<!-- base:js -->
	<script src="/erp/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="/erp/js/off-canvas.js"></script>
	<script src="/erp/js/hoverable-collapse.js"></script>
	<script src="/erp/js/template.js"></script>
	<script src="/erp/js/settings.js"></script>
	<script src="/erp/js/todolist.js"></script>
	<script>
		$(document).ready(function() {
			$.ajax({
				url : "/api/v1/auth/features",
				method : 'GET',
				contentType : "application/json",
				dataType : "json",
				success : function(obj) {
					// 테이블의 tbody를 동적으로 업데이트
					let tableBody = $("#dynamicTable tbody");
					tableBody.empty();  // 기존 테이블 내용 삭제
					
					// 응답 데이터가 배열이라고 가정하고, 각 항목에 대해 행 추가
					$.each(obj.data.datas, function(index, item) {
						let date = new Date(item.createAt);  // item.createAt이 UNIX 타임스탬프일 경우
					    let formattedDate = date.toISOString().split('T')[0];  // "YYYY-MM-DD" 형식으로 포맷
						let row = $("<tr></tr>");
						row.append("<td>" + item.url + "</td>");
						row.append("<td>" + item.httpMethod + "</td>");
						row.append("<td>" + formattedDate + "</td>"); 
						row.append("<td>" + item.userName + "</td>");
						row.append("<td>" + item.roleSeq + "</td>");
						tableBody.append(row);
						
						let patchButtonTd = $("<td></td>");
					    let patchButton = $("<button></button>").text("수정");  
					    patchButtonTd.append(patchButton);  
					    row.append(patchButtonTd);  
						
						let delButtonTd = $("<td></td>");
					    let delButton = $("<button></button>").text("삭제");  
					    delButtonTd.append(delButton);  
					    row.append(delButtonTd);  

					    tableBody.append(row);

					    
					    patchButton.click(function() {
					    	console.log("수정");   
					    });
					    
					    delButton.click(function() {
					    	console.log("삭제");   
					    });
					});
				},
				error : function(err) {
					alert(err.responseJSON.message)
				}
			});
			
			
			function deleteFeature(featureSeq) {
				console.log("하하", featureSeq);
			    $.ajax({
			        url: '/your-api-endpoint',  // 실제 API URL로 변경
			        method: 'POST',
			        data: JSON.stringify({ featureSeq: featureSeq }),  // 전송할 데이터 (JSON 형식)
			        contentType: 'application/json',
			        dataType: 'json',
			        success: function(response) {
			            console.log('성공:', response);
			            // 서버 응답에 대한 추가적인 처리 (예: 메시지 표시 등)
			        },
			        error: function(error) {
			            console.error('오류:', error);
			            // 오류 처리
			        }
			    });
			}

			/* $.ajax({
				url : "/api/v1/auth/login",
				method : 'POST',
				data : JSON.stringify(sendFormData),
				contentType : "application/json", 
				dataType 	: "json", 	
				//success : function(obj) {
				success: function(obj) {
					window.location.href = "/";
				},
				error : function(err) {
					alert(err.responseJSON.message)
				}
			}); */
		});
	</script>
</body>
</html>