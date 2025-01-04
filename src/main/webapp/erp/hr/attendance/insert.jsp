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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- base:css -->
  <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/erp/images/favicon.png" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  
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
                  <h4 class="card-title">근태 입력</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">근태일자</th>
                          <th scope="col">사원</th>
                          <th scope="col">근태</th>
                          <th scope="col">근태(일/시간)</th>
                          <th scope="col">적요</th>
                        </tr>
                      </thead>
                      <form id="attendanceForm">
	                      <tbody id="table-tbody">
	                      	<tr>
	                      		<td>
	                      			<input class="form-control" type="date" id="attendanceDate" name="attendanceDate" value="" style="line-height: 2;">
	                      		</td>
	                      		<td class="userList w-25" style="cursor: pointer">
	                      			<input class="form-control input-sm" type="text" name="userName" placeholder="">
	                      		</td>
	                      		<td class="attendanceItemsList w-25" style="cursor: pointer">
	                      			<input class="form-control input-sm" type="text" name="attendanceCode">
	                      		</td>
	                      		<td class="col-lg-4 w-25">
	                      			<input class="form-control input-sm" type="number" name="daysNumber" placeholder="" min="0" max="2" oninput="handleOnInput(this, 2)">
	                      		</td>
	                      		<td class="col-lg-4 w-25">
	                      			<input class="form-control input-sm" type="text" name="notes" placeholder="">
	                      		</td>
	                      	</tr>
	                      </tbody>
                      </form>
                    </table>
                  </div>
                  <button type="button" class="btn btn-primary" id="insertBtn">근태 입력</button>
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
       			// 전체 직원 리스트 조회
       			function selectEmployeeList() {
	       			$.ajax({ 
	       				url: '/v1/attendance/selectAllEmployee',
	       				method: 'GET',
	       				dataType: 'json',
	       				success: function(data) {
	       					$('#first-content').show();
	       					$('#second-content').hide();
	       					
	       					$('#modal-tbody').empty();
	       					var html = '';
	       					$.each(data, function(i, vo) {
	      						//console.log(vo);
	      						html += '<tr style="cursor: pointer;">';
	      						html += '<td>' + vo.userSeq + '</td>';
	      						html += '<td>' + vo.userName + '</td>';
	      						html += '<td>' + vo.name + '</td>';
	      						html += '</tr>';
	       					});
	       					$('#searchUserModal-tbody').html(html);
	       				},
	       				error: function (xhr, status, error) {
	       		            console.error('오류 발생:', error);
	       		        }
	       			});
       			}
       			
       			// 전체 근태 항목 조회
       			function selectAttendItems() {
	       			$.ajax({ 
	       				url: '/v1/attendance/selectAttendanceItems',
	       				method: 'GET',
	       				dataType: 'json',
	       				success: function(data) {
	       					$('#first-content').hide();
	       					$('#second-content').show();
	       					
	       					$('#selectAttendanceCodeModal-tbody').empty();
	       					var html = '';
	       					$.each(data, function(i, vo) {
	      						//console.log(vo);
	      						html += '<tr style="cursor: pointer;">';
	      						html += '<td>' + vo.rownum + '</td>';
	      						html += '<td>' + vo.attendanceCode + '</td>';
	      						html += '<td >' + vo.attendanceName + '</td>';
	      						html += '</tr>';
	       					});
	       					$('#selectAttendanceCodeModal-tbody').html(html);
	       				},
	       				error: function (xhr, status, error) {
	       		            console.error('오류 발생:', error);
	       		        }
	       			});
       			}
       			
       			// first-content 활성화
       			$(document).on('click', '.userList', function() {
       				selectEmployeeList();
       				$('#insertModal').modal('show');
       			});
       			
       			// second-content 활성화
       			$(document).on('click', '.attendanceItemsList', function() {
       				selectAttendItems();
       				$('#insertModal').modal('show');
       			});
       			
       			// 모달 열기 전에 클릭한 .userList 요소 특정
       			$(document).on('click', '.userList', function() {
       				$('.userList').removeAttr('data-active');
       				$(this).attr('data-active', 'true'); // 클릭된 요소에 활성화 속성 추가
       			});
       			
       			// 모달 열기 전에 클릭한 .attendanceItemsList 요소 특정
       			$(document).on('click', '.attendanceItemsList', function() {
       				$('.attendanceItemsList').removeAttr('data-active');
       				$(this).attr('data-active', 'true'); // 클릭된 요소에 활성화 속성 추가
       			});
       			
       			// 직원 이름 동적으로 추가된 요소에 이벤트 위임
       			$(document).on('click', '#searchUserModal-tbody tr', function () {
       			  const selectedUserSeq = $(this).find('td:nth-child(1)').text();
       			  const selectedUserName = $(this).find('td:nth-child(2)').text();
       			  //console.log(selectedUserSeq, selectedUserName);
       			  
       			  $('#insertModal').modal('hide');
       			  
       			  const targetElement = $('.userList[data-active="true"]');
       			  targetElement.text(selectedUserName);
       			  targetElement.removeAttr('data-active');
       			  
       			const hiddenUserSeq = $('<input>').attr({
       			    type: 'hidden',
       			    name: 'userSeq',
       			    value: selectedUserSeq
       			  });
       			  
       			  const hiddenUserName = $('<input>').attr({
       			    type: 'hidden',
       			    name: 'userName',
       			    value: selectedUserName
       			  });

       			  // 이미 존재하는 경우 제거 후 다시 추가 (중복 방지)
       			  $('#attendanceForm input[name="userSeq"]').remove();
       			  $('#attendanceForm input[name="userName"]').remove();
       			  
       			  $('#attendanceForm').append(hiddenUserSeq);
       			  $('#attendanceForm').append(hiddenUserName);
       			});
       			
       			// 근태 항목 동적으로 추가된 요소에 이벤트 위임
       			$(document).on('click', '#selectAttendanceCodeModal-tbody tr', function () {
       			  const selectedCodeName = $(this).find('td:nth-child(3)').text();
       			  //console.log(selectedCodeName);
       			  
       			  $('#insertModal').modal('hide');
       			  
       			  const targetElement = $('.attendanceItemsList[data-active="true"]');
       			  targetElement.text(selectedCodeName);
       			  targetElement.removeAttr('data-active');
       			  
       			  const hiddenInput = $('<input>').attr({
       			    type: 'hidden',
       			    name: 'attendanceCode',
       			    value: selectedCodeName
       			  });

       			  // 이미 존재하는 경우 제거 후 다시 추가 (중복 방지)
       			  $('#attendanceForm input[name="attendanceCode"]').remove();
       			  $('#attendanceForm').append(hiddenInput);
       			});
       			
        	});
        	
        	// 근태 입력 btn
        	$('#insertBtn').click(function() {
        		var formDataArray = $('#attendanceForm').serializeArray();
        		var formData = {};
        		
        		 // 순차적으로 입력 확인
        	    for (var i = 0; i < formDataArray.length; i++) {
        	        var field = formDataArray[i];

        	        // 'notes'는 검증 제외
        	        if (field.name !== 'notes' && !field.value.trim()) {
        	            var fieldLabel;
        	            switch (field.name) {
        	                case 'attendanceDate':
        	                    fieldLabel = '근태일자';
        	                    break;
        	                case 'userName':
        	                    fieldLabel = '사원';
        	                    break;
        	                case 'attendanceCode':
        	                    fieldLabel = '근태';
        	                    break;
        	                case 'daysNumber':
        	                    fieldLabel = '근태(일/시간)';
        	                    break;
        	                default:
        	                    fieldLabel = field.name;
        	            }

        	            // 경고 메시지 표시 및 포커스 이동
        	            alert(fieldLabel + '를(을) 입력해주세요.');
        	            $('[name="' + field.name + '"]').focus();
        	            return; // 중단
        	        }

        	        // 입력값 저장
        	        formData[field.name] = field.value;
        	    }
        	    
        		$.ajax({
        			url: '/v1/attendance/insert',
        			method: 'POST',
        			contentType: 'application/json; charset=UTF-8',
        			data: JSON.stringify(formData),
        			success: function() {
        				alert('근태 입력이 성공적으로 완료되었습니다.');
        				window.location.href = '/v1/attendance/selectAll';
        			},
        			error: function (xhr, status, error) {
       		            console.error('오류 발생:', error);
       		        }
        		});
        	});
        	
        	// 근태일수 자릿수 제한
        	function handleOnInput (el, maxlength) {
        		 // 입력값에 '-'이 포함된 경우 제거
        	    el.value = el.value.replace(/-/g, '');
        		
        		 // 자릿수 제한
        		if(el.value.length > maxlength)  {
        		    el.value 
        		      = el.value.substr(0, maxlength);
       		  	} else if(el.value === '-') {
       		  		el.value = 0;
       		  	}
        		
        	}
        </script>
        
<!-- 모달창 -->
<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- 사원 검색 모달창 -->
      <div id="first-content">
	      <div class="modal-header" id="userSearchHeader">
	        <h3 class="modal-title" id="insertModalLabel">사원 검색</h3>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" id="userSearchBody">
	        <table class="table">
	          <tr>
	            <th>사원번호</th>
	            <th>성명</th>
	            <th>부서명</th>
	          </tr>
	          <tbody id="searchUserModal-tbody">
	          </tbody>
	        </table>
	      </div>
	  </div>
	  
      <!-- 근태 입력 모달창 -->
      <div id="second-content" style="display: none;">
	      <div class="modal-header" id="attendanceInputHeader">
	        <h3 class="modal-title" id="insertAttendanceModalLabel">근태항목 조회</h3>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" id="attendanceInputBody">
	        <table class="table">
	          <tr>
	            <th>순번</th>
	            <th>근태코드</th>
	            <th>근태코드명</th>
	          </tr>
	          <tbody id="selectAttendanceCodeModal-tbody">
	          </tbody>
	        </table>
	      </div>
      </div>
    </div>
  </div>
</div>

<!-- 사원 검색 모달창 end -->
</body>

</html>
