package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LoginDelete")
public class LoginDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null? "" : (request.getParameter("mid"));
		HttpSession session = request.getSession();
		String sMid = session.getAttribute("sMid")+"";
		LoginDAO dao = new LoginDAO();
		dao.setLoginDelete(mid);
		
		PrintWriter out = response.getWriter();
		if(!mid.equals(sMid)) {
			out.print("<script>");
			out.print("alert('회원 삭제 처리완료.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/LoginList';");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('회원 탈퇴 처리완료.');");
			out.print("location.href='"+request.getContextPath()+"/database/Logout';");
			out.print("</script>");
		}
	}
}
