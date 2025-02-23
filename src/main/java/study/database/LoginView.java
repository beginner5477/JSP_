package study.database;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/database/LoginView")
public class LoginView extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdxSearch(idx);
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("/study/database/view.jsp").forward(request, response);
	}
}
