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
<title>CelestialUI Admin</title>
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
		<div class="row p-0 m-0 proBanner" id="proBanner">
			<div class="col-md-12 p-0 m-0">
				<div class="card-body card-body-padding d-flex align-items-center justify-content-between">
					<div class="ps-lg-1">
						<div class="d-flex align-items-center justify-content-between">
							<p class="mb-0 font-weight-medium mr-3 buy-now-text">Free 24/7 customer support, updates, and more with this template!</p>
							<a href="https://www.bootstrapdash.com/product/celestial-admin-template/?utm_source=organic&amp;utm_medium=banner&amp;utm_campaign=buynow_demo" target="_blank" class="btn mr-2 buy-now-btn border-0">Get Pro</a>
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-between">
						<a href="https://www.bootstrapdash.com/product/celestial-admin-template/">
							<i class="typcn typcn-home mr-3 text-white"></i>
						</a>
						<button id="bannerClose" class="btn border-0 p-0">
							<i class="typcn typcn-delete-outline text-white mr-0"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo" href="index.html">ERP</a>
				<a class="navbar-brand brand-logo-mini" href="index.html">
					<img src="images/logo-mini.svg" alt="logo" />
				</a>
				<button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button" data-toggle="minimize">
					<span class="typcn typcn-th-menu"></span>
				</button>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item  d-none d-lg-flex"><a class="nav-link" href="#"> Calendar </a></li>
					<li class="nav-item  d-none d-lg-flex"><a class="nav-link active" href="#"> Statistic </a></li>
					<li class="nav-item  d-none d-lg-flex"><a class="nav-link" href="#"> Employee </a></li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item d-none d-lg-flex  mr-2"><a class="nav-link" href="#"> Help </a></li>
					<li class="nav-item dropdown d-flex"><a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
							<i class="typcn typcn-message-typing"></i> <span class="count bg-success">2</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="images/faces/face4.jpg" alt="image" class="profile-pic">
								</div>
								<div class="preview-item-content flex-grow">
									<h6 class="preview-subject ellipsis font-weight-normal">David Grey</h6>
									<p class="font-weight-light small-text mb-0">The meeting is cancelled</p>
								</div>
							</a>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="images/faces/face2.jpg" alt="image" class="profile-pic">
								</div>
								<div class="preview-item-content flex-grow">
									<h6 class="preview-subject ellipsis font-weight-normal">Tim Cook</h6>
									<p class="font-weight-light small-text mb-0">New product launch</p>
								</div>
							</a>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="images/faces/face3.jpg" alt="image" class="profile-pic">
								</div>
								<div class="preview-item-content flex-grow">
									<h6 class="preview-subject ellipsis font-weight-normal">Johnson</h6>
									<p class="font-weight-light small-text mb-0">Upcoming board meeting</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item dropdown  d-flex"><a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
							<i class="typcn typcn-bell mr-0"></i> <span class="count bg-danger">2</span>
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
									<p class="font-weight-light small-text mb-0">Just now</p>
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
									<p class="font-weight-light small-text mb-0">Private message</p>
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
									<p class="font-weight-light small-text mb-0">2 days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
							<i class="typcn typcn-user-outline mr-0"></i> <span class="nav-profile-name">Evan Morales</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
							<a class="dropdown-item">
								<i class="typcn typcn-cog text-primary"></i> Settings
							</a>
							<a class="dropdown-item">
								<i class="typcn typcn-power text-primary"></i> Logout
							</a>
						</div></li>
				</ul>
				<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
					<span class="typcn typcn-th-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="typcn typcn-cog-outline"></i>
				</div>
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
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item">
						<div class="d-flex sidebar-profile">
							<div class="sidebar-profile-image">
								<img src="images/faces/face29.png" alt="image">
								<span class="sidebar-status-indicator"></span>
							</div>
							<div class="sidebar-profile-name">
								<p class="sidebar-name">Kenneth Osborne</p>
								<p class="sidebar-designation">Welcome</p>
							</div>
						</div>
						<div class="nav-search">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Type to search..." aria-label="search" aria-describedby="search">
								<div class="input-group-append">
									<span class="input-group-text" id="search"> <i class="typcn typcn-zoom"></i>
									</span>
								</div>
							</div>
						</div>
						<p class="sidebar-menu-title">Dash menu</p>
					</li>
					<li class="nav-item"><a class="nav-link" href="index.html">
							<i class="typcn typcn-device-desktop menu-icon"></i> <span class="menu-title">Dashboard <span class="badge badge-primary ml-3">New</span></span>
						</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
							<i class="typcn typcn-briefcase menu-icon"></i> <span class="menu-title">UI Elements</span> <i class="typcn typcn-chevron-right menu-arrow"></i>
						</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
							<i class="typcn typcn-film menu-icon"></i> <span class="menu-title">Form elements</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="form-elements">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic Elements</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
							<i class="typcn typcn-chart-pie-outline menu-icon"></i> <span class="menu-title">Charts</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="charts">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
							<i class="typcn typcn-th-small-outline menu-icon"></i> <span class="menu-title">Tables</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/tables/basic-table.html">Basic table</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
							<i class="typcn typcn-compass menu-icon"></i> <span class="menu-title">Icons</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
							<i class="typcn typcn-user-add-outline menu-icon"></i> <span class="menu-title">User Pages</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/samples/login.html"> Login </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/register.html"> Register </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
							<i class="typcn typcn-globe-outline menu-icon"></i> <span class="menu-title">Error pages</span> <i class="menu-arrow"></i>
						</a>
						<div class="collapse" id="error">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="pages/documentation/documentation.html">
							<i class="typcn typcn-document-text menu-icon"></i> <span class="menu-title">Documentation</span>
						</a></li>
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
						<div class="col-sm-6">
							<h3 class="mb-0 font-weight-bold">Kenneth Osborne</h3>
							<p>Your last login: 21h ago from newzealand.</p>
						</div>
						<div class="col-sm-6">
							<div class="d-flex align-items-center justify-content-md-end">
								<div class="mb-3 mb-xl-0 pr-1">
									<div class="dropdown">
										<button class="btn bg-white btn-sm dropdown-toggle btn-icon-text border mr-2" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="typcn typcn-calendar-outline mr-2"></i>Last 7 days
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3" data-x-placement="top-start">
											<h6 class="dropdown-header">Last 14 days</h6>
											<a class="dropdown-item" href="#">Last 21 days</a>
											<a class="dropdown-item" href="#">Last 28 days</a>
										</div>
									</div>
								</div>
								<div class="pr-1 mb-3 mr-2 mb-xl-0">
									<button type="button" class="btn btn-sm bg-white btn-icon-text border">
										<i class="typcn typcn-arrow-forward-outline mr-2"></i>Export
									</button>
								</div>
								<div class="pr-1 mb-3 mb-xl-0">
									<button type="button" class="btn btn-sm bg-white btn-icon-text border">
										<i class="typcn typcn-info-large-outline mr-2"></i>info
									</button>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8 d-flex grid-margin stretch-card mx-auto">
							<div class="card">
								<div class="card-body">
									<div class="d-flex flex-wrap justify-content-between">
										<h4 class="card-title mb-3 fs-2">시설 상세보기</h4>
									</div>
									<div class="row">
										<div class="col-12">
											<div class="row">
												<div class="col-sm-12">
													<div class="d-flex justify-content-between mb-4">
														<div class="font-weight-medium fs-4">항목</div>
														<div class="font-weight-medium fs-4">내용</div>
													</div>
													
													
													<div class="d-flex justify-content-between mb-4">
														<div class="text-secondary font-weight-medium fs-5">Connor Chandler</div>
														<div class="fs-1">$ 4909</div>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



				<footer class="footer">
					<div class="d-sm-flex justify-content-center justify-content-sm-between">
						<span class="text-center text-sm-left d-block d-sm-inline-block">Copyright Â© <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com</a> 2020
						</span> <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard </a>templates from Bootstrapdash.com
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