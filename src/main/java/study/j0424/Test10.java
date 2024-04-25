package study.j0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T10")
public class Test10 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		int su = Integer.parseInt(request.getParameter("su")); 
		int sum = 0;
		for(int i=1; i <= 100; i++)
		{
			sum += i;
		}
		System.out.println(sum);
		PrintWriter out = response.getWriter();
		out.println("이것은 서블릿에서 보내는 것입니다~");
		out.println("<p><button onclick='location.href=\"/javaclass/study/0424/test10Ok.jsp?sum="+sum+"\"'>ㅇㅇ</button></p>");
	}
}
