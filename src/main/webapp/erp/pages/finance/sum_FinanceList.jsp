<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>계정별 원장</title>
    <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
    <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="/erp/images/favicon.png" />
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
            text-align: center;
        }
        .numeric {
            text-align: right;
        }
        .account-info {
        font-size: 17px;
        margin-bottom: 20px;
        text-align: center;
    	}
        .centered-header h2 {
        font-size: 26px;
        font-weight: bold;
        text-align: center;
   	 	}
   	 	       #sidebar {
        position: fixed; /* 화면에 고정 */
        top: 0;          /* 화면 상단 기준 위치 */
        left: 0;         /* 화면 왼쪽 기준 위치 */
        width: 250px;    /* 사이드바 너비 */
        height: 100vh;   /* 전체 화면 높이 */
        overflow-y: auto; /* 내용이 넘치면 스크롤 가능 */
        color: #fff;    /* 글자 색상 */
    }

    .main-content {
        margin-left: 250px; /* 사이드바 너비만큼 메인 콘텐츠 밀기 */
    }
    
.sidebar-profile {
    margin-top: 60px; /* 위쪽에 여백 추가 */
    padding: 15px;
    display: flex;
    align-items: center;
    color: #fff; /* 텍스트 색상 */
    border-radius: 8px;
}

.sidebar-profile-image img {
    border-radius: 50%; /* 프로필 이미지를 원형으로 */
    width: 50px; /* 이미지 크기 */
    height: 50px;
}

.sidebar-profile-name {
    margin-left: 10px; /* 이미지와 텍스트 간 간격 */
}

.sidebar-name {
    font-size: 16px;
    font-weight: bold;
    margin: 0;
}

.sidebar-designation {
    font-size: 14px;
    margin: 0;
    color: #ccc; /* 약간 밝은 회색 */
}
    </style>

</head>
<body>
<div class="container-scroller">
	
			<!-- partial:partials/_navbar.html -->
	
	
			<%@ include file="/erp/layout/top_layout.jsp"%>
	
			<!-- partial -->
			<div class="container-fluid page-body-wrapper">
	
				<!-- partial -->
				<!-- partial:partials/_sidebar.html -->
	
				<%@ include file="/erp/layout/side_layout.jsp"%>
				<div class="main-content" style="width: calc(100% - 250px); margin-left: 250px;">
     <div class="parent-div" style="width:100%;">
        <div class="main-panel" style="width: 80%;">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="centered-header">
                                
<h2>계정별 원장</h2>

    <!-- 각 계정별 테이블 생성 -->
    <c:forEach var="entry" items="${groupedData}">
        <c:set var="accountId" value="${entry.key}" />
        <c:set var="ledgerList" value="${entry.value}" />
        <!-- 계정ID와 계정명 출력 -->
        <div class="account-info">
            계정ID: <c:out value="${accountId}"/> | 계정명: <c:out value="${ledgerList[0].account_name}"/>
        </div>
        <table>
            <thead>
                <tr style="text-align: center;">
                    <th>날짜</th>
                    <th>적요</th>
                    <th>차변</th>
                    <th>대변</th>
                    <th>잔액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${ledgerList}">
                    <tr>
                        <!-- 날짜 -->
                        <td>
                            <c:if test="${vo.descript != '합계'}">
                                <c:out value="${vo.voucher_date}"/>
                            </c:if>
                        </td>
                        
                        <!-- 적요 -->
                        <td>
                            <c:choose>
                                <c:when test="${vo.descript == '합계'}">합계</c:when>
                                <c:otherwise><c:out value="${vo.descript}"/></c:otherwise>
                            </c:choose>
                        </td>
                        
                        <!-- 차변 -->
                        <td class="numeric">
                            <c:choose>
                                <c:when test="${vo.debit == 0 || vo.descript == '합계'}"></c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${vo.debit}" groupingUsed="true"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        
                        <!-- 대변 -->
                        <td class="numeric">
                            <c:choose>
                                <c:when test="${vo.credit == 0 || vo.descript == '합계'}"></c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${vo.credit}" groupingUsed="true"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        
                        <!-- 잔액 -->
                        <td class="numeric">
                            <c:choose>
                                <c:when test="${vo.diff == 0}"></c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${vo.diff}" groupingUsed="true"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
    </c:forEach>
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
    </div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<!-- End custom js for this page-->
</body>
</html>