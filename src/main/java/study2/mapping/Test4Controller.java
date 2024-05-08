package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do4")
public class Test4Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test4Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println(com);
		if(com.equals("Test4")) {
			viewPage += "test4.jsp";
		} else if(com.equals("List")) {
			command = new Test4ListCommand();
			command.execute(request, response);
			viewPage += "List.jsp";
		} else if(com.equals("Input")) {
			viewPage += "Input.jsp";
		} else if(com.equals("Update")) {
			command = new Test4UpdateCommand();
			command.execute(request, response);
			viewPage += "Update.jsp";
		} else if(com.equals("Delete")) {
			command = new Test4DeleteCommand();
			command.execute(request, response);
			viewPage += "Delete.jsp";
		} else if(com.equals("Search")) {
			command = new Test4SearchCommand();
			command.execute(request, response);
			viewPage += "Search.jsp";
		} else if(com.equals("InputOk")) {
			command = new Test4InputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
