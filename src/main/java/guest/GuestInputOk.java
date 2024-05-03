package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GuestInputOk")
public class GuestInputOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String guestIP = request.getParameter("guestIP") == null ? "" : request.getParameter("guestIP");
		
		GuestVO vo = new GuestVO();
		GuestDAO dao = new GuestDAO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setContent(content);
		vo.setGuestIP(guestIP);
		vo.setHomePage(homePage);
		
		int res = dao.setGuestInput(vo);
		
		PrintWriter out = response.getWriter();
		
		if(res != 0) {
			out.println("<script>");
			out.println("alert('방명록에 글이 등록되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/GuestList';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('방명록에 글 등록 실패요');");
			out.println("location.href='"+request.getContextPath()+"/GuestList';");
			out.println("</script>");
		}
	}
}
