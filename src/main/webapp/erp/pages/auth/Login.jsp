<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
<!-- base:css -->
<link rel="stylesheet"
	href="/erp/vendors/typicons.font/font/typicons.css">
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
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img src="../../images/logo.svg" alt="logo">
							</div>
							<h4>로그인</h4>
							<form class="pt-3">
								<div class="form-group">
									<input type="email" class="form-control form-control-lg"
										id="exampleInputEmail1" placeholder="아이디">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="exampleInputPassword1" placeholder="비밀번호">
								</div>
								<div class="mt-3" id="login-div-tag">
									<a
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
										로그인 </a>
								</div>
								<br />
								<div class="mb-2">
									<button type="button"
										class="btn btn-block btn-facebook auth-form-btn">
										<i class="typcn typcn-social-facebook-circular mr-2"></i> 구글로
										로그인
									</button>
								</div>
								<div class="text-center mt-4 font-weight-light">
									계정이 없으신가요? <a href="register.html" class="text-primary">회원가입</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->



	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<!-- container-scroller -->
	<!-- base:js -->
	<script src="/erp/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="/erp/js/off-canvas.js"></script>
	<script src="/erp/js/hoverable-collapse.js"></script>
	<script src="/erp/js/template.js"></script>
	<script src="/erp/js/settings.js"></script>
	<script src="/erp/js/todolist.js"></script>
	<script>
		$(document).ready(function() {
			$("#login-div-tag").click(function() {
				
				var userId = $("#exampleInputEmail1").val();
		        var userPassword = $("#exampleInputPassword1").val();

		        // 입력값 검증
		        if (!userId || !userPassword) {
		            alert("아이디와 비밀번호를 입력해주세요.");
		            return; // 데이터가 없으면 AJAX 요청을 보내지 않음
		        }

		        var sendFormData = {
		            userId: userId,
		            userPassword: userPassword
		        };
				$.ajax({
					url : "/api/v1/auth/login",
					method : 'POST',
					data : JSON.stringify(sendFormData),
					contentType : "application/json", 
					dataType 	: "json", 	
					//success : function(obj) {
					success: function(obj) {
						window.location.href = "/";
					},
					error : function(err) {
						alert(err.responseJSON.message)
					}
				});
			});
		});
	</script>
</body>
</html>