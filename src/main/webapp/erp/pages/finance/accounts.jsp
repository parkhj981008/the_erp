<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>계정 관리</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.centered-header {
	text-align: center;
	margin-bottom: 10px;
}

.centered-header h2 {
	margin: 0;
	font-size: 26px;
}

.centered-header p {
	margin: 0;
	font-size: 18px;
}

.sub-header {
	width: 50%;
	margin: 18px auto;
	display: flex;
	justify-content: space-between;
	font-size: 18px;
}

.scroll-button {
	bottom: 20px; /* 하단에서 20px 위 */
	right: 20px; /* 오른쪽에서 20px 왼쪽 */
	padding: 10px 15px;
	font-size: 16px;
	color: white;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	z-index: 1000; /* 다른 요소 위에 표시 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.scroll-button:hover {
	background-color: #0056b3;
}

table {
	width: 50%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
	text-align: left;
}

td {
	text-align: left;
}

.numeric {
	text-align: right;
}

form {
	display: flex;
	align-items: center;
	gap: 20px;
}

.table-container{

    align-items: center; /* 세로 정렬을 가운데로 맞춤 */
	width: 100%;
	

	
	input, textarea {
		border: 1px solid #ccc;
		padding: 10px;
		border-radius: 4px;
		width: 100%;
		box-sizing: border-box;
	}
	
	input:focus, textarea:focus {
		border: 2px solid #007bff;
		box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	}
}

label {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 5px;
}

