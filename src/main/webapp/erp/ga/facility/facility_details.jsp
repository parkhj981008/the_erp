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
												<td class="fw-bold"><c:choose>
														<c:when test="${not empty MANAGER.name}">${MANAGER.name}</c:when>
														<c:otherwise>없음</c:otherwise>
													</c:choose></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="card-body p-4">
								<div class="d-flex justify-content-between align-items-center mb-3">
									<h5 class="card-title mb-0">유지보수 이력</h5>
									<button type="button" class="btn btn-primary btn-sm" id="addMaintenanceBtn">
										<i class="typcn typcn-plus"></i>
										추가
									</button>
								</div>

								<!-- 유지보수 추가 폼 (기본적으로 숨김) -->
								<div id="maintenanceForm" style="display: none;" class="mb-4">
									<div class="card">
										<div class="card-body">
											<form id="addMaintenanceForm">
												<input type="hidden" name="facilityId" value="${FACILITY.facilityId}">
												<div class="row">
													<div class="col-md-3 mb-3">
														<label class="form-label text-muted">작업일자</label> <input type="date" class="form-control" name="workingDate" required>
													</div>
													<div class="col-md-3 mb-3">
														<label class="form-label text-muted">작업상태</label>
														<select class="form-select" name="workStatus" required>
															<option value="">선택하세요</option>
															<option value="진행중">진행중</option>
															<option value="완료">완료</option>
															<option value="보류">보류</option>
														</select>
													</div>
													<div class="col-md-3 mb-3">
														<label class="form-label text-muted">작업비용</label>
														<div class="input-group">
															<input type="number" class="form-control" name="workCost" required>
															<span class="input-group-text">원</span>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12 mb-3">
														<label class="form-label text-muted">작업내용</label>
														<textarea class="form-control" name="workDetail" rows="3" required></textarea>
													</div>
												</div>
												<div class="text-end">
													<button type="button" class="btn btn-secondary" id="cancelMaintenanceBtn">취소</button>
													<button type="submit" class="btn btn-primary">저장</button>
												</div>
											</form>
										</div>
									</div>
								</div>

								<div class="table-responsive">
									<table class="table table-hover" id="maintenanceTable">

										<thead>
											<tr>
												<th>관리번호</th>
												<th>작업일자</th>
												<th>작업내용</th>
												<th>작업상태</th>
												<th>작업비용</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty MAINT}">
													<tr>
														<td colspan="5" class="text-center">유지보수 이력이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${MAINT}" var="maintenance">
														<tr>
															<td>${maintenance.maintenanceId}</td>
															<td><fmt:formatDate value="${maintenance.workingDate}" pattern="yyyy-MM-dd" /></td>
															<td>${maintenance.workDetail}</td>
															<td><span class="badge ${maintenance.workStatus == '완료' ? 'bg-success' : maintenance.workStatus == '진행중' ? 'bg-warning' : 'bg-secondary'} rounded-pill"> ${maintenance.workStatus} </span></td>
															<td><fmt:formatNumber value="${maintenance.workCost}" pattern="#,###" />원</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>





							<%-- div class="card-body p-4"> <h5 class="card-title mb-3">유지보수 이력</h5> <div class="table-responsive"> <table class="table table-hover"> <thead> <tr> <th>관리번호</th> <th>작업일자</th> <th>작업내용</th> <th>작업상태</th> <th>작업비용</th> </tr> </thead> <tbody> <c:choose> <c:when test="${not empty MAINT}"> <c:forEach items="${MAINT}" var="maintenance"> <tr> <td>${maintenance.maintenanceId}</td> <td><fmt:formatDate value="${maintenance.workingDate}" pattern="yyyy-MM-dd" /></td> <td>${maintenance.workDetail}</td> <td><span class="badge ${maintenance.workStatus == '완료' ? 'bg-success' : maintenance.workStatus == '진행중' ? 'bg-warning' : 'bg-secondary'} rounded-pill"> ${maintenance.workStatus} </span></td> <td><fmt:formatNumber value="${maintenance.workCost}" pattern="#,###" />원</td> </tr> </c:forEach> </c:when> <c:otherwise> <tr> <td colspan="5" class="text-center">유지보수 이력이 없습니다.</td> </tr> </c:otherwise> </c:choose> </tbody> </table> </div> </div> --%>
							<div class="card-footer text-end">
								<button type="button" class="btn btn-secondary" onclick="location.href='/facility/list'">목록으로</button>
								<button type="button" class="btn btn-primary" onclick="location.href='/facility/modify?facilityId=${FACILITY.facilityId}'">수정하기</button>
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

	<script>
$(document).ready(function() {
    // 추가 버튼 클릭 시
    $("#addMaintenanceBtn").click(function() {
        $("#maintenanceForm").show();
    });

    // 취소 버튼 클릭 시
    $("#cancelMaintenanceBtn").click(function() {
        $("#maintenanceForm").hide();
        $("#addMaintenanceForm")[0].reset();
    });

    // 폼 제출 시
    $("#addMaintenanceForm").submit(function(e) {
        e.preventDefault();
        
        var formData = {
            facilityId: ${FACILITY.facilityId},
            workingDate: $('input[name="workingDate"]').val(),
            workStatus: $('select[name="workStatus"]').val(),
            workDetail: $('textarea[name="workDetail"]').val(),
            workCost: $('input[name="workCost"]').val()
        };
        
        $.ajax({
            url: '/facility?actiop=maintenance',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            dataType: 'json',
            success: function(response) {
                if(response.success) {
                    updateMaintenanceTable(response.maintenance);
                    $("#maintenanceForm").hide();
                    $("#addMaintenanceForm")[0].reset();
                } else {
                    alert('저장에 실패했습니다.');
                }
            },
            error: function() {
                alert('오류가 발생했습니다.');
            }
        });
    });

    function updateMaintenanceTable(maintenance) {
        // 타임스탬프를 날짜 형식으로 변환
        let workingDate = new Date(maintenance.workingDate).toISOString().split('T')[0];
        
        let tbody = "";
        tbody += "<tr>";
        tbody += "<td>" + maintenance.maintenanceId + "</td>";
        tbody += "<td>" + workingDate + "</td>"; // 변환된 날짜 사용
        tbody += "<td>" + maintenance.workDetail + "</td>";
        tbody += "<td>";
        
        let badgeClass = maintenance.workStatus === '완료' ? 'bg-success' : 
                        maintenance.workStatus === '진행중' ? 'bg-warning' : 'bg-secondary';
        tbody += "<span class='badge " + badgeClass + " rounded-pill'>" + maintenance.workStatus + "</span>";
        tbody += "</td>";
        
        tbody += "<td>" + Number(maintenance.workCost).toLocaleString() + "원</td>";
        tbody += "</tr>";

        $("#maintenanceTable tbody").prepend(tbody);
    }


});
</script>


</body>
</html>