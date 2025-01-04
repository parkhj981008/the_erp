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
  <title>인사발령 등록</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/erp/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/erp/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/erp/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/erp/images/favicon.png" />
  
  
<!-- 모달 -->
<style>

h2{
    text-align: center;
}

.modal_btn {
    display: block;
    margin: 40px auto;
    padding: 10px 20px;
    background-color: royalblue;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

.modal_btn:hover {
    box-shadow: 3px 4px 11px 0px #00000040;
}

/*모달 팝업 배경 영역 스타일링*/
.modal {
	display: none; /*평소에는 보이지 않도록*/
    position: absolute;
    top:0;
    left: 0;
    width: 100%;
    height: 100vh;
    background: rgba(0,0,0,0.5);
    overflow: hidden;
    z-index: 1000; /* 모달의 z-index 값 */
}


/* 팝업 내부 스타일 */
.modal .modal_popup {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background: #ffffff;
    border-radius: 20px;
    width: 400px; /* 모달 창의 너비 */
    height: auto; /* 내용에 따라 높이 자동 조절 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow-y: auto; /* 내용이 많을 경우 스크롤 */
    z-index: 1010;
}

.modal .modal_popup .close_btn {
    display: block;
    padding: 10px 20px;
    background-color: rgb(116, 0, 0);
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

.select_btn {
    display: block;
    padding: 10px 20px;
    background-color: rgb(116, 0, 0);
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

.modal.on {
    display: block;
}

/* 테이블 스타일 */
#resultTable {
    width: 100%;
    border-collapse: collapse; /* 테두리 겹침 제거 */
    text-align: left;
    margin-top: 10px;
}

#resultTable th, #resultTable td {
    border: 1px solid #ddd; /* 테두리 색상 */
    padding: 8px; /* 셀 간격 */
}

#resultTable th {
    background-color: #f4f4f4; /* 헤더 배경 색 */
    font-weight: bold;
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

          <%@ include file="/erp/layout/side_layout.jsp" %>
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <div class="d-flex sidebar-profile">
              <div class="sidebar-profile-image">
                <img src="../../images/faces/face29.png" alt="image">
                <span class="sidebar-status-indicator"></span>
              </div>
              <div class="sidebar-profile-name">
                <p class="sidebar-name">
                  Kenneth Osborne
                </p>
                <p class="sidebar-designation">
                  Welcome
                </p>
              </div>
            </div>
            <div class="nav-search">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Type to search..." aria-label="search" aria-describedby="search">
                <div class="input-group-append">
                  <span class="input-group-text" id="search">
                    <i class="typcn typcn-zoom"></i>
                  </span>
                </div>
              </div>
            </div>
            <p class="sidebar-menu-title">Dash menu</p>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../../index.html">
              <i class="typcn typcn-device-desktop menu-icon"></i>
              <span class="menu-title">Dashboard <span class="badge badge-primary ml-3">New</span></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="typcn typcn-briefcase menu-icon"></i>
              <span class="menu-title">UI Elements</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="../ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="../ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="typcn typcn-film menu-icon"></i>
              <span class="menu-title">Form elements</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="../forms/basic_elements.html">Basic Elements</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="typcn typcn-chart-pie-outline menu-icon"></i>
              <span class="menu-title">Charts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="typcn typcn-th-small-outline menu-icon"></i>
              <span class="menu-title">Tables</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="basic-table.html">Basic table</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="typcn typcn-compass menu-icon"></i>
              <span class="menu-title">Icons</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../icons/mdi.html">Mdi icons</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="typcn typcn-user-add-outline menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/register.html"> Register </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="typcn typcn-globe-outline menu-icon"></i>
              <span class="menu-title">Error pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../documentation/documentation.html">
              <i class="typcn typcn-document-text menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
        </ul>
        <ul class="sidebar-legend">
          <li>
            <p class="sidebar-menu-title">Category</p>
          </li>
          <li class="nav-item"><a href="#" class="nav-link">#Sales</a></li>
          <li class="nav-item"><a href="#" class="nav-link">#Marketing</a></li>
          <li class="nav-item"><a href="#" class="nav-link">#Growth</a></li>
        </ul>
      </nav>
      
      
      
      
      <!-- 테이블 내용 수정하시면 됩니다. -->
      
      <!-- partial -->
   <div class="main-panel">
   
        <div class="content-wrapper">
        
          <div class="row">
          
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
              
                <div class="card-body">
                
                  <h4 class="card-title" style="font-size: 30px;">인사발령 등록</h4>
                  
                      		<!-- 모달창 열기 버튼 -->
						    <section>
						        <button type="button" class="modal_btn">사원검색</button>
						    </section>
                      		<!-- 모달창 열기 버튼 -->
                  
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">발령일자 선택</th>
                          <th scope="col">사원 번호</th>
                          <th scope="col">이름</th>
                          <th scope="col">기존 부서</th>
                          <th scope="col">기존 직급</th>
                          <th scope="col">발령 부서</th>
                          <th scope="col">발령 직급</th>
                          <th scope="col">발령구분</th>
                          <th scope="col">적요</th>
                        </tr>
                      </thead>
                      
                      
                      <tbody id="table-tbody">
                      	<tr>
                      		<td>
                      			<input type="date" id="pa_date" name="pa_date" class="form-control">
                      		</td>
                      		
                      		<td>
    							<input type="text" class="form-control" id="user_seq" name="user_seq" readonly>
                      		</td>
                      		
                      		<td>
    							<input type="text" class="form-control" id="user_name" name="user_name" readonly>
                      		</td>
                      		
                      		<td>
                      			<input type="text" class="form-control" name="before_dept" id="before_dept" readonly>
                      		</td>
                      		
                      		<td>
                      			<input type="text" class="form-control" name="before_position" id="before_position" readonly>
                      		</td>
                      		
                      		<td>
                      			<select class="form-control form-control-lg" name="assigned_dept" id="assigned_dept">
                      				<option>인사부</option>
				                    <option>개발부</option>
									<option>회계</option>
									<option>총무</option>
									<option>공공영업1팀</option>
									<option>공공영업2팀</option>
									<option>기업영업1팀</option>
									<option>기업영업2팀</option>
			                    </select>
                      		</td>
                      	
                      		
                      		<td>
                   			  	<select class="form-control form-control-lg" name="assigned_position" id="assigned_position">
			                      <option>사원</option>
			                      <option>대리</option>
			                      <option>과장</option>
			                      <option>차장</option>
			                      <option>부장</option>
			                      <option>팀장</option>
			                      <option>대표이사</option>
			                    </select>
                      		</td>
                      		
                      		<td>
                      			<select type="text" id="assignment_type" name="assignment_type" class="form-control">
                      			  <option>부서이동</option>
			                      <option>승진</option>
                      			</select>
                      		</td>
                      		
                      		 <td>
                      			<input type="text" id="notes" name="notes" class="form-control" placeholder="설명을 입력해주세요">
                      		 </td>
						<tr>	
                      </tbody>
                    </table>
                  </div>
                </div>
	            	<button type="button" class="btn btn-primary" id="submitBtn"> 발령 등록 </button>
              </div>
            </div>
          </div>
        </div>

	      <!-- 모달 창은 일반적으로 tbody 밖에 위치 -->
		  <!--모달 팝업-->
			<div class="modal">
			    <div class="modal_popup">
			        <h4>사원 검색</h4>
			        <p>사원을 검색하여 선택해주세요</p>
			        <br>
			        <form id="searchForm"> 
			        <table>
			        	<tr>
				        	<td>
						        검색구분 : <select name="searchGubun" id="searchGubun">
											<option value="user_name">이름</option>
											<option value="user_seq">사원번호</option>
										</select>
					        </td>
					        <td>
					        	검색 : <input type="text" name="searchStr" id="searchStr">
					        </td>
					        
			        	</tr>
			        </table>
			        </form>
					

					<br>

				        <!-- 검색 결과 테이블 -->
						<table id="resultTable">
						    <thead>
						        <tr>
						            <th>사번</th>
						            <th>이름</th>
						            <th>부서</th>
						            <th>직급</th>
						            <th>선택</th>
						        </tr>
						    </thead>
						    <tbody>
						        <!-- 행들이 들어갈 곳 -->
						    </tbody>
						</table>
										
				        <br><br>

			        <button type="button" class="close_btn">닫기</button>
			        <br>
			    </div> <!-- 모달팝업 div -->
			</div> <!-- 모달 div -->
			<!-- 모달 팝업-->


                  

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
	const modal = document.querySelector('.modal');
	const modalOpen = document.querySelector('.modal_btn');
	const modalClose = document.querySelector('.close_btn');
	
	//열기 버튼을 눌렀을 때 모달팝업이 열림
	modalOpen.addEventListener('click',function(){
	  	//'on' class 추가
	    modal.classList.add('on');
	});
	
	//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
	modalClose.addEventListener('click',function(){
	    //'on' class 제거
	    modal.classList.remove('on');
	});
</script>



<script>
$(document).ready(function() {

	
    // jQuery 동적 이벤트 바인딩
    $(document).on('keyup', "#searchStr", function() {
        var str = $("#searchStr").val();
        if (str != "") {
            var formData = $("#searchForm").serialize(); // k=v&k=v
            console.log(formData);

            $.ajax({
                url : "/restSearch",
                method : 'POST',
                data : formData,
                //contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
                //dataType: "json", 	
                success : function(obj) {
                	console.log(obj);  // vo 구조 확인
                	
                	
                    // 결과 테이블의 tbody 부분 초기화
                    $("#resultTable tbody").empty();

                    // 검색 결과 추가
					var htmlStr = "";
					
					$(obj).map(function(i, vo) {
						htmlStr += "<tr>";
	                    htmlStr += "<td>" + vo.user_seq + "</td>";
	                    htmlStr += "<td>" + vo.user_name + "</td>";
	                    htmlStr += "<td>" + vo.department_name + "</td>";
	                    htmlStr += "<td>" + vo.position + "</td>";
	                    htmlStr += "<td><button class='select_btn' data-user_seq='" + vo.user_seq + 
	                               "' data-user_name='" + vo.user_name + 
	                               "' data-department_name='" + vo.department_name + 
	                               "' data-position='" + vo.position + "'>선택</button></td>";
	                    htmlStr += "</tr>";
					});

					$("#resultTable tbody").html(htmlStr);

                },
                error : function(err) {
                    console.log("에러:" + err);
                }
            });
        }
    });
    
    
 	// "선택" 버튼 클릭 시 동작
    $(document).on('click', '.select_btn', function() {
        const user_seq 			= $(this).data('user_seq');
        const user_name 		= $(this).data('user_name');
        const department_name 	= $(this).data('department_name');
        const position 			= $(this).data('position');

        // 이전 페이지의 입력 필드에 값 채우기
        $('#user_seq').val(user_seq);
        $('#user_name').val(user_name);
        $('#before_dept').val(department_name);
        $('#before_position').val(position);

        // 모달 창 닫기
        $('.modal').removeClass('on');
    });

});
</script>













</body>

</html>
