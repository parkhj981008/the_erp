<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from demo.bootstrapdash.com/celestial-free/template/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 30 Dec 2024 08:36:28 GMT -->
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
      
     
     
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          
           <img src="data:image/png;base64,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" width=150 height=50>        
          <button type="button" class="btn btn-sm bg-white btn-icon-text border" data-toggle="minimize">
            <span class="typcn typcn-th-menu">접기</span>
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
                    <img src="images/faces/face4.jpg" alt="image" class="profile-pic">
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
                    <img src="images/faces/face2.jpg" alt="image" class="profile-pic">
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
                    <img src="images/faces/face3.jpg" alt="image" class="profile-pic">
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
        <!-- partial:partials/_settings-panel.html -->
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
            <a class="nav-link" href="index.html">
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
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
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
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic Elements</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">Basic table</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
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
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/documentation/documentation.html">
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
                    <button type="button" class="btn btn-sm bg-white btn-icon-text border"><i class="typcn typcn-arrow-forward-outline mr-2"></i>Export</button>
                  </div>
                  <div class="pr-1 mb-3 mb-xl-0">
                    <button type="button" class="btn btn-sm bg-white btn-icon-text border"><i class="typcn typcn-info-large-outline mr-2"></i>info</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="row  mt-3">
              <div class="col-xl-5 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Sessions by Channel</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="row">
                          <div class="col-lg-6">
                            <div id="circleProgress6" class="progressbar-js-circle rounded p-3"></div>
                          </div>
                          <div class="col-lg-6">
                            <ul class="session-by-channel-legend">
                              <li>
                                <div>Firewalls(3)</div>
                                <div>4(100%)</div>
                              </li>
                              <li>
                                <div>Ports(12)</div>
                                <div>12(100%)</div>
                              </li>
                              <li>
                                <div>Servers(233)</div>
                                <div>2(100%)</div>
                              </li>
                              <li>
                                <div>Firewalls(3)</div>
                                <div>7(100%)</div>
                              </li>
                              <li>
                                <div>Firewalls(3)</div>
                                <div>6(70%)</div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Events</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="row">
                          <div class="col-sm-12">
                            <div class="d-flex justify-content-between mb-md-5 mt-3">
                              <div class="small">Critical</div>
                              <div class="text-danger small">Error</div>
                              <div  class="text-warning small">Warning</div>
                            </div>
                            <canvas id="eventChart"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Device stats</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="row">
                          <div class="col-sm-12">
                            <div class="d-flex justify-content-between mb-4">
                              <div>Uptime</div>
                              <div class="text-muted">195 Days, 8 hours</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div>First Seen</div>
                              <div class="text-muted">23 Sep 2019, 2.04PM</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div>Collected time</div>
                              <div class="text-muted">23 Sep 2019, 2.04PM</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div>Memory space</div>
                              <div class="text-muted">168.3GB</div>
                            </div>
                            <div class="progress progress-md mt-4">
                              <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-3 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Sessions by Channel</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="row">
                          <div class="col-sm-12">
                            <div class="d-flex justify-content-between mb-4">
                              <div class="font-weight-medium">Empolyee Name</div>
                              <div class="font-weight-medium">This Month</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Connor Chandler</div>
                              <div class="small">$ 4909</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Russell Floyd</div>
                              <div class="small">$857</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Douglas White</div>
                              <div class="small">$612	</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Alta Fletcher </div>
                              <div class="small">$233</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Marguerite Pearson</div>
                              <div class="small">$233</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Leonard Gutierrez</div>
                              <div class="small">$35</div>
                            </div>
                            <div class="d-flex justify-content-between mb-4">
                              <div class="text-secondary font-weight-medium">Helen Benson</div>
                              <div class="small">$43</div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <div class="text-secondary font-weight-medium">Helen Benson</div>
                                <div class="small">$43</div>
                              </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-6 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Sales Analytics</h4>
                      <button type="button" class="btn btn-sm btn-light">Month</button>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="d-md-flex mb-4">
                          <div class="mr-md-5 mb-4">
                            <h5 class="mb-1"><i class="typcn typcn-globe-outline mr-1"></i>Online</h5>
                            <h2 class="text-primary mb-1 font-weight-bold">23,342</h2>
                          </div>
                          <div class="mr-md-5 mb-4">
                            <h5 class="mb-1"><i class="typcn typcn-archive mr-1"></i>Offline</h5>
                            <h2 class="text-secondary mb-1 font-weight-bold">13,221</h2>
                          </div>
                          <div class="mr-md-5 mb-4">
                            <h5 class="mb-1"><i class="typcn typcn-tags mr-1"></i>Marketing</h5>
                            <h2 class="text-warning mb-1 font-weight-bold">1,542</h2>
                          </div>
                        </div>
                        <canvas id="salesanalyticChart"></canvas>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Card Title</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="mb-5">
                          <div class="mr-1">
                            <div class="text-info mb-1">
                              Total Earning
                            </div>
                            <h2 class="mb-2 mt-2 font-weight-bold">287,493$</h2>
                            <div class="font-weight-bold">
                              1.4%  Since Last Month
                            </div>
                          </div>
                          <hr>
                          <div class="mr-1">
                            <div class="text-info mb-1">
                              Total Earning
                            </div>
                            <h2 class="mb-2 mt-2  font-weight-bold">87,493</h2>
                            <div class="font-weight-bold">
                              5.43%  Since Last Month
                            </div>
                          </div>
                        </div>
                        <canvas id="barChartStacked"></canvas>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">E-Commerce Analytics</h4>
                    </div>
                    <div class="row">
                      <div class="col-lg-9">
                        <div class="d-sm-flex justify-content-between">
                          <div class="dropdown">
                            <button class="btn bg-white btn-sm dropdown-toggle btn-icon-text pl-0" type="button" id="dropdownMenuSizeButton4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Mon,1 Oct 2019 - Tue,2 Oct 2019
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton4" data-x-placement="top-start">
                              <h6 class="dropdown-header">Mon,17 Oct 2019 - Tue,25 Oct 2019</h6>
                              <a class="dropdown-item" href="#">Tue,18 Oct 2019 - Wed,26 Oct 2019</a>
                              <a class="dropdown-item" href="#">Wed,19 Oct 2019 - Thu,26 Oct 2019</a>
                            </div>
                          </div>
                          <div>
                            <button type="button" class="btn btn-sm btn-light mr-2">Day</button>
                            <button type="button" class="btn btn-sm btn-light mr-2">Week</button>
                            <button type="button" class="btn btn-sm btn-light">Month</button>
                          </div>
                        </div>
                        <div class="chart-container mt-4">
                          <canvas id="ecommerceAnalytic"></canvas>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="text-success font-weight-bold">Inbound</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Current</div>
                            <div class="text-muted">38.34M</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Average</div>
                            <div class="text-muted">38.34M</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Maximum</div>
                            <div class="text-muted">68.14M</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">60th %</div>
                            <div class="text-muted">168.3GB</div>
                          </div>
                        </div>
                        <hr>
                        <div class="mt-4">
                          <div class="d-flex justify-content-between mb-3">
                            <div class="text-success font-weight-bold">Outbound</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Current</div>
                            <div class="text-muted">458.77M</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Average</div>
                            <div class="text-muted">1.45K</div>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                            <div class="font-weight-medium">Maximum</div>
                            <div class="text-muted">15.50K</div>
                          </div>
                          <div class="d-flex justify-content-between">
                            <div class="font-weight-medium">60th %</div>
                            <div class="text-muted">45.5</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-4 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Sale Analysis Trend</h4>
                    </div>
                    <div class="mt-2">
                      <div class="d-flex justify-content-between">
                        <small>Order Value</small>
                        <small>155.5%</small>
                      </div>
                      <div class="progress progress-md  mt-2">
                        <div class="progress-bar bg-secondary" role="progressbar" style="width: 80%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="mt-4">
                      <div class="d-flex justify-content-between">
                        <small>Total Products</small>
                        <small>238.2%</small>
                      </div>
                      <div class="progress progress-md  mt-2">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="mt-4 mb-5">
                      <div class="d-flex justify-content-between">
                        <small>Quantity</small>
                        <small>23.30%</small>
                      </div>
                      <div class="progress progress-md mt-2">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <canvas id="salesTopChart"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-lg-8 d-flex grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between">
                      <h4 class="card-title mb-3">Project status</h4>
                    </div>
                    <div class="table-responsive">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>
                              <div class="d-flex">
                                <img class="img-sm rounded-circle mb-md-0 mr-2" src="images/faces/face30.png" alt="profile image">
                                <div>
                                  <div> Company</div>
                                  <div class="font-weight-bold mt-1">volkswagen</div>
                                </div>
                              </div>
                            </td>
                            <td>
                              Budget
                              <div class="font-weight-bold  mt-1">$2322 </div>
                            </td>
                            <td>
                              Status
                              <div class="font-weight-bold text-success  mt-1">88% </div>
                            </td>
                            <td>
                              Deadline
                              <div class="font-weight-bold  mt-1">07 Nov 2019</div>
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-secondary">edit actions</button>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex">
                                <img class="img-sm rounded-circle mb-md-0 mr-2" src="images/faces/face31.png" alt="profile image">
                                <div>
                                  <div> Company</div>
                                  <div class="font-weight-bold  mt-1">Land Rover</div>
                                </div>
                              </div>
                            </td>
                            <td>
                              Budget
                              <div class="font-weight-bold  mt-1">$12022  </div>
                            </td>
                            <td>
                              Status
                              <div class="font-weight-bold text-success  mt-1">70% </div>
                            </td>
                            <td>
                              Deadline
                              <div class="font-weight-bold  mt-1">08 Nov 2019</div>
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-secondary">edit actions</button>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex">
                                <img class="img-sm rounded-circle mb-md-0 mr-2" src="images/faces/face32.png" alt="profile image">
                                <div>
                                  <div> Company</div>
                                  <div class="font-weight-bold  mt-1">Bentley </div>
                                </div>
                              </div>
                            </td>
                            <td>
                              Budget
                              <div class="font-weight-bold  mt-1">$8,725</div>
                            </td>
                            <td>
                              Status
                              <div class="font-weight-bold text-success  mt-1">87% </div>
                            </td>
                            <td>
                              Deadline
                              <div class="font-weight-bold  mt-1">11 Jun 2019</div>
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-secondary">edit actions</button>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex">
                                <img class="img-sm rounded-circle mb-md-0 mr-2" src="images/faces/face33.png" alt="profile image">
                                <div>
                                  <div> Company</div>
                                  <div class="font-weight-bold  mt-1">Morgan </div>
                                </div>
                              </div>
                            </td>
                            <td>
                              Budget
                              <div class="font-weight-bold  mt-1">$5,220 </div>
                            </td>
                            <td>
                              Status
                              <div class="font-weight-bold text-success  mt-1">65% </div>
                            </td>
                            <td>
                              Deadline
                              <div class="font-weight-bold  mt-1">26 Oct 2019</div>
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-secondary">edit actions</button>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex">
                                <img class="img-sm rounded-circle mb-md-0 mr-2" src="images/faces/face34.png" alt="profile image">
                                <div>
                                  <div> Company</div>
                                  <div class="font-weight-bold  mt-1">volkswagen</div>
                                </div>
                              </div>
                            </td>
                            <td>
                              Budget
                              <div class="font-weight-bold  mt-1">$2322 </div>
                            </td>
                            <td>
                              Status
                              <div class="font-weight-bold text-success mt-1">88% </div>
                            </td>
                            <td>
                              Deadline
                              <div class="font-weight-bold  mt-1">07 Nov 2019</div>
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-secondary">edit actions</button>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
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

<!-- Mirrored from demo.bootstrapdash.com/celestial-free/template/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 30 Dec 2024 08:36:41 GMT -->
</html>