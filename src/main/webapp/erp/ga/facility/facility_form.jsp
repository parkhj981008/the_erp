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


							<form id="facilityForm" action="/facility" method="POST" onsubmit="return validateForm()">
								<input type="hidden" name="actiop" value="save">
								<div class="card-body p-4">
									<div class="mb-3">
										<label for="name" class="form-label text-muted">시설이름</label> <input type="text" class="form-control" id="name" name="name" required maxlength="50">
										<div class="invalid-feedback">시설이름을 입력해주세요 (최대 50자)</div>
									</div>
									<div class="mb-3">
										<label for="location" class="form-label text-muted">시설위치</label> <input type="text" class="form-control" id="location" name="location" required maxlength="100">
										<div class="invalid-feedback">시설위치를 입력해주세요 (최대 100자)</div>
									</div>
									<div class="mb-3">
										<label for="capacity" class="form-label text-muted">시설인원</label> <input type="number" class="form-control" id="capacity" name="capacity" required min="1" max="9999">
										<div class="invalid-feedback">시설인원을 입력해주세요 (1-9999명)</div>
									</div>
									<div class="mb-3">
										<label for="operatingStatus" class="form-label text-muted">시설운영</label>
										<select class="form-select" id="operatingStatus" name="operatingStatus" required>
											<option value="">선택해주세요</option>
											<option value="운영중">운영중</option>
											<option value="중단">중단</option>
										</select>
										<div class="invalid-feedback">시설운영 상태를 선택해주세요</div>
									</div>
									<div class="mb-3">
										<label for="facilityType" class="form-label text-muted">시설타입</label>
										<select class="form-select" id="facilityType" name="facilityType" required>
											<option value="">시설타입을 선택하세요</option>
											<c:forEach items="${F_TYPE}" var="type">
												<option value="${type}">${type}</option>
											</c:forEach>
										</select>
										<div class="invalid-feedback">시설타입을 입력해주세요</div>
									</div>

									<div class="mb-3">
										<label for="completionDate" class="form-label text-muted">준공날짜</label> <input type="date" class="form-control" id="completionDate" name="completionDate" required>
										<div class="invalid-feedback">준공날짜를 선택해주세요</div>
									</div>



									<%-- <div class="mb-3">
										<label for="workName" class="form-label text-muted">담당자</label>
										<select class="form-select" id="workName" name="workName">
											<option value="">담당자를 선택하세요</option>
											<c:forEach items="${EMPTY_MANAGER}" var="manager">
												<option value="${manager.userSeq}">${manager.userSeq} - ${manager.name}</option>
											</c:forEach>
										</select>
									</div> --%>





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
	function validateForm() {
	    const form = document.getElementById('facilityForm');
	    const inputs = form.querySelectorAll('input:not(#workName), select:not(#workName)');
	    let isValid = true;

	    // 담당자를 제외한 나머지 필수 입력 필드 검증
	    inputs.forEach(input => {
	        if (!input.value.trim()) {
	            input.classList.add('is-invalid');
	            isValid = false;
	        } else {
	            input.classList.remove('is-invalid');
	        }
	    });

	    // 특수 필드 검증
	    const capacity = document.getElementById('capacity');
	    if (capacity.value) {
	        const capacityNum = parseInt(capacity.value);
	        if (isNaN(capacityNum) || capacityNum < 1 || capacityNum > 9999) {
	            capacity.classList.add('is-invalid');
	            isValid = false;
	        }
	    }

	    const completionDate = document.getElementById('completionDate');
	    if (completionDate.value) {
	        const selectedDate = new Date(completionDate.value);
	        const today = new Date();
	        if (selectedDate > today) {
	            completionDate.classList.add('is-invalid');
	            isValid = false;
	        }
	    }

	    // 이름과 위치에 특수문자 검증
	    const name = document.getElementById('name');
	    const location = document.getElementById('location');
	    const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;

	    if (specialChars.test(name.value)) {
	        name.classList.add('is-invalid');
	        isValid = false;
	    }

	    if (specialChars.test(location.value)) {
	        location.classList.add('is-invalid');
	        isValid = false;
	    }

	    if (!isValid) {
	        alert('입력값을 확인해주세요.');
	        return false;
	    }

	    return true;
	}


// 실시간 유효성 검사
document.querySelectorAll('input, select').forEach(input => {
    input.addEventListener('input', function() {
        if (this.value.trim()) {
            this.classList.remove('is-invalid');
        }
    });
});
</script>



</body>
</html>