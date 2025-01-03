<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from demo.bootstrapdash.com/celestial-free/template/pages/samples/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 30 Dec 2024 08:36:56 GMT -->
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>인사카드 등록</title>
  <!-- base:css -->
  <link rel="stylesheet" href="../../vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-8 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              
              	<h4 style="font-size: 36px;">회원가입</h4><br>
				<h6 class="font-weight-light" style="font-size: 20px;">
				    Welcome, new member! <br><br>
				    Please provide your details to complete registration.
				</h6>
				
				<!---------- 회원가입 표 ---------->

                <!-- 개인정보 -->
                <br><br>
                <h5 class="mb-4" style="font-size: 20px;">개인정보</h5>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-lg" id="user_name" placeholder="이름">
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <select class="form-control form-control-lg" id="gender">
                        <option value="남성">남성</option>
                        <option value="여성">여성</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-lg" id="user_id" placeholder="아이디">
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="password" class="form-control form-control-lg" id="user_password" placeholder="비밀번호">
                    </div>
                  </div>
                </div>

               <div class="row">
                 <div class="col-md-6">
                   <div class="form-group">
                     <input type="date" class="form-control form-control-lg" id="birth" placeholder="생년월일">
                   </div>
                 </div>
                  
                 <div class="col-md-6">
                   <div class="form-group">
                     <input type="text" class="form-control form-control-lg" id="phone_number" placeholder="휴대전화번호">
                   </div>
                 </div>
               </div>
               
               
                 <div class="col-md-6">
                   <div class="form-group">
                     <input type="text" class="form-control form-control-lg" id="address" placeholder="주소">
                   </div>
                 </div>

                <!-- 회사정보 -->
				<br>
                <h5 class="mb-4" style="font-size: 20px;">회사정보</h5>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      입사일 <input type="date" class="form-control form-control-lg" id="hire_date" placeholder="입사일">
                    </div>
                  </div>
                  
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      부서 선택 <input type="number" class="form-control form-control-lg" id="department_id" placeholder="부서 번호(ID)">
                    </div>
                  </div>
                </div>


                직급 선택
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <select class="form-control form-control-lg" id="position">
                        <option>사원</option>
                        <option>대리</option>
                        <option>과장</option>
                        <option>차장</option>
                        <option>부장</option>
                        <option>팀장</option>
                        <option>대표이사</option>
                      </select>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                  매니저 선택
                    <div class="form-group">
                      <input type="number" class="form-control form-control-lg" id="manager_id" placeholder="매니저 번호(ID)">
                    </div>
                  </div>
                </div>
                
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-lg" id="email" placeholder="이메일">
                    </div>
                  </div>
                </div>

                

                <div class="row">
                  <div class="col-md-12">
                    <div class="mb-4">
                      <div class="form-check">
           
           
           
	           	  <!-- 현재 날짜와 시간을 위한 hidden input 필드 -->
			    <input type="hidden" id="register_date" name="register_date">
			    <input type="hidden" id="modify_date"   name="modify_date">
				<input type="hidden" id="user_status"   name="user_status">
				<input type="hidden" id="pageGubun" 	name="pageGubun">
            
            <!---------- 회원가입 표 ---------->
                      
                      
                        <label class="form-check-label text-muted">
                          <input type="checkbox" class="form-check-input">
                          [필수] 인증 약관 전체동의
                        </label>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="mt-3">
                  <button type="button" onclick="submit()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">회원가입</button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                 이미 회원가입을 하셨나요? <a href="login.html" class="text-primary"> 로그인하러가기 </a>
                </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- base:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->


  

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
    window.onload = function() {
        // 현재 날짜와 시간을 가져오기
		var currentDate = new Date();
		
        // 숫자가 10미만일 때는 앞에 0덧붙이기 (예를 들어 5월 => 05월)
		function padWithZero(num) {
		    return num < 10 ? '0' + num : num;
		}
		
        // 날짜형식 지정
		var formattedDateTime = 
		    currentDate.getFullYear() + '-' + 
		    padWithZero(currentDate.getMonth() + 1) + '-' + 
		    padWithZero(currentDate.getDate()) + ' ' + 
		    padWithZero(currentDate.getHours()) + ':' + 
		    padWithZero(currentDate.getMinutes()) + ':' + 
		    padWithZero(currentDate.getSeconds());

        // 정한 형식대로 날짜를 셋팅
        document.getElementById("register_date").value = formattedDateTime;
        document.getElementById("modify_date").value = formattedDateTime;

        // user_status값 숫자 0(활성)으로 설정
        document.getElementById("user_status").value = 0;
    };
    
    
    // AJAX 요청으로 데이터를 전송
    function submit() {
    	console.log("submit이 호출됨");
    	
        // 날짜를 받아오고 " 00:00:00"을 추가하여 처리
        var hireDate  = document.getElementById("hire_date").value;  // 입사일 입력 필드에서 날짜 값 가져오기
        var birthDate = document.getElementById("birth").value;  	 // 생일 입력 필드에서 날짜 값 가져오기

        // 날짜 값이 비어 있지 않으면 " 00:00:00" 추가
        var formattedHireDate  = hireDate ?  hireDate  + " 00:00:00" : "";
        var formattedBirthDate = birthDate ? birthDate + " 00:00:00" : "";
	    
		
        // AJAX 요청을 사용하여 JSON 데이터 전송
        $.ajax({
            url  : '/employeeCardServlet' , 		// 서블릿 URL
            type : 'POST' ,
            traditional : true , 					// 배열 전송 방식 설정
            data : { 
            	user_id           : document.getElementById("user_id").value,
    		    user_password     : document.getElementById("user_password").value,
    		    email             : document.getElementById("email").value,
    		    address           : document.getElementById("address").value,
    		    phone_number      : document.getElementById("phone_number").value,
    		    hire_date         : formattedHireDate,
    		    user_name         : document.getElementById("user_name").value,
    		    department_id     : document.getElementById("department_id").value,
    		    gender            : document.getElementById("gender").value,
    		    birth             : formattedBirthDate,
    		    position          : document.getElementById("position").value,
    		    manager_id        : document.getElementById("manager_id").value,
    		    register_date     : document.getElementById("register_date").value,
    		    modify_date       : document.getElementById("modify_date").value,
    		    user_status       : document.getElementById("user_status").value,
                pageGubun: "I001" // 페이지 구분자
            },
            
          //contentType : "application/json; charset=UTF-8" , 	 // JSON 형식으로 데이터 전송
		  //dataType : "json", 						// 서버에서 JSON을 반환할 것으로 예상
            
            beforeSend: function() {				// 요청 직전 할일
		        console.log('이제 AJAX 요청이 전송됩니다.');
		    },
		    
            success: function(response) {
            	// 서버 응답 데이터 확인
                console.log("서버 응답 데이터: ", response);
            	
                // 응답의 status 값 확인
					if (response.status === 1) {
                    alert("회원가입이 완료되었습니다.");
                    location.replace("/employeeCardServlet");	//GET방식
                
					} else if (response.status === 0) {
                    alert("회원가입이 정상적으로 이루어지지 않았습니다.");
                    
                } else {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            },
            error: function(err) {
            	console.log("에러:" + err)
            }
        });
    }
</script>


  
  
  
</body>



<!-- Mirrored from demo.bootstrapdash.com/celestial-free/template/pages/samples/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 30 Dec 2024 08:36:56 GMT -->
</html>
