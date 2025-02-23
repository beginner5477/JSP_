package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/database/UpdateOk")
public class UpdateOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid") == null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null? "" : request.getParameter("name");
		int age = request.getParameter("age") == null? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender") == null? "" : request.getParameter("gender");
		String address = request.getParameter("address") == null? "" : request.getParameter("address");
		LoginDAO dao = new LoginDAO();
		LoginVO vo = new LoginVO();
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		int res = dao.setLoginUpdate(vo);
		
		PrintWriter out = response.getWriter();
		if(res != 0) {
			out.print("<script>");
			out.print("alert('회원정보가 수정되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/LoginView?idx="+idx+"';");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('회원가입 실패 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/LoginView?idx="+idx+"';");
			out.print("</script>");
		}
	}
}
