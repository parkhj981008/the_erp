<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>CelestialUI Admin</title>
<!-- base:css -->
<link rel="stylesheet"
	href="/erp/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/erp/images/favicon.png" />
</head>
<body>
	<h2>WebSocket Chat</h2>
	<div id="messages"></div>
	<input type="hidden" id="chat_seq" value="2" />
	<input type="text" id="message" />
	<input type="button" id="send" value="전송" />


	<div class="main-panel">
		<div class="content-wrapper">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">채팅방 제목</h4>
						<p class="card-description">인원 수: </p>
						<div class="table-responsive pt-3">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>First name</th>
										<th>Product</th>
										<th>Amount</th>
										<th>Deadline</th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-info">
										<td>1</td>
										<td>Herman Beck</td>
										<td>Photoshop</td>
										<td>$ 77.99</td>
										<td>May 15, 2015</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->
		<!-- partial:/erp/partials/_footer.html -->

	</div>
	<!-- main-panel ends -->

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
	<script type="text/javascript">
		let socket;
		function startWebSocket() {
			socketUri = "ws://" + location.host + "/api/v1/chat";
			console.log(socketUri);
			socket = new WebSocket(socketUri);

			socket.onopen = function(event) {
				const authCookie = getCookie('auth');

				if (authCookie == null) {
					alert("로그인 필요");
					return;
				}

				const data = {
					message : authCookie,
					method : "init"
				};

				socket.send(JSON.stringify(data));
			};

			socket.onmessage = function(event) {
				const message = event.data;
				document.getElementById("messages").innerHTML += "<p>"
						+ message + "</p>";
			};

			socket.onerror = function(event) {
				console.error("WebSocket error: ", event);
			};

			socket.onclose = function(event) {
				console.log("WebSocket is closed.");
			};
		}

		function getCookie(cookieName) {
			const cookies = document.cookie.split(';');
			for (let i = 0; i < cookies.length; i++) {
				let cookie = cookies[i].trim();
				if (cookie.startsWith(cookieName + '=')) {
					return cookie.substring(cookieName.length + 1);
				}
			}
			return null;
		}
	</script>

	<script>
		$(document).ready(function() {
			startWebSocket();
			$("#send").click(function() {
				const data = {
					message : $("#message").val(),
					chatSeq : $("#chat_seq").val(),
					method : "send"
				}

				socket.send(JSON.stringify(data));
			});

		});
	</script>
</body>
</html>