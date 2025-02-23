package study.j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/j0430/T01Ok2")
public class T01Ok2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String introduce = request.getParameter("introduce") == null ? "" : request.getParameter("introduce");
		System.out.println("이곳은 /j0430/T01Ok2서블릿입니다.");
		System.out.println("content: "+content);
		System.out.println("introduce: "+introduce);
		
		PrintWriter out = response.getWriter();
		
		request.setAttribute("msg", "T01Ok2에서 보냅니당~~");
		request.setAttribute("content", content);
		request.setAttribute("introduce", introduce);
		String viewPage = "/study/0430_web_xml/filter/t1_filterRes.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
}
