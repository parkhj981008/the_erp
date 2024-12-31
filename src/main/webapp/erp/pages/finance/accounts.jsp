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
									<table class="table">
										<thead>
											<tr>
												<th>계정ID</th>
												<th>계정명</th>
												<th>계정유형</th>
												<th>부모계정</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${KEY_ACCOUNTS_FLIST}">
						                        <tr>
						                            <td>${vo.account_id}</td>
						                            <td>${vo.account_name}</td>
						                            <td>${vo.account_type}</td>
						                            <td>${vo.parent_type}</td>
						                        </tr>
                 							</c:forEach>
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