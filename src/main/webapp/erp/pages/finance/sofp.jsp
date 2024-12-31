<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>재무상태표</title>
<link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    .table {
        width: 80%;
        margin: 30px auto;
        border-collapse: collapse;
        font-size: 14px;
    }
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }
    .table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }
    .numeric {
        text-align: right;
    }
    .section-title {
        font-weight: bold;
        background-color: #f9f9f9;
    }
    .page-title {
        font-size: 24px;
        font-weight: bold;
        margin: 20px 0;
    }
    .sub-header {
        font-size: 16px;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <div>
        <div class="page-title">재무상태표</div>
        <div class="sub-header">
            2024/12/31일 기준<br>
            회사명: [ERP]
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>부모계정</th>
                        <th>계정유형</th>
                        <th>계정명</th>
                        <th>금액</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vo" items="${KEY_STATE_FLIST}">
                        <tr>
                            <td class="section-title">${vo.section_title}</td>
                            <td>${vo.account_type}</td>
                            <td class="numeric">${vo.account_name}</td>
                            <td class="numeric">${vo.diff}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="/erp/vendors/js/vendor.bundle.base.js"></script>
    <script src="/erp/js/off-canvas.js"></script>
    <script src="/erp/js/hoverable-collapse.js"></script>
    <script src="/erp/js/template.js"></script>
    <script src="/erp/js/settings.js"></script>
    <script src="/erp/js/todolist.js"></script>
</body>
</html>
