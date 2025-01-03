<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Facility Detailes</title>
<!-- base:css -->
<link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
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

		<!-- partial:partials/_navbar.html -->


		<%@ include file="/erp/layout/top_layout.jsp"%>

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->

			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->

			<%@ include file="/erp/layout/side_layout.jsp"%>


			<!-- partial -->
			<div class="main-panel">


				<div class="content-wrapper py-4">
					<div class="container">
						<div class="card shadow-sm">
							<div class="card-header bg-primary bg-gradient text-white">
								<h4 class="card-title mb-0">시설 상세정보</h4>
							</div>
							<div class="card-body p-4">
								<div class="table-responsive">
									<table class="table table-hover table-borderless">
										<tbody>
											<tr>
												<th class="text-muted" style="width: 30%">시설번호</th>
												<td class="fw-bold">${FACILITY.facilityId}</td>
											</tr>
											<tr>
												<th class="text-muted">시설이름</th>
												<td class="fw-bold">${FACILITY.name}</td>
											</tr>
											<tr>
												<th class="text-muted">시설위치</th>
												<td class="fw-bold">${FACILITY.location}</td>
											</tr>
											<tr>
												<th class="text-muted">시설인원</th>
												<td class="fw-bold">${FACILITY.capacity}</td>
											</tr>
											<tr>
												<th class="text-muted">시설운영</th>
												<td><span class="badge ${FACILITY.operatingStatus == '중단' ? 'bg-danger' : 'bg-success'} rounded-pill"> ${FACILITY.operatingStatus} </span></td>
											</tr>
											<tr>
												<th class="text-muted">시설타입</th>
												<td class="fw-bold">${FACILITY.facilityType}</td>
											</tr>
											<tr>
												<th class="text-muted">준공날짜</th>
												<td class="fw-bold">${FACILITY.completionDate}</td>
											</tr>
											<tr>
												<th class="text-muted">담당자</th>
												<td class="fw-bold">${FACILITY.workName}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer text-end">
								<button type="button" class="btn btn-secondary" onclick="history.back()">목록으로</button>
							</div>
						</div>
					</div>
				</div>


				<%@ include file="/erp/layout/footer_layout.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
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
	<script src="/erp/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="/erp/vendors/chart.js/Chart.min.js"></script>
	<script src="/erp/js/jquery.cookie.js" type="text/javascript"></script>
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->
	<script src="/erp/js/dashboard.js"></script>
	<!-- End custom js for this page-->
</body>
</html>