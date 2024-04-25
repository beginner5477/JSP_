package study.j0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Prac1")
public class Prac extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		System.out.println(name);
		int age = Integer.parseInt(request.getParameter("age"));
		String password = request.getParameter("password");
		String hobby = request.getParameter("hobby");
		
		PrintWriter out = response.getWriter();
		out.println("성명:"+name+" 나이:"+age+" 비밀번호:"+password+" 취미:"+hobby+"");
		out.println("<p><a href='/javaclass/study/0424/PracOk.jsp?name="+name+"&age="+age+"&password="+password+"&hobby="+hobby+"'>하이용~</a></p>");
	}
}
