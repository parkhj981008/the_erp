<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CelestialUI Admin</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/erp/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <%@ include file="/erp/layout/top_layout.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
          <div id="settings-trigger"><i class="typcn typcn-cog-outline"></i></div>
          <div id="theme-settings" class="settings-panel">
            <i class="settings-close typcn typcn-delete-outline"></i>
            <p class="settings-heading">SIDEBAR SKINS</p>
            <div class="sidebar-bg-options" id="sidebar-light-theme">
              <div class="img-ss rounded-circle bg-light border mr-3"></div>
              Light
            </div>
            <div class="sidebar-bg-options selected" id="sidebar-dark-theme">
              <div class="img-ss rounded-circle bg-dark border mr-3"></div>
              Dark
            </div>
            <p class="settings-heading mt-2">HEADER SKINS</p>
            <div class="color-tiles mx-0 px-4">
              <div class="tiles success"></div>
              <div class="tiles warning"></div>
              <div class="tiles danger"></div>
              <div class="tiles primary"></div>
              <div class="tiles info"></div>
              <div class="tiles dark"></div>
              <div class="tiles default border"></div>
            </div>
          </div>
        </div>
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      <%@ include file="/erp/layout/side_layout.jsp" %>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
          
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">근태 조회</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
				          <th scope="col">
				          	<input type="checkbox" id="select-all" /> <!-- 전체 선택 -->
				          </th>
                          <th scope="col">근태번호</th>
                          <th scope="col">사원명</th>
                          <th scope="col">
                          	근태코드
                          	<select id="attendanceCodeSelect" class="form-control" style="width: 130px; display: inline-block;">
					            <option value="all">전체</option>
					        </select>
                          </th>
                          <th scope="col">근태수</th>
                          <th scope="col">적요</th>
                        </tr>
                      </thead>
                      <tbody id="table-tbody">
 						<c:forEach var="list" items="${attendanceList }">
 							<tr>
 							<input type="hidden" class="attendance-seq" value="${list.attendanceSeq}">
 								<td>
 									<input type="checkbox" class="row-checkbox"/>
 								</td>
 								<td>${list.attendanceSeq }</td>
 								<td>${list.userName }</td>
 								<td class="code">${list.attendanceCode }</td>
 								<td>${list.daysNumber }</td>
 								<td>${list.notes }</td>
 							</tr>
 						</c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <button type="button" class="btn btn-primary" id="insertBtn">근태 입력</button>
                  <button id="delete-selected" class="btn btn-primary">선택 항목 삭제</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <%@ include file="/erp/layout/footer_layout.jsp" %>
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
			
        	$(document).ready(function() {
       			// 전체 근태코드 select 박스로 추가
       			$.ajax({ 
       				url: '/v1/attendance/selectAttendanceItems',
       				method: 'GET',
       				dataType: 'json',
       				success: function(data) {
       					//console.log(data);
       				 	$('#attendanceCodeSelect').empty();
       				 	
       					$('#attendanceCodeSelect').append('<option value="all">전체</option>');
       					$.each(data, function(index, code) {
       				        $('#attendanceCodeSelect').append('<option value="' + code.attendanceName + '">' + code.attendanceName + '</option>');
       				      });
       				},
       				error: function (xhr, status, error) {
       		            console.error('오류 발생:', error);
       		        }
       			});
       			
       			// 근태코드 select 박스 필터링
       			$('#attendanceCodeSelect').change(function() {
       				selectedValue = $(this).val().toLowerCase().trim();
       				rows = $('#table-tbody tr'); 
       				//console.log('rows: ' + rows.attendanceCode);
       				
       				//console.log('선택된 근태코드:', selectedValue); // 선택된 근태코드 로그
       				
       				let isExist = false; 
       				
	       			rows.each(function() {
	       			  const codeLabel = $(this).find('.code').text().trim(); // 근태코드 값
	       			  //console.log('label: ' + codeLabel);
	
	       		      // 선택된 값이 '전체'이거나 근태코드가 선택된 값과 같으면 표시, 아니면 숨김
	       		      if (selectedValue === 'all' || codeLabel === selectedValue) {
	       		        $(this).show();
	       		     	isExist = true;
	       		      } else {
	       		        $(this).hide();
	       		      }
	       		    });
	       			
	       			if(!isExist) {
	       				$('#no-result-message').remove();
	       				$('.table-responsive').append('<div id="no-result-message" style="margin-top: 10px; text-align: center;">해당하는 결과가 없습니다.</div>');
	       			} else {
	       		        $('#no-result-message').remove(); // 필터링 결과가 있으면 메시지 제거
	       		    }
	       			
       			});
       			// 근태 삭제
       			$('#delete-selected').click(function() {
       				checkedRows = $('.row-checkbox:checked');
       				//console.log(checkedRows);
       				
       				if (checkedRows.length === 0) {
       			      alert('삭제할 항목을 선택하세요.');
       			      return;
       			    }
       				
       				seqList = [];
       				checkedRows.each(function() {
       					attendanceSeq = $(this).closest('tr').find('.attendance-seq').val();
       					//console.log(attendanceSeq);
       					seqList.push(attendanceSeq);
       				});
       				
       				//console.log(seqList);
       				
       				$.ajax({
       					url: '/v1/attendance/delete',
       					method: 'POST',
       					contentType: 'application/json',
       					
       				 	data: JSON.stringify({ attendanceSeqs: seqList.map(Number) }),
	       				success: function (response) {
	       			      alert('삭제가 완료되었습니다.');
	       			      
	       			      checkedRows.each(function () {
	       			        $(this).closest('tr').remove();
	       			      });
	       			    },
	       			    error: function (error) {
	       			    	//console.log(JSON.stringify({ attendanceSeqs: seqList }));
	       			      alert('삭제 중 오류가 발생했습니다.');
	       			      console.error(error);
       			    	}
       					
       				});
       			});
       			
       			$('#insertBtn').click(function() {
       				location.href="/erp/hr/attendance/insert.jsp"	
       			});
        	});
        </script>
	
</body>

</html>
