package study2.mapping;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonSearhOk implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		HoewonDAO dao = new HoewonDAO();
		System.out.println(name);
		String message = "";
		ArrayList<HoewonVO> vos = null;
		vos = dao.getSearch(name);
		if(vos.size() != 0) {
			message = "회원 정보 조회가 완료 되었습니다.";
			request.setAttribute("vos", vos);
		} else {
			message = "회원 정보 조회 실패하였습니다.";
		}
		request.setAttribute("message", message);
	}

}
