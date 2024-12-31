<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL 테스트</h2>
	<p>일반 테스트: ${test}</p>
	<p>사칙연산 테스트: ${2 + 2}</p>
	<p>논리 테스트: ${true && true}</p>

	<table class="table align-middle table-nowrap table-borderless">
	<thead>
		<tr>

			<th scope="col">시설아이디</th>
			<th scope="col">시설이름</th>
			<th scope="col">시설위치</th>
			<th scope="col">수용인원</th>
			<th scope="col">시설상태</th>
			<th scope="col">시설타입</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="alist" items="${allList}">
			<tr>
				<td>${alist.facilityId}</td>
				<td>${alist.name}</td>
				<td>${alist.location}</td>
				<td>${alist.capacity}</td>
				<td>${alist.operatingStatus}</td>
				<td>${alist.facilityType}</td>
				<td>${alist.completionDate}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
</html>