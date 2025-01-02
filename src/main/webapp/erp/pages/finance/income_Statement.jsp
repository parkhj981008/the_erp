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
    <meta charset="UTF-8">
    <title>손익계산서</title>
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
        width: 70%;
        border-collapse: collapse;
        margin: 20px auto;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f4f4f4;
        text-align: center;
    }
    .numeric {
        text-align: right;
    }
    .section-title {
        font-weight: bold;
        text-align: center;
    }
    .account-info {
        font-size: 17px;
        margin-bottom: 20px;
    }
    .centered-header h2 {
        font-size: 26px;
        font-weight: bold;
    }
    .sub-header {
        font-size: 18px!important;
    }
</style>
</head>
<body>
    <div>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="centered-header">
                                    <h2>손익계산서</h2>
                                </div>
                                <div class="sub-header">
                                    <p>제 1기 2024/01/01 부터 2024/12/31 까지</p>
                                    <p>회사명: <c:out value="${companyName}" /></p>
                                </div>

                                <table>
                                    <thead>
                                        <tr>
                                            <th>재무제표 표시명</th>
                                            <th>계정명</th>
                                            <th>차변</th>
                                            <th>대변</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="previousParentType" value="" />
                                        <c:forEach var="vo" items="${KEY_INCOME_FLIST}">
                                            <tr>
                                                <td class="section-title">
                                                    <c:choose>
                                                        <c:when test="${vo.parent_type != previousParentType}">
                                                            ${vo.parent_type}
                                                            <c:set var="previousParentType" value="${vo.parent_type}" />
                                                        </c:when>
                                                        <c:otherwise> </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${vo.account_name}</td>
                                                <td class="numeric">
                                                    <c:if test="${vo.debit != 0}">
                                                        <fmt:formatNumber value="${vo.debit}" type="number" groupingUsed="true" />
                                                    </c:if>
                                                </td>
                                                <td class="numeric">
                                                    <c:if test="${vo.credit != 0}">
                                                        <fmt:formatNumber value="${vo.credit}" type="number" groupingUsed="true" />
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
    <script src="/erp/vendors/js/vendor.bundle.base.js"></script>
    <script src="/erp/js/off-canvas.js"></script>
    <script src="/erp/js/hoverable-collapse.js"></script>
    <script src="/erp/js/template.js"></script>
    <script src="/erp/js/settings.js"></script>
    <script src="/erp/js/todolist.js"></script>
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