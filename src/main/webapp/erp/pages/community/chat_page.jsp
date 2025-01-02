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
<link rel="stylesheet" href="/erp/css/chat.css">
<!-- chat.css -->
<link rel="shortcut icon" href="/erp/images/favicon.png" />
</head>
<body>
	<!-- 	<h2>WebSocket Chat</h2>
	<div id="messages"></div>
	<input type="hidden" id="chat_seq" value="2" />
	<input type="text" id="message" />
	<input type="button" id="send" value="전송" /> -->

	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-3 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">방 목록</h4>
						<p class="card-description">총 방 갯수:</p>
						<button id="openModalBtn">채팅 방 추가</button>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>방 이름</th>
										<th>인원 수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Jacob</td>
										<td>53275531</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">제목을 여기다</h4>
						<p class="card-description">인원수를 여기다</p>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>남이 쓴 글</th>
										<th>내가 쓴 글</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Jacob</td>
										<td>Photoshop</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- main-panel ends -->

		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2>채팅방 만들기</h2>
				<div>

					<input type="text" placeholder="방 이름" />
					<!-- <span id="addPeople">사용자 추가</span> -->
					<select name="chatList" id="chatList">
					</select> <input type="button" value="채팅방 추가하기" id="addChatRoom" />
				</div>
			</div>
		</div>

		<!-- 두 번째 모달 -->
		<div id="secondModal" class="modal second-modal">
			<div class="modal-content2">
				<span class="close2" id="closeSecondModalBtn2">&times;</span>
				<h2>사용자 추가</h2>
				<p>두 번째 모달입니다. 여기에 원하는 내용을 추가할 수 있습니다.</p>
			</div>
		</div>


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
						//alert("로그인 필요");
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
					/* document.getElementById("messages").innerHTML += "<p>"
							+ message + "</p>"; */
					console.log(event.data);
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
			$(document)
					.ready(
							function() {
								startWebSocket();
								$("#send").click(function() {
									const data = {
										message : $("#message").val(),
										chatSeq : $("#chat_seq").val(),
										method : "send"
									}

									socket.send(JSON.stringify(data));
								});

								$("#addChatRoom").click(function() {
									const authCookie = getCookie('auth');
									console.log("addChatRoom");
									const data = {
										message : $("#chatList").val(),
										chatSeq : 1,
										method : "createRoom"
									}
									socket.send(JSON.stringify(data));
								});

								// 모달 관련 요소 가져오기
								var modal = document.getElementById("myModal");
								var openModalBtn = document
										.getElementById("openModalBtn");
								var modalContent = document
										.getElementsByClassName("modal-content")[0];
								var closeBtn = document
										.getElementsByClassName("close")[0];

								/* var secModal = document
										.getElementById("secondModal");
								var modalContent2 = document
										.getElementsByClassName("modal-content2")[0];
								var closeBtn2 = document
										.getElementsByClassName("close2")[0]; */

								// 버튼 클릭 시 모달 열기
								openModalBtn.onclick = function() {
									modal.style.display = "flex";
									modalContent.style.display = "flex";
									closeBtn.style.display = "flex";
								}

								// 닫기 버튼 클릭 시 모달 닫기
								closeBtn.onclick = function() {
									modal.style.display = "none";
									modalContent.style.display = "none";
									closeBtn.style.display = "none";
								}

								/* document.getElementById("addPeople").onclick = function() {
									alert("클릭");
									secModal.style.display = "flex";
									modalContent2.style.display = "flex";
									closeBtn2.style.display = "flex";
								}

								closeBtn2.onclick = function() {
									secModal.style.display = "none";
									modalContent2.style.display = "none";
									closeBtn2.style.display = "none";
								}
								 */
								//채팅방
								var addList = [ 0, 2 ];

								$.ajax({
									url : "/api/v1/chat",
									method : 'GET',
									//data : JSON.stringify(sendFormData),
									//contentType : "application/json", 
									dataType : "json",
									success : function(obj) {
										addList = obj;
										var select = $('#chatList'); // select 요소 선택
										select.empty(); // 기존의 옵션들을 지우고 새로운 옵션을 추가

										// addList를 기반으로 옵션 추가
										addList.forEach(function(item) {
											var option = $('<option></option>')
													.val(item).text(item); // 새 option 생성
											select.append(option); // select에 추가
										});
									},
									error : function(err) {
										alert(err.responseJSON.message)
									}
								});

								/* // 모달 바깥 영역 클릭 시 모달 닫기
								window.onclick = function(event) {
									if (event.target === modal) {
										modal.style.display = "none";
										modalContent.style.display = "none";
										closeBtn.style.display = "none";
									}
								} */
								
								
							});
		</script>
</body>
</html>