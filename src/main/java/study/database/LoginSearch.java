package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlets.WebdavServlet;

@WebServlet("/database/LoginSearch")
public class LoginSearch extends WebdavServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		LoginDAO dao = new LoginDAO();
		ArrayList<LoginVO> vos = dao.getLoginSearch(name);
		
		request.setAttribute("vos", vos);
		
		request.getRequestDispatcher("/study/database/loginMain.jsp").forward(request, response);
	}
}
