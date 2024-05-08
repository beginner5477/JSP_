package study2.mapping;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonInsertOk implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		int age = request.getParameter("age")==null? 0 : Integer.parseInt(request.getParameter("age")) ;
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String address = request.getParameter("address")==null? "" : request.getParameter("address");
		HoewonDAO dao = new HoewonDAO();
		HoewonVO vo = new HoewonVO();
		vo.setName(name);
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		int res = 0;
		String message = "";
		res = dao.setInsert(vo);
		if(res != 0) {
			message = name+"회원 입력이 완료 되었습니다.";
		} else {
			message = name+"회원 입력 실패하였습니다.";
		}
		request.setAttribute("url", "hoewonInsert.do5");
		request.setAttribute("message", message);
	}

}
