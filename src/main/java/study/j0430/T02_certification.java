package study.j0430;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j0430/T02_certification")
public class T02_certification extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aCertification = request.getParameter("u")==null ? "" : request.getParameter("u");
		
		ServletContext application = request.getServletContext();
		
		//기존에 애플리케이션 저장소에 저장된 키를 출력해보자
		System.out.println("기존에 저장된 인증키: "+application.getAttribute("aCertification"));
		//새로 발급받은 인증번호를 애플리케이션 저장소에 저장 시켜준다
		application.setAttribute("aCertification",aCertification);
		System.out.println("새로 발급된 인증키: "+application.getAttribute("aCertification"));
		
		request.setAttribute("message", "인증코드가 발급되엇습니다.");
		
		String viewPage = "/study/0430_web_xml/filter/t2_certification.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
