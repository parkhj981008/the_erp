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
<title>   </title>
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
												<th>날짜</th>
												<th>적요</th>
												<th width="80">계정ID</th>
												<th>계정명</th>
												<th>차변</th>
												<th>대변</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="debitSum" value="0" />
											<c:set var="creditSum" value="0" />
											<c:forEach var="vo" items="${KEY_TOTAL_FLIST}">
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
											</tr>
										</tbody>
									</table>
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