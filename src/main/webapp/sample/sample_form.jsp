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
		
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->

			<%@ include file="/erp/layout/side_layout.jsp"%>


			<!-- partial -->
			<div class="main-panel">


			<div class="content-wrapper py-4">
    <div class="container">
        <div class="card shadow-sm">
            <div class="card-header bg-primary bg-gradient text-white">
                <h4 class="card-title mb-0">시설 등록</h4>
            </div>
            <form action="/facility" method="POST">
                <input type="hidden" name="action" value="create">
                <div class="card-body p-4">
                    <div class="mb-3">
                        <label for="name" class="form-label text-muted">시설이름</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="location" class="form-label text-muted">시설위치</label>
                        <input type="text" class="form-control" id="location" name="location" required>
                    </div>
                    <div class="mb-3">
                        <label for="capacity" class="form-label text-muted">시설인원</label>
                        <input type="number" class="form-control" id="capacity" name="capacity" required>
                    </div>
                    <div class="mb-3">
                        <label for="operatingStatus" class="form-label text-muted">시설운영</label>
                        <select class="form-select" id="operatingStatus" name="operatingStatus" required>
                            <option value="운영중">운영중</option>
                            <option value="중단">중단</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="facilityType" class="form-label text-muted">시설타입</label>
                        <input type="text" class="form-control" id="facilityType" name="facilityType" required>
                    </div>
                    <div class="mb-3">
                        <label for="completionDate" class="form-label text-muted">준공날짜</label>
                        <input type="date" class="form-control" id="completionDate" name="completionDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="workName" class="form-label text-muted">담당자</label>
                        <input type="text" class="form-control" id="workName" name="workName" required>
                    </div>
                </div>
                <div class="card-footer text-end">
                    <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
                    <button type="submit" class="btn btn-primary">등록</button>
                </div>
            </form>
        </div>
    </div>
</div>



				<footer class="footer">
					<div class="d-sm-flex justify-content-center justify-content-sm-between">
						<span class="text-center text-sm-left d-block d-sm-inline-block">
							Copyright Â©
							<a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com</a>
							2020
						</span>
						<span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
							Free
							<a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard </a>
							templates from Bootstrapdash.com
						</span>
					</div>
				</footer>
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