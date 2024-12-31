<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>손익계산서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .centered-header {
            text-align: center;
            margin-bottom: 10px;
        }

        .centered-header h2 {
            margin: 0;
            font-size: 26px;
        }

        .centered-header p {
            margin: 0;
            font-size: 18px;
        }

        .sub-header {
            width: 50%;
            margin: 18px auto;
            display: flex;
            justify-content: space-between;
            font-size: 18px;
        }

        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }

        td {
            text-align: left;
        }

        .numeric {
            text-align: right;
        }

        .section-title {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="centered-header">
        <h2>손익계산서</h2>
        <p>제 1기 2024/01/01 부터 2024/12/31 까지</p>
    </div>

    <div class="sub-header">
        <p>회사명: </p>
        <p>제 1기</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>재무제표 표시명</th>
                <th>계정명</th>
                <th></th>
                <th></th>
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
                            <c:otherwise>
                                <!-- 빈칸 출력 -->
                            </c:otherwise>
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
</body>
</html>



<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$( document ).ready(function() {
	//$("#btn").click( function() {  
	//    	$("#input").val();
	//});
});
</script>
</body>
</html>