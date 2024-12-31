<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>인사카드 목록</title>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        
        <div id="layoutSidenav">


            <div id="layoutSidenav_content">
                <main>
                    <h1>인사카드</h1>
                    <ol>
                        <li>인사카드  > <font color=blue>인사카드 목록</font></li>
                    </ol>
                    <div>
                        <div>
                            <i class="fas fa-table me-1"></i>
                            인사카드
                        </div>
                        <div>
                            <table id="datatablesSimple">
                                <thead>  
                                    <tr>
                                        <th>사원번호</th>
                                        <th>이름</th>
                                        <th>계정ID</th>
                                        <th>성별</th>
                                        <th>생년월일</th>
                                        <th>이메일</th>
                                        <th>부서번호</th>
                                        <th>직급</th>
                                        <th>전화번호</th>
                                        <th>내선번호</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>사원번호</th>
                                        <th>이름</th>
                                        <th>계정ID</th>
                                        <th>성별</th>
                                        <th>생년월일</th>
                                        <th>이메일</th>
                                        <th>부서번호</th>
                                        <th>직급</th>
                                        <th>전화번호</th>
                                        <th>내선번호</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach var="hvo" items="${MY_KEY_ELIST}">
                                        <tr>
                                            <td>${hvo.user_seq}</td>
                                            <td>${hvo.user_name}</td>
                                            <td>${hvo.user_id}</td>
                                            <td>${hvo.gender}</td>
                                            <td>${hvo.birth}</td>
                                            <td>${hvo.email}</td>
                                            <td>${hvo.department_id}</td>
                                            <td>${hvo.position}</td>
                                            <td>${hvo.phone_number}</td>
                                            <td>${hvo.extension_number}</td>
                                        </tr>	
                                    </c:forEach>
                                </tbody>
                            </table>
                            <br>
                            ${MY_KEY_PAGING_HTML}
                            <br>
                            <input type="button" value="  신규 등록  " id="insertFormBtn">
                        </div>
                    </div>
                </main>
                <footer>
                    <div>
                        <div>
                            <div>Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
    $( document ).ready(function() {
        $("#insertFormBtn").click( function() {location.href = "/employee_form.jsp";} );
    });
</script>        

    </body>
</html>
