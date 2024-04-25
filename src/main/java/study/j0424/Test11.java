package study.j0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T11")
public class Test11 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int su1 = Integer.parseInt(request.getParameter("su1")); 
		int su2 = Integer.parseInt(request.getParameter("su2")); 
		int sum = 0;
		int temp;
		if(su1 > su2) {
			temp = su1;
			su1 = su2;
			su2 = temp;
		}
		for(int i=su1; i <= su2; i++)
		{
			sum += i;
		}
		System.out.println(sum);
		PrintWriter out = response.getWriter();
		out.println("이것은 서블릿에서 보내는 것입니다~");
		out.println("<p><button onclick='location.href=\"/javaclass/study/0424/test11Ok.jsp?sum="+sum+"\"'>ㅇㅇ</button></p>");
	}
}
