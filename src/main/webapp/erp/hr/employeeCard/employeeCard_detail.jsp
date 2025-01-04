<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>인사카드 상세</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/erp/images/favicon.png" />
  
  <style>
    table th:first-child, 
    table td:first-child {
        width: 150px; /* 원하는 고정 너비 */
    }
</style>

</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    
      <%@ include file="/erp/layout/top_layout.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
           <%@ include file="/erp/layout/side_layout.jsp" %>
      
      
      
      <!-- 테이블 내용 수정하시면 됩니다. -->
      
      <!-- partial -->
   <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
          
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title" style="font-size: 30px;">인사카드</h4>
                  <div class="table-responsive">
                    
            
            		<div style="display: flex; flex-wrap: wrap; justify-content: space-between; margin-bottom: 20px;">
    <div style="flex: 1; margin-right: 10px;">
        <div style="font-size: 1.2em; color: #333; font-weight: bold; margin-bottom: 10px;">기본 정보</div>
        <table style="width: 100%; border-collapse: collapse; border: 1px solid #dce2e3; background-color: #e3f2fd;">
            <tr>
                
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">사원번호</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.user_seq}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">이름</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.user_name}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">생년월일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.birth}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">성별</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">
                    <c:choose>
                        <c:when test="${MY_KEY_HVO.gender == 0}">남자</c:when>
                        <c:when test="${MY_KEY_HVO.gender == 1}">여자</c:when>
                    </c:choose>
                </td>
            </tr>
        </table>
    </div>
    <div style="flex: 1; margin-left: 10px;">
        <div style="font-size: 1.2em; color: #333; font-weight: bold; margin-bottom: 10px;">연락 정보</div>
        <table style="width: 100%; border-collapse: collapse; border: 1px solid #dce2e3; background-color: #e3f2fd;">
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">이메일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.email}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">주소</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.address}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">모바일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.phone_number}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">내선번호</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.extension_number}</td>
            </tr>
        </table>
    </div>
</div>

<div style="display: flex; flex-wrap: wrap; justify-content: space-between; margin-bottom: 20px;">
    <div style="flex: 1; margin-right: 10px;">
        <div style="font-size: 1.2em; color: #333; font-weight: bold; margin-bottom: 10px;">부서 정보</div>
        <table style="width: 100%; border-collapse: collapse; border: 1px solid #dce2e3; background-color: #e3f2fd;">
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">부서번호</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.department_id}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">부서명</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.department_name}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">직급</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.position}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">매니저번호</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.manager_id}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">입사일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.hire_date}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">퇴사일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.termination_date}</td>
            </tr>
        </table>
    </div>
    <div style="flex: 1; margin-left: 10px;">
        <div style="font-size: 1.2em; color: #333; font-weight: bold; margin-bottom: 10px;">계정 정보</div>
        <table style="width: 100%; border-collapse: collapse; border: 1px solid #dce2e3; background-color: #e3f2fd;">
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">계정 상태</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">
                    <c:choose>
                        <c:when test="${MY_KEY_HVO.user_status == 0}">활성</c:when>
                        <c:when test="${MY_KEY_HVO.user_status == 1}">비활성</c:when>
                        <c:when test="${MY_KEY_HVO.user_status == 2}">정지된 계정</c:when>
                        <c:when test="${MY_KEY_HVO.user_status == 3}">삭제된 계정</c:when>
                        <c:when test="${MY_KEY_HVO.user_status == 4}">휴먼 계정</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">계정 아이디</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.user_id}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">비밀번호</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;"></td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">등록일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.register_date}</td>
            </tr>
            <tr>
                <th style="text-align: center; padding: 8px; background-color: #bbdefb; border: 1px solid #dce2e3;">수정일</th>
                <td style="padding: 8px; border: 1px solid #dce2e3;">${MY_KEY_HVO.modify_date}</td>
            </tr>
        </table>
    </div>
</div>
            		


            

				
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        
      <button type="button" class="btn btn-primary" id="listBtn"> 목록 </button>
      
      
        <%@ include file="/erp/layout/footer_layout.jsp" %>
      
        <!-- partial -->
      </div>
      <!-- 테이블 내용 수정 end -->
      
      
      
      
      
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="/erp/vendors/js/vendor.bundle.base.js"></script>
  
  <script src="/erp/js/off-canvas.js"></script>
  <script src="/erp/js/hoverable-collapse.js"></script>
  <script src="/erp/js/template.js"></script>
  <script src="/erp/js/settings.js"></script>
  <script src="/erp/js/todolist.js"></script>



<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$( document ).ready(function() {
	$("#listBtn").click( function() {
		location.href = "/employeeCardServlet"
	});
});
</script>






</body>

</html>
