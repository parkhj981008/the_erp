<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인사카드 입력 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
            padding: 10px;
            font-size: 18px;
        }
        td {
            padding: 10px;
            vertical-align: middle;
            border: 1px solid #ddd;
        }
        td input, td select {
            width: 95%;
            padding: 5px;
            box-sizing: border-box;
        }
        td:first-child {
            text-align: right;
            font-weight: bold;
            background-color: #f2f2f2;
        }
        .btn-container {
            text-align: center;
            padding: 10px;
        }
        .btn-container input {
            padding: 8px 15px;
            margin: 0 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        .btn-container input[type="reset"] {
            background-color: #f44336;
            color: white;
            border: none;
        }
    </style>
</head>
<body>

<hr>
<h2 style="text-align: center;">인사카드 입력</h2>
<hr>

<form name="Empform" id="Empform" method="post" action="${pageContext.request.contextPath}/employeeCardServlet">
    <table>
        <thead>
            <tr>
                <th colspan="2">사원정보 입력</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>아이디:</td>
                <td><input type="text" name="user_id" id="user_id" required></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="user_password" id="user_password" required></td>
            </tr>
            <tr>
                <td>이름:</td>
                <td><input type="text" name="user_name" id="user_name" required></td>
            </tr>
            <tr>
                <td>생년월일:</td>
                <td><input type="date" name="birth" id="birth" required></td>
            </tr>
            <tr>
                <td>성별:</td>
                <td>
                    <select name="gender" required>
                        <option value="m">남</option>
                        <option value="f">여</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>부서 ID:</td>
                <td><input type="number" name="department_id" id="department_id" required></td>
            </tr>
            <tr>
                <td>직위:</td>
                <td><input type="text" name="position" id="position" required></td>
            </tr>
            <tr>
                <td>관리자 ID:</td>
                <td><input type="number" name="manager_id" id="manager_id" required></td>
            </tr>
            <tr>
                <td>이메일:</td>
                <td><input type="email" name="email" id="email" required></td>
            </tr>
            <tr>
                <td>주소:</td>
                <td><input type="text" name="address" id="address" required></td>
            </tr>
            <tr>
                <td>전화번호:</td>
                <td><input type="text" name="phone_number" id="phone_number" required pattern="\d+"></td>
            </tr>
            <tr>
                <td>내선 번호:</td>
                <td><input type="number" name="extension_number" id="extension_number"></td>
            </tr>
            <tr>
                <td>사용자 상태:</td>
                <td>
                    <select name="user_status" required>
                        <option value="0">활성</option>
                        <option value="1">비활성</option>
                        <option value="2">정지된 계정</option>
                        <option value="3">삭제된 계정</option>
                        <option value="4">휴먼 계정</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>등록일:</td>
                <td><input type="hidden" name="register_date" id="register_date">자동입력</td>
            </tr>
            <tr>
                <td>수정일:</td>
                <td><input type="hidden" name="modify_date" id="modify_date">자동입력</td>
            </tr>
            <tr>
                <td>입사일:</td>
                <td><input type="date" name="hire_date" id="hire_date" required></td>
            </tr>
            <tr>
                <td>퇴사일:</td>
                <td><input type="date" name="termination_date" id="termination_date"></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" class="btn-container">
                    <input type="submit" name="submitBtn" value="인사카드 저장">
                    <input type="reset"  name="resetBtn"  value="입력 취소">
                </td>
            </tr>
        </tfoot>
    </table>
</form>

</body>
</html>
