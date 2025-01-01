<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>CelestialUI Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- base:css -->
<link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/images/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</head>

<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.html -->
		
		
		<%@ include file="/erp/layout/top_layout.jsp"%>		
		
		<div id="top_nav">
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">

			<!-- partial -->
			<!-- partial:../../partials/_sidebar.html -->
			
			<%@ include file="/erp/layout/side_layout.jsp"%>
			
		
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">

						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">시설관리</h4>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">시설번호</th>
													<th scope="col">시설이름</th>
													<th scope="col">시설위치</th>
													<th scope="col">수용인원</th>
													<th scope="col">
														<select name="operStatus">
															<option value="">전체</option>
															<option value="운영">운영</option>
															<option value="중단">중단</option>
														</select>
													</th>
													<th scope="col">시설타입</th>
													<th scope="col">준공일자</th>
												</tr>
											</thead>
											<tbody id="table-tbody">


												<c:forEach var="fa" items="${Fac_LIST}">
													<tr>
														<td>${fa.facilityId}</td>
														<td><a href="/facility/details?actiop=details&facilityId=${fa.facilityId}" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"> ${fa.name} </a></td>

														<td>${fa.location}</td>
														<td>${fa.capacity}</td>
														<td><c:choose>
																<c:when test="${fa.operatingStatus eq '중단'}">
																	<label class="badge badge-danger">${fa.operatingStatus}</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-success">${fa.operatingStatus}</label>
																</c:otherwise>
															</c:choose></td>

														<td>${fa.facilityType}</td>
														<td>${fa.completionDate}</td>

													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
									<br>
									<button type="button" class="btn btn-primary float-right" id="insertBtn" onclick="location.href='/facility/create'">입력</button>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				
				<!--  footer -->
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

	<script src="/erp/js/off-canvas.js"></script>
	<script src="/erp/js/hoverable-collapse.js"></script>
	<script src="/erp/js/template.js"></script>
	<script src="/erp/js/settings.js"></script>
	<script src="/erp/js/todolist.js"></script>
	<script>
		$(document).ready(
				function() {
					$('select[name="operStatus"]').change(function() {
						let status = $(this).val();

						if (status === '중단') {
							$.ajax({
								type : "POST",
								url : "facility?actiop=status&value=close",
								dataType : "json",
								success : function(data) {
									updateFacilityTable(data);
								},
								error : function(xhr, status, error) {
									alert("데이터 로드 실패: " + error);
								}
							});
						} else if (status === '운영') {
							$.ajax({
								type : "POST",
								url : "facility?actiop=status&value=open",
								dataType : "json",
								success : function(data) {
									updateFacilityTable(data);
								},
								error : function(xhr, status, error) {
									alert("데이터 로드 실패: " + error);
								}
							});
						} else {
							$.ajax({
								type : "POST",
								url : "facility?actiop=status&value=all",
								dataType : "json",
								success : function(data) {
									updateFacilityTable(data);
								},
								error : function(xhr, status, error) {
									alert("데이터 로드 실패: " + error);
								}
							});
						}
					});
					
					

					function updateFacilityTable(data) {
					    let tbody = "";
					    $.each(data, function(index, fa) {
					        tbody += "<tr>";
					        tbody += "<td>" + fa.facilityId + "</td>";
					        tbody += "<td><a href='/facility/details?actiop=details&facilityId=" + fa.facilityId + "' class='link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover'>" + fa.name + "</a></td>";
					        tbody += "<td>" + fa.location + "</td>";
					        tbody += "<td>" + fa.capacity + "</td>";
					        tbody += "<td>";
					        if (fa.operatingStatus === '중단') {
					            tbody += "<label class='badge badge-danger'>" + fa.operatingStatus + "</label>";
					        } else {
					            tbody += "<label class='badge badge-success'>" + fa.operatingStatus + "</label>";
					        }
					        tbody += "</td>";
					        tbody += "<td>" + fa.facilityType + "</td>";
					        tbody += "<td>" + new Date(fa.completionDate).toLocaleDateString('ko-KR', {
					            year: 'numeric',
					            month: '2-digit',
					            day: '2-digit'
					        }).replace(/\. /g, '-').replace('.', '') + "</td>";
					        tbody += "</tr>";
					    });
					    $("#table-tbody").html(tbody);
					}


				});
	</script>
</body>

</html>
