package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;
import study2.StudyInterface;

@WebServlet("/AjaxIdCheck2_1")
public class AjaxIdCheck2_1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		StudyDAO dao = new StudyDAO();
		String name = dao.getIdSearch(mid);
		
		if(name.equals("")) {
			name = "찾는 자료가 없습니다.";
		} else {
//			PrintWriter out = response.getWriter();
//			out.write(name);
			response.getWriter().write(name);
		}
	}
}
