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
    <title>계정별 원장</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left; /* 기본적으로 내용은 왼쪽 정렬 */
        }
        th {
            background-color: #f4f4f4;
            text-align: center; /* 헤더는 중앙 정렬 */
        }
        .numeric {
            text-align: right; /* 차변, 대변, 잔액 셀은 오른쪽 정렬 */
        }
    </style>
</head>
<body>
    <h1>계정별 원장</h1>

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
                <tr>
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
</body>
</html>
<br><br>


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