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
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="../../index.html">ERP</a>
          <a class="navbar-brand brand-logo-mini" href="../../index.html"><img src="../../images/logo-mini.svg" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button" data-toggle="minimize">
            <span class="typcn typcn-th-menu"></span>
          </button>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <ul class="navbar-nav mr-lg-2">
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link" href="#">
                Calendar
              </a>
            </li>
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link active" href="#">
                Statistic
              </a>
            </li>
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link" href="#">
                Employee
              </a>
            </li>
          </ul>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item d-none d-lg-flex  mr-2">
              <a class="nav-link" href="#">
                Help
              </a>
            </li>
            <li class="nav-item dropdown d-flex">
              <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
                <i class="typcn typcn-message-typing"></i>
                <span class="count bg-success">2</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="../../images/faces/face4.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal">David Grey
                    </h6>
                    <p class="font-weight-light small-text mb-0">
                      The meeting is cancelled
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="../../images/faces/face2.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal">Tim Cook
                    </h6>
                    <p class="font-weight-light small-text mb-0">
                      New product launch
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="../../images/faces/face3.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal"> Johnson
                    </h6>
                    <p class="font-weight-light small-text mb-0">
                      Upcoming board meeting
                    </p>
                  </div>
                </a>
              </div>
            </li>
            <li class="nav-item dropdown  d-flex">
              <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
                <i class="typcn typcn-bell mr-0"></i>
                <span class="count bg-danger">2</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-success">
                      <i class="typcn typcn-info-large mx-0"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject font-weight-normal">Application Error</h6>
                    <p class="font-weight-light small-text mb-0">
                      Just now
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-warning">
                      <i class="typcn typcn-cog mx-0"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject font-weight-normal">Settings</h6>
                    <p class="font-weight-light small-text mb-0">
                      Private message
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-info">
                      <i class="typcn typcn-user-outline mx-0"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject font-weight-normal">New user registration</h6>
                    <p class="font-weight-light small-text mb-0">
                      2 days ago
                    </p>
                  </div>
                </a>
              </div>
            </li>
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                <i class="typcn typcn-user-outline mr-0"></i>
                <span class="nav-profile-name">Evan Morales</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item">
                <i class="typcn typcn-cog text-primary"></i>
                Settings
                </a>
                <a class="dropdown-item">
                <i class="typcn typcn-power text-primary"></i>
                Logout
                </a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="typcn typcn-th-menu"></span>
          </button>
        </div>
      </nav>
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
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <div class="d-flex sidebar-profile">
              <div class="sidebar-profile-image">
                <img src="/images/faces/face29.png" alt="image">
                <span class="sidebar-status-indicator"></span>
              </div>
              <div class="sidebar-profile-name">
                <p class="sidebar-name">
                  Kenneth Osborne
                </p>
                <p class="sidebar-designation">
                  Welcome
                </p>
              </div>
            </div>
            <div class="nav-search">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Type to search..." aria-label="search" aria-describedby="search">
                <div class="input-group-append">
                  <span class="input-group-text" id="search">
                    <i class="typcn typcn-zoom"></i>
                  </span>
                </div>
              </div>
            </div>
            <p class="sidebar-menu-title">Dash menu</p>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../../index.html">
              <i class="typcn typcn-device-desktop menu-icon"></i>
              <span class="menu-title">Dashboard <span class="badge badge-primary ml-3">New</span></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="typcn typcn-briefcase menu-icon"></i>
              <span class="menu-title">UI Elements</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="../ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="../ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="typcn typcn-film menu-icon"></i>
              <span class="menu-title">Form elements</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="../forms/basic_elements.html">Basic Elements</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="typcn typcn-chart-pie-outline menu-icon"></i>
              <span class="menu-title">Charts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="typcn typcn-th-small-outline menu-icon"></i>
              <span class="menu-title">Tables</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="basic-table.html">Basic table</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="typcn typcn-compass menu-icon"></i>
              <span class="menu-title">Icons</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../icons/mdi.html">Mdi icons</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="typcn typcn-user-add-outline menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/register.html"> Register </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="typcn typcn-globe-outline menu-icon"></i>
              <span class="menu-title">Error pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../documentation/documentation.html">
              <i class="typcn typcn-document-text menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
        </ul>
        <ul class="sidebar-legend">
          <li>
            <p class="sidebar-menu-title">Category</p>
          </li>
          <li class="nav-item"><a href="#" class="nav-link">#Sales</a></li>
          <li class="nav-item"><a href="#" class="nav-link">#Marketing</a></li>
          <li class="nav-item"><a href="#" class="nav-link">#Growth</a></li>
        </ul>
      </nav>
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
                         <!--  <th scope="col">휴가</th> -->
                          <th scope="col">근태(일/시간)</th>
                          <th scope="col">적요</th>
                        </tr>
                      </thead>
                      <form id="attendanceForm">
	                      <tbody id="table-tbody">
	                      <!-- <input type="hidden" name="userSeq" id="userSeq"> -->
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
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-center text-sm-left d-block d-sm-inline-block">Copyright Â© <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com</a> 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard </a>templates from Bootstrapdash.com</span>
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
	      						console.log(vo);
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
	      						console.log(vo);
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
       			  console.log(selectedUserSeq, selectedUserName);
       			  
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
       			  console.log(selectedCodeName);
       			  
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
        	    $.each(formDataArray, function(_, field) {
        	        formData[field.name] = field.value;
        	    });
        	    
        		$.ajax({
        			url: '/v1/attendance/insert',
        			method: 'POST',
        			contentType: 'application/json; charset=UTF-8',
        			data: JSON.stringify(formData),
        			success: function() {
        				alert('근태 입력이 성공적으로 완료되었습니다.');
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
