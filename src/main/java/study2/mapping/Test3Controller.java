package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do3")
public class Test3Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 *.do3입니다.");
		int su1 =  request.getParameter("su1") ==null ? 0: Integer.parseInt( request.getParameter("su1"));
		int su2 =  request.getParameter("su2") ==null ? 0: Integer.parseInt( request.getParameter("su2"));
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		
//		System.out.println("url" + url);	//url은 모두 표시하는 경로명
		System.out.println("uri" + uri);	//uri는 식별자의 의미로 내가 속한 경로명은 제외하고 간략하게 나온다
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		System.out.println(com);
		
		if(com.equals("List")) {
			System.out.println("여기는 List입니다");
		} else if(com.equals("Input")) {
			System.out.println("여기는 Input입니다");
		} else if(com.equals("Update")) {
			System.out.println("여기는 Update");
		} else if(com.equals("Delete")) {
			System.out.println("여기는 Delete입니다");
		} else if(com.equals("Search")) {
			System.out.println("여기는 Search입니다");
		} else if(com.equals("hap")) {
			request.setAttribute("hap", su1 + su2);
		} else if(com.equals("cha")) {
			request.setAttribute("cha", su1 - su2);
		} else if(com.equals("gop")) {
			request.setAttribute("gop", su1 * su2);
		} else if(com.equals("mok")) {
			request.setAttribute("mok", su1 / su2);
		}
		String viewPage = "/WEB-INF/study2/mapping/test3.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
