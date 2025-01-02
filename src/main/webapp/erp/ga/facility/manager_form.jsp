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
								<h4 class="card-title mb-0">관리자 등록</h4>
							</div>


							<form id="facilityForm" action="/facility" method="POST" onsubmit="return validateForm()">
								<input type="hidden" name="actiop" value=manager-add>
								<div class="card-body p-4">
									<div class="mb-3">
										<label for="name" class="form-label text-muted">사원번호</label>
										<div class="input-group">
											<input type="number" class="form-control" id="name" name="name" required>
											<button type="button" class="btn btn-outline-primary" id="checkManager">사원확인</button>
										</div>
										<div class="invalid-feedback">사원번호를 입력해주세요</div>
										<small id="managerCheckResult" class="form-text text-success" style="display: none;">확인된 사원입니다.</small>
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

	<script>
		$(document).ready(
				function() {
					const $submitButton = $('button[type="submit"]');
					const $checkButton = $('#checkManager');
					const $nameInput = $('#name');
					const $resultText = $('#managerCheckResult');

					// 초기에 등록 버튼 비활성화
					$submitButton.prop('disabled', true);

					$checkButton.click(function() {
						const managerValue = $nameInput.val().trim();

						if (!managerValue) {
							$nameInput.addClass('is-invalid');
							return;
						}

						$.ajax({
							url : 'facility',
							type : 'POST',
							data : {
								actiop : 'manager-search',
								name : managerValue
							},
							success : function(data) {
								if (data) {
									$submitButton.prop('disabled', false);
									$nameInput.removeClass('is-invalid');
									$resultText.show().removeClass(
											'text-danger').addClass(
											'text-success').text('가능한 사원입니다.');
								} else {
									$submitButton.prop('disabled', true);
									$nameInput.addClass('is-invalid');
									$resultText.show().removeClass(
											'text-success').addClass(
											'text-danger').text(
											'불가능한 사원번호입니다.');
								}
							},
							error : function() {
								$submitButton.prop('disabled', true);
								$resultText.show().addClass('text-danger')
										.text('서버 오류가 발생했습니다.');
							}
						});
					});

					// 사원번호 입력값이 변경되면 다시 버튼 비활성화
					$nameInput.on('input', function() {
						$submitButton.prop('disabled', true);
						$resultText.hide();
					});
				});
	</script>



</body>
</html>