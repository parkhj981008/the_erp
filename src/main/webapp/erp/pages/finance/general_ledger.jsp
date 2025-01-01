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
<title>전표 관리</title>

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
	text-align: !important;
	vertical-align: middle;
}

td {
	text-align: left;
}

.numeric {
	text-align: right;
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
button.submit-button {
	background-color: #f2f2f2 !important;
	color: #000 !important;
	padding: 10px !important;
	cursor: pointer !important;
	text-align: right !important;
	float: right;
}

button.submit-button:hover {
	background-color: #ff4d4d !important;
	color: white !important;
	border-color: #ff4d4d !important;
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
	<div>
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">전표 관리</h4>
								<p class="card-description">
									2024년
									<code> </code>
								</p>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center;">날짜</th>
												<th style="text-align: center;">적요</th>
												<th style="text-align: center;" width="80">계정ID</th>
												<th style="text-align: center;">계정명</th>
												<th style="text-align: center;">차변</th>
												<th style="text-align: center;">대변</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:set var="debitSum" value="0" />
											<c:set var="creditSum" value="0" />
											<c:forEach var="vo" items="${KEY_SLIP_FLIST}">
												<c:set var="debitSum" value="${debitSum + vo.debit}" />
												<c:set var="creditSum" value="${creditSum + vo.credit}" />
												<tr>
													<td>${vo.voucher_date}</td>
													<td>${vo.descript}</td>
													<td>${vo.account_id}</td>
													<td>${vo.account_name}</td>
													<td class="numeric"><c:if test="${vo.debit != 0}">
															<fmt:formatNumber value="${vo.debit}" type="number"
																groupingUsed="true" />
														</c:if></td>
													<td class="numeric"><c:if test="${vo.credit != 0}">
															<fmt:formatNumber value="${vo.credit}" type="number"
																groupingUsed="true" />
														</c:if></td>
													<td><c:if test="${vo.descript != '합계'}">
															<form action="/finance/delete_voucher" method="post"
																style="margin: 0;">
																<input type="hidden" name="voucher_date"
																	value="${vo.voucher_date}"> <input
																	type="hidden" name="descript" value="${vo.descript}">
																<input type="hidden" name="account_id"
																	value="${vo.account_id}">

																<button type="submit" class="delete-button"
																	style="background-color: #ff4d4d; color: white; border: none; padding: 5px 10px; cursor: pointer;">
																	삭제</button>
															</form>
														</c:if></td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="4">합계:</td>
												<td class="numeric"><c:if test="${debitSum != 0}">
														<fmt:formatNumber value="${debitSum}" type="number"
															groupingUsed="true" />
													</c:if></td>
												<td class="numeric"><c:if test="${creditSum != 0}">
														<fmt:formatNumber value="${creditSum}" type="number"
															groupingUsed="true" />
													</c:if></td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<hr>
									<div
										style="margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; width: 100%; box-sizing: border-box;">
										<style>
										input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
											{
											-webkit-appearance: none;
											margin: 0;
										}
										
										input[type="number"] {
											-moz-appearance: textfield;
										}
										
										input, textarea {
											border: 1px solid #ccc;
											padding: 10px;
											border-radius: 4px;
											width: 100%;
											box-sizing: border-box;
										}
										
										input:focus, textarea:focus {
											outline: none;
											border: 2px solid #007bff;
											box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
										}
										</style>
										<h3 style="text-align: center;">전표 추가</h3>
										<form action="/finance/add_voucher" method="post">
											<div class="form-group">
												<label for="voucher_date">날짜:</label> <input type="date"
													id="voucher_date" name="voucher_date" required
													style="width: 20%; text-align: left; display: inline-block;">
												<label for="descript">적요:</label> <input type="text"
													id="descript" name="descript" required
													style="width: 20%; text-align: left; display: inline-block;">
											</div>

											<div class="table-container">
												<table border="1"
													style="margin-top: 20px; width: 100%; text-align: center;">
													<thead>
														<tr>
															<th>차변 계정 ID</th>
															<th>차변 계정명</th>
															<th>차변 금액</th>
															<th>대변 계정 ID</th>
															<th>대변 계정명</th>
															<th>대변 금액</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><input type="text" id="debit_account_id"
																name="debit_account_id" required></td>
															<td><input type="text" id="debit_account_name"
																name="debit_account_name" required></td>
															<td><input type="number" id="debit" name="debit"
																required></td>
															<td><input type="text" id="credit_account_id"
																name="credit_account_id" required></td>
															<td><input type="text" id="credit_account_name"
																name="credit_account_name" required></td>
															<td><input type="number" id="credit" name="credit"
																required></td>
														</tr>
													</tbody>
												</table>
												<button type="submit" class="submit-button"
													style="text-align: center; margin-top: -20px; background-color: #f2f2f2; color: black; border: none; padding: 30px 30px; cursor: pointer;">
													입력</button>
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
		document.addEventListener('DOMContentLoaded', function() {
			const buttons = document
					.querySelectorAll('.delete-button, .submit-button');
			buttons.forEach(function(button) {
				button.addEventListener('click',
						function(event) {
							const message = button.classList
									.contains('delete-button') ? '정말 삭제하시겠습니까?'
									: '정말 입력 하시겠습니까?';
							if (!confirm(message)) {
								event.preventDefault();
							}
						});
			});
		});
	</script>
</body>
</html>