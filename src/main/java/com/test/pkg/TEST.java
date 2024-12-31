package com.test.pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 아래의 @어노테이션은 이 서블릿을 특정 URL에 매핑합니다. 클라이언트가 /TEST URL로 요청을 보낼 때, 이 서블릿이 요청을 처리합니다.

@WebServlet("/TEST")		//URL 매핑이 동일하더라도, 요청 방식(GET, POST)에 따라 호출되는 메소드가 doGet()이냐 ~, doPost()이냐 ~ 차이일뿐

						  //HttpServlet은 Servlet API에서 제공하는 추상 클래스이다. HTTP 요청/응답을 처리하기 위한 메소드를 제공한다.
public class TEST extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TEST() {
        super();
    }

    //요청과 응답은 항상 페어하게 들어온다. (다른사람한테 잘못응답할일 없음)				//아래 예외를 던지면 이 doGet()을 호출한놈인 서블릿 컨테이너(Tomcat)가 이러한 예외를 처리.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HTTP GET 요청을 처리하는 메소드
		// HttpServletRequest : 클라이언트로부터 받은 요청 정보를 포함하는 객체입니다. 예: 요청 URL, 파라미터, 헤더 정보 등.
		// HttpServletResponse: 서버가 클라이언트에 응답할 정보를 포함하는 객체입니다. 예: 응답 내용, 상태 코드, 헤더 등이 설정됨.
		
		//만약에 보드게시판 목록 요청을 한다고 치면
		//List list = board.boardList();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//response.getWriter() 		: 응답 객체에 텍스트 데이터를 작성할 때 사용.
		//request.getContextPath()  : 애플리케이션의 컨텍스트 경로를 반환.
	}

																	//아래 예외를 던지면 이 doPost()을 호출한놈인 서블릿 컨테이너(Tomcat)가 이러한 예외를 처리.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HTTP POST 요청을 처리하는 메소드
		//POST 요청은 데이터를 서버로 전송할 때 주로 사용됩니다. 예: 사용자 로그인, 파일 업로드 등.
		doGet(request, response);
	}

}
