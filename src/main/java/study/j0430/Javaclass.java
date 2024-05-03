package study.j0430;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Javaclass extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = getInitParameter("mid");
		String address = getInitParameter("address");
		
		System.out.println(mid);
		System.out.println(address);
		request.setAttribute("mid", mid);
		request.setAttribute("address", address);
		request.getRequestDispatcher("/study/0430_web_xml/init/login.jsp").forward(request, response);
	}
}
