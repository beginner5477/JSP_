package study2.mapping;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonDeleteOk implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		HoewonDAO dao = new HoewonDAO();
		System.out.println(name);
		int res = 0;
		String message = "";
		ArrayList<HoewonVO> vos = null;
		res = dao.setDelete(name);
		if(res != 0) {
			message = name+"회원 삭제 완료 되었습니다.";
		} else {
			message = name+"회원 삭제 실패하였습니다.";
		}
		request.setAttribute("url", "hoewonDelete.do5");
		request.setAttribute("message", message);
	}


}