input {
	padding: 5px 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button.submit-button {
	padding: 10px 15px;
	font-size: 16px;
	color: white;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	width: 100px;
}

button.submit-button:hover {
	background-color: #0056b3;
}

button.delete-button {
	background-color: #f2f2f2 !important;
	color: #000 !important;
	border: 1px solid #ddd !important;
	padding: 8px !important;
	cursor: pointer !important;
	text-align: center !important;
	width: 100% !important;
}

button.delete-button:hover {
	background-color: #ff4d4d !important;
	color: white !important;
	border-color: #ff4d4d !important;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

table th {
	background-color: #f4f4f4;
}
</style>
<!-- base:css -->
<link rel="stylesheet"
	href="/erp/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
<!-- inject:css -->
<link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
<link rel="shortcut icon" href="/erp/images/favicon.png" />
</head>
<body>

	<div class="container-scroller">

		<!-- partial:partials/_navbar.html -->


		<%@ include file="/erp/layout/top_layout.jsp"%>

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">

			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->

			<%@ include file="/erp/layout/side_layout.jsp"%>
			<div class="parent-div" style="width: 100%;">
				<div class="main-panel" style="width: 100%;">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">계정 관리</h4>
										<div class="table-responsive">
											<section id="accountListContainer">
												<table>
													<thead>
														<tr>
															<th>계정 ID</th>
															<th>계정 이름</th>
															<th>계정 유형</th>
															<th>부모 계정</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="account" items="${KEY_ACCOUNTS_FLIST}">
															<tr>
																<td>${account.account_id}</td>
																<td>${account.account_name}</td>
																<td>${account.account_type}</td>
																<td>${account.parent_type}</td>
																<td>
																	<form action="/finance/delete_account" method="post"
																		style="margin: 0;">
																		<input type="hidden" name="account_id"
																			value="${account.account_id}">
																		<button class="delete-button"
																			data-account-id="${account.account_id}">삭제</button>
																	</form>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<div style="text-align: center; margin-top: 20px;">
													${MY_KEY_PAGING_HTML}</div>
											</section>
											

											<div class="table-container">
											<form action="/finance/add_account" method="post" class="form-horizontal">
														<table style="margin-top: 20px; border: 1px solid #ccc; width: 100%; text-align: center;">
															<thead>
																<tr>
																	<th>계정 ID</th>
																	<th>계정 이름</th>
																	<th>계정 유형</th>
																	<th>부모 계정</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td><input type="text" id="account_id"
																		name="account_id" required></td>
																	<td><input type="text" id="account_name"
																		name="account_name" required></td>
																	<td><input type="text" id="account_type"
																		name="account_type" required></td>
																	<td><input type="text" id="parent_type"
																		name="parent_type" required></td>
																</tr>
															</tbody>
														</table>
																<div class="blue-section">
																<button id="addAccountBtn" type="submit" class="submit-button" style="text-align: center;">계정추가</button>
																</div>
											</form>
											</div>
							
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<!-- container-scroller -->
	<!-- base:js -->
	<script src="/erp/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="/erp/js/off-canvas.js"></script>
	<script src="/erp/js/hoverable-collapse.js"></script>
	<script src="/erp/js/template.js"></script>
	<script src="/erp/js/settings.js"></script>
	<script src="/erp/js/todolist.js"></script>
	<!-- endinject -->
	<!-- plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->
	<!-- End custom js for this page-->
	<script>
		$(document)
				.ready(
						function() {
							// 계정 추가 버튼 클릭 이벤트
							$("#addAccountBtn")
									.click(
											function(event) {
												event.preventDefault(); // 기본 동작 방지

												const accountId = $(
														"#account_id").val();
												const accountName = $(
														"#account_name").val();
												const accountType = $(
														"#account_type").val();
												const parentType = $(
														"#parent_type").val();

												// 계정 추가 AJAX 요청
												$
														.ajax({
															url : "/finance/add_account",
															type : "POST",
															data : {
																account_id : accountId,
																account_name : accountName,
																account_type : accountType,
																parent_type : parentType
															},
															success : function(
																	response) {
																//console.log("서버 응답:", response);
																if (response
																		.trim() === "success") {
																	alert("계정이 성공적으로 추가되었습니다.");

																	// 입력 필드 초기화
																	$(
																			"#account_id")
																			.val(
																					'');
																	$(
																			"#account_name")
																			.val(
																					'');
																	$(
																			"#account_type")
																			.val(
																					'');
																	$(
																			"#parent_type")
																			.val(
																					'');

																	// 목록 갱신 호출
																	updateAccountList();
																} else {
																	alert("계정 추가에 실패했습니다. 서버 응답: "
																			+ response);
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																//console.error("AJAX 요청 실패:", error);
																alert("서버와의 통신에 문제가 발생했습니다.");
															}
														});
											});

							// 계정 삭제 버튼 클릭 이벤트
							$(document)
									.on(
											"click",
											".delete-button",
											function(event) {
												event.preventDefault(); // 기본 폼 동작 방지

												const accountId = $(this).data(
														"account-id");

												if (!confirm("이 계정을 삭제하시겠습니까?")) {
													return; // 사용자가 삭제 취소
												}

												// 계정 삭제 AJAX 요청
												$
														.ajax({
															url : "/finance/delete_account",
															type : "POST",
															data : {
																account_id : accountId
															},
															success : function(
																	response) {
																//console.log("서버 응답:", response);

																if (response
																		.trim() == "success") {
																	alert("계정이 성공적으로 삭제되었습니다.");
																	updateAccountList();
																} else {
																	alert("계정 삭제에 실패했습니다. 서버 응답: "
																			+ response);
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																//console.error("AJAX 요청 실패:", error);
																alert("서버와의 통신에 문제가 발생했습니다.");
															}
														});
											});

							// 계정 목록 갱신 함수
							function updateAccountList() {
								$
										.ajax({
											url : "/finance/accounts",
											type : "GET",
											success : function(html) {
												// 반환된 HTML에서 accountListContainer 내용만 업데이트
												const updatedContent = $(html)
														.find(
																"#accountListContainer")
														.html();
												$("#accountListContainer")
														.html(updatedContent);
											},
											error : function(xhr, status, error) {
												//console.error("목록 갱신 실패:", error);
												alert("목록을 갱신하는 데 실패했습니다.");
											}
										});
							}
						});
	</script>
	
</body>
</html>