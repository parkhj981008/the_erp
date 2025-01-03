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

button.deleteVoucherBtn {
	background-color: #f2f2f2 !important;
	color: #000 !important;
	border: 1px solid #ddd !important;
	padding: 8px !important;
	cursor: pointer !important;
	text-align: center !important;
	width: 100% !important;
}

button.deleteVoucherBtn:hover {
	background-color: #ff4d4d !important;
	color: white !important;
	border-color: #ff4d4d !important;
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
	width: 70px;
}

button.submit-button:hover {
	background-color: #0056b3;
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
				<div class="main-panel" style="width: 90%;">
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
											<div id="voucherListContainer">
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
																		<form id="deleteVoucherForm" onsubmit="return false;">
																			<input type="hidden" name="voucher_date"
																				value="${vo.voucher_date}"> <input
																				type="hidden" name="descript" value="${vo.descript}">
																			<input type="hidden" name="account_id"
																				value="${vo.account_id}">

																			<button class="deleteVoucherBtn" type="submit"
																				data-voucher-date="${vo.voucher_date}"
																				data-descript="${vo.descript}"
																				data-account-id="${vo.account_id}">삭제</button>
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
											</div>
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
												<form id="addVoucherForm" onsubmit="return false;">
													<div class="form-group">
														<label for="voucher_date">날짜:</label> <input type="date"
															id="voucher_date" name="voucher_date" required
															style="width: 20%; text-align: left; display: inline-block;">
														<label for="descript">적요:</label> <input type="text"
															id="descript" name="descript" required
															style="width: 20%; text-align: left; display: inline-block;">
													</div>

													<div class="table-container">
														<table
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
																	<td><button id="addVoucherBtn" type="submit"
																			class="submit-button" style="text-align: center;">입력</button></td>
																</tr>
															</tbody>
														</table>

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
		$(document)
				.ready(
						function() {
							// 전표 추가 요청
							$(document)
									.on(
											"click",
											"#addVoucherBtn",
											function(event) {
												event.preventDefault(); // 기본 동작 방지

												const voucherDate = $(
														"#voucher_date").val();
												const descript = $("#descript")
														.val();
												const debitAccountId = $(
														"#debit_account_id")
														.val();
												const debitAmount = $("#debit")
														.val();
												const creditAccountId = $(
														"#credit_account_id")
														.val();
												const creditAmount = $(
														"#credit").val();

												$
														.ajax({
															url : "/finance/add_voucher",
															type : "POST",
															data : {
																voucher_date : voucherDate,
																descript : descript,
																debit_account_id : debitAccountId,
																debit : debitAmount,
																credit_account_id : creditAccountId,
																credit : creditAmount
															},
															success : function(
																	response) {
																if (response
																		.trim() === "success") {
																	alert("전표가 성공적으로 추가되었습니다.");
																	updateVoucherList();
																} else {
																	alert("전표 추가에 실패했습니다.");
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert("서버와의 통신 중 문제가 발생했습니다.");
															}
														});
											});

							// 전표 삭제 요청
							$(document).on("click", ".deleteVoucherBtn", function (event) {
    event.preventDefault(); // 기본 동작 방지

    const voucherDate = $(this).data("voucher-date");
    const descript = $(this).data("descript");
    const accountId = $(this).data("account-id");

    if (!confirm("정말로 이 전표를 삭제하시겠습니까?")) {
        return; // 사용자가 삭제를 취소한 경우
    }

    // AJAX 요청
    $.ajax({
        url: "/finance/delete_voucher",
        type: "POST",
        data: {
            voucher_date: voucherDate,
            descript: descript,
            account_id: accountId
        },
        success: function (response) {
            if (response.trim() === "success") {
                alert("전표가 성공적으로 삭제되었습니다.");
                updateVoucherList(); // 전표 목록 갱신
            } else {
                alert("전표 삭제에 실패했습니다. 다시 시도해주세요.");
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX 요청 실패:", error);
            alert("서버와의 통신 중 문제가 발생했습니다.");
        }
    });
});
							// 전표 목록 갱신 함수
							function updateVoucherList() {
								$
										.ajax({
											url : "/finance/general_ledger",
											type : "GET",
											success : function(html) {
												const updatedContent = $(html)
														.find(
																"#voucherListContainer")
														.html();
												$("#voucherListContainer")
														.html(updatedContent); // 화면에 목록 갱신
											},
											error : function(xhr, status, error) {
												console.error("목록 갱신 실패:",
														error);
												alert("목록을 갱신하는 데 문제가 발생했습니다.");
											}
										});
							}
						});
	</script>
</body>
</html>