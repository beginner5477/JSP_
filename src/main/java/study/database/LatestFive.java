package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LatestFive")
public class LatestFive extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		HttpSession session = request.getSession();
		request.setAttribute("firstCk", 1);
		ArrayList<LoginVO> vos = dao.latestFive();
		request.setAttribute("vos", vos);
		request.getRequestDispatcher("/").forward(request, response);
	}
}
