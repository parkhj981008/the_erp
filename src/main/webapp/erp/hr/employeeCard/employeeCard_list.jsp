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
  <title>인사카드 조회</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/erp/images/favicon.png" />
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
                  <h4 class="card-title" style="font-size: 30px;">인사카드 조회</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col"><input type="checkbox" name="allCheck" id="allCheck"/></th>
                          <th scope="col">사원번호</th>
                          <th scope="col">성명</th>
                          <th scope="col">아이디</th>
                          <th scope="col">생년월일</th>
                          <th scope="col">성별</th>
                          <th scope="col">부서번호</th>
                          <th scope="col">부서명</th>
                          <th scope="col">직위/직급</th>
                          <th scope="col">이메일</th>
                          <th scope="col">내선번호</th>
                          <th scope="col">모바일</th>
                          <th scope="col">계정상태</th>
                        </tr>
                      </thead>
                      <tbody id="table-tbody">
                      
                      	<c:forEach var="hvo" items="${MY_KEY_ELIST}">
                        <tr>
                          <td><input type="checkbox" name="RowCheck" value="${hvo.user_seq}"/></td>
                          <td>${hvo.user_seq}</td>
                          
                          <td>
                          <a href="/employeeCardServlet?user_seq=${hvo.user_seq}&pageGubun=T001">${hvo.user_name}</a>
                          </td>
                          
                          <td>${hvo.user_id}</td>
                          <td>${hvo.birth}</td>
                          <td>
						    <c:choose>
						        <c:when test="${hvo.gender == 0}">남자</c:when>
						        <c:when test="${hvo.gender == 1}">여자</c:when>
						    </c:choose>
						  </td>
                          <td>${hvo.department_id}</td>
                          <td>${hvo.department_name}</td>
                          <td>${hvo.position}</td>
                          <td>${hvo.email}</td>
                          <td>${hvo.extension_number}</td>
                          <td>${hvo.phone_number}</td>
                          <td>
						    <c:choose>
						        <c:when test="${hvo.user_status == 0}">활성</c:when>
						        <c:when test="${hvo.user_status == 1}">비활성</c:when>
						        <c:when test="${hvo.user_status == 2}">정지된 계정</c:when>
						        <c:when test="${hvo.user_status == 3}">삭제된 계정</c:when>
						        <c:when test="${hvo.user_status == 4}">휴먼 계정</c:when>
						        <c:otherwise></c:otherwise>
						    </c:choose>
						  </td>
                        </tr>
                       
                        </c:forEach>
                      </tbody>
                    </table>

					<br>
					<span style="font-size: 20px;">${MY_KEY_PAGING_HTML}</span>
					<br><br><br><br>
                    
                  </div>
                  <button type="button" class="btn btn-primary" id="insertFormBtn"> 신규 등록 </button>
                  <input  type="button" class="btn btn-primary" value="계정 비활성화" onclick="statusInactive()">
				  <input  type="button" class="btn btn-primary" value="계정 활성화"  onclick="statusActive()">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
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
        $("#insertFormBtn").click( function() {
        	location.href = "/erp/hr/employeeCard/employeeCard_form.jsp";} );
    });
</script>


<script type="text/javascript">
	$(function() {
        var chkObj = $("input[name='RowCheck']");
        var rowCnt = chkObj.length;
        
        // 전체 선택 버튼
        $("input[name='allCheck']").on("click", function() {
            var isChecked = $(this).prop("checked");
            chkObj.prop("checked", isChecked);  // 전체 체크박스를 상태에 맞게 변경
        });

        // 개별 선택 버튼
        $("input[name='RowCheck']").on("click", function() {
            var allChecked = chkObj.length === $("input[name='RowCheck']:checked").length;
            $("input[name='allCheck']").prop("checked", allChecked);  // 전체 선택 체크박스 상태 변경
        });
	});
</script>


<script type="text/javascript">
    // 계정 비활성화 메서드
    function statusInactive() {
        var url = "/employeeCardServlet"; // 서버 URL
        var valueArr = [];
        $("input[name='RowCheck']:checked").each(function() {
            valueArr.push($(this).val());
        });

        if (valueArr.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        var chk = confirm("선택한 회원을 비활성화 하시겠습니까?");
        if (chk) {
            $.ajax({
                url : url ,
                type : "POST" ,
                traditional : true , // 배열 전송 방식 설정
                data : { 
                    valueArr: valueArr ,
                    pageGubun: "U001"
                },
                //dataType : "json", // 서버에서 JSON을 반환할 것으로 예상
                success: function(response) {
                	// 서버 응답 데이터 확인
                    console.log("서버 응답 데이터: ", response);
                	
                    // 응답의 status 값 확인
 					if (response.status === 1) {
                        alert("회원이 비활성화 되었습니다.");
                        location.replace("/employeeCardServlet");	//GET방식
                    
 					} else if (response.status === 0) {
                        alert("정상적으로 처리되지 않았습니다.");
                        
                    } else {
                        alert("알 수 없는 오류가 발생했습니다.");
                    }
                },
                error: function(err) {
                    console.error("에러:", err);
                }
            });
        }
    }
</script>





<script type="text/javascript">
    // 계정 활성화 메서드
    function statusActive() {
        var url = "/employeeCardServlet"; // 서버 URL
        var valueArr = [];
        $("input[name='RowCheck']:checked").each(function() {
            valueArr.push($(this).val());
        });

        if (valueArr.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        var chk = confirm("선택한 회원을 활성화 하시겠습니까?");
        if (chk) {
            $.ajax({
                url : url ,
                type : "POST" ,
                traditional : true , // 배열 전송 방식 설정
                data : { 
                    valueArr: valueArr ,
                    pageGubun: "U000"
                },
                //dataType : "json", // 서버에서 JSON을 반환할 것으로 예상
                success: function(response) {
                	// 서버 응답 데이터 확인
                    console.log("서버 응답 데이터: ", response);
                	
                    // 응답의 status 값 확인
 					if (response.status === 1) {
                        alert("회원이 활성화 되었습니다.");
                        location.replace("/employeeCardServlet");	//GET방식
                    
 					} else if (response.status === 0) {
                        alert("정상적으로 처리되지 않았습니다.");
                        
                    } else {
                        alert("알 수 없는 오류가 발생했습니다.");
                    }
                },
                error: function(err) {
                    console.error("에러:", err);
                }
            });
        }
    }
</script>






</body>

</html>
