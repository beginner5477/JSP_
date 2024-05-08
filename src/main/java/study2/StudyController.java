package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.ajax.AjaxIdCheck1;
import study2.ajax.AjaxIdCheck2;

@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1,com.lastIndexOf("."));
		
		if(com.equals("test1")) {
			viewPage += "/ajax/test1.jsp";
		} else if(com.equals("test2")) {
			viewPage += "/ajax/test2.jsp";
		} else if(com.equals("ajaxIdCheck1")) {
			command = new AjaxIdCheck1();
			command.execute(request, response);
//			viewPage += "/ajax/test1.jsp";
			viewPage = "WEB-INF/common/message.jsp";
			return;
		} else if(com.equals("hoewonInput")) {
			command = new HoewonInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
			return;
		} else if(com.equals("ajaxIdCheck2")) {
			command = new AjaxIdCheck2();
			command.execute(request, response);
			viewPage += "/ajax/test1.jsp";
			return;
		} else if(com.equals("test3")) {
			command = new HoewonMainCommand();
			command.execute(request, response);
			viewPage += "/ajax/hoewonMain.jsp";
		} else if(com.equals("hoewonSearch")) {
			command = new HoewonSearchCommand();
			command.execute(request, response);
			viewPage += "/ajax/hoewonMain.jsp";
			return;
		}
		
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
