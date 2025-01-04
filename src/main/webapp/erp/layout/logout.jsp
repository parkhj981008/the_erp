<%
    String loginPage2 = "/erp/pages/auth/Login.jsp";

    // 세션 무효화
    session.invalidate();
    
    // 쿠키 삭제
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("JSESSIONID") || 
                cookie.getName().equals("auth")) {
                cookie.setValue("");
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
    }
    
    // 로그인 페이지로 리다이렉션
    response.sendRedirect(request.getContextPath() + loginPage2);
%>
