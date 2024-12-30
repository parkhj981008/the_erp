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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>WebSocket Chat</title>
</head>
<body>
	<h2>WebSocket Chat</h2>
	<div id="messages"></div>
	<input type="hidden" id="chat_seq" value="2"/>
	<input type="text" id="message" />
	<input type="button" id="send" value="전송" />
	
	<script type="text/javascript">
		let socket;	
		function startWebSocket() {
			socketUri = "ws://" + location.host + "/api/v1/chat";
			console.log(socketUri);
			socket = new WebSocket(socketUri);
	
			socket.onopen = function(event) {
				const authCookie = getCookie('auth');

	            if(authCookie == null) {
	            	alert("로그인 필요");
	            	return;
	            }
	            
	            const data = {
	                message: authCookie,
	                method: "init"
	            };
	            
	            socket.send(JSON.stringify(data));
			};
	
			socket.onmessage = function(event) {
				const message = event.data;
				document.getElementById("messages").innerHTML += "<p>" + message
						+ "</p>";
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
		$( document ).ready(function() {
			startWebSocket();
			$("#send").click(function() {
				const data = {
					message: $("#message").val(),
					chatSeq: $("#chat_seq").val(), 
					method: "send"
				}
				
				socket.send(JSON.stringify(data));
			});
						
			
		});
	</script>
</body>
</html>