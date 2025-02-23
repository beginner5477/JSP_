package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null? "" : request.getParameter("pwd");
		System.out.println(mid);
		System.out.println(pwd);
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIdCheck(mid,pwd);
		System.out.println("vo: "+vo);
		
		vo = dao.getLoginIdCheck(mid, pwd);
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		System.out.println(vo.getMid());
		
		
		if(vo.getMid() == null) {
			out.println("<script>");
			out.println("alert('로그인 실패하였습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		} else {
			// 쿠키에 아이디를 저장/해제 처리한다.
			// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
			session.setAttribute("sMid", mid);
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			
			// 필요한 정보를 session에 저장처리한다.
			
			session.setAttribute("sMid", mid);
			
			out.println("<script>");
			out.println("alert('로그인 성공하였습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/LoginList';");
			out.println("</script>");
		}
	}
}
