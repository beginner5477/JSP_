package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

@WebServlet("/AjaxIdCheck2_2")
public class AjaxIdCheck2_2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		LoginVO vo = dao.getLoginIdSearch(mid);
		String str = "";
		if(vo.getName() == null) {
			str = "찾는 자료가 없습니다.";
		} else {
			str = vo.getMid()+"/"+vo.getName()+"/"+vo.getAge()+"/"+vo.getGender()+"/"+vo.getAddress();
			response.getWriter().write(str);
		}
	}
}
