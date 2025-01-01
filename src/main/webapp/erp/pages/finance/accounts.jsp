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

.form-group {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 0; /* 기본 세로 간격 제거 */
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

button {
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
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

.form-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
	max-width: 600px;
	margin: 20px auto;
}

.form-container label {
	font-weight: bold;
	margin-bottom: 5px;
}

.form-container input {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.form-container button {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.form-container button:hover {
	background-color: #0056b3;
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
.form-container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.btn {
    display: inline-block;
    padding: 10px 15px;
    font-size: 16px;
    color: white;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
}

.btn:hover {
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
	<div>
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">계정 관리</h4>
								<p class="card-description">
									<code> </code>
								</p>
								<div class="table-responsive">
									<table>
										<thead>
											<tr>
												<th>계정 ID</th>
												<th>계정 이름</th>
												<th>계정 유형</th>
												<th>부모 계정</th>
												<th>삭제</th>
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
															<button type="submit">
																삭제</button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="form-container">
										<form action="/finance/add_account" method="post"
											class="form-horizontal">
											<div class="form-group">
												<label for="account_id">계정 ID</label> <input type="text"
													name="account_id" id="account_id" class="form-control"
													placeholder=" " required>
											</div>
											<div class="form-group">
												<label for="account_name">계정 이름</label> <input type="text"
													name="account_name" id="account_name" class="form-control"
													placeholder=" " required>
											</div>
											<div class="form-group">
												<label for="account_type">계정 유형</label> <input type="text"
													name="account_type" id="account_type" class="form-control"
													placeholder=" " required>
											</div>
											<div class="form-group">
												<label for="parent_type">부모 계정</label> <input type="text"
													name="parent_type" id="parent_type" class="form-control"
													placeholder=" " required>
											</div>
											<button type="submit" class="btn btn-primary">계정 추가</button>
										</form>
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
</body>
</html>