package study2.mapping;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class hoewonList implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HoewonDAO dao = new HoewonDAO();
		ArrayList<HoewonVO> vos = new ArrayList<HoewonVO>();
		String message = "";
		vos = dao.getList();
		if(vos.get(0).getMid() != null) {
			message = "회원 정보 조회가 완료 되었습니다.";
		} else {
			message = "회원 정보 조회 실패하였습니다.";
		}
		request.setAttribute("message", message);
		request.setAttribute("vos", vos);
	}

}
