package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;
import study2.StudyInterface;

public class AjaxIdCheck1 implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		request.setAttribute("mid", mid);
		StudyDAO dao = new StudyDAO();
		String name = dao.getIdSearch(mid);
		
		if(!name.equals("")) {
			request.setAttribute("name", name);
			request.setAttribute("message", "전송된 아이디:"+mid);
			request.setAttribute("url", "test1.st?name="+name+"&mid="+mid);
		} else {
			request.setAttribute("message", "검색된 ID가 없습니다.");
			request.setAttribute("url", "test1.st");
		}
	}

}
