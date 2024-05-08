package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonUpdateOk implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fieldName = request.getParameter("fieldName")==null? "" : request.getParameter("fieldName");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		HoewonDAO dao = new HoewonDAO();
		int res = 0;
		String message = "";
		if(fieldName.equals("idx")) {
			message = "idx는 수정 불가능 필드입니다.";
			request.setAttribute("message", message);
			request.setAttribute("url", "hoewonUpdate.do5");
			return;
		}
		res = dao.setUpdate(mid,fieldName,content);
		if(res != 0) {
			message = "회원 수정이 완료 되었습니다.";
		} else {
			message = "회원 수정 실패하였습니다.";
		}
		request.setAttribute("url", "hoewonUpdate.do5");
		request.setAttribute("message", message);
	}

}
