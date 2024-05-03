package study.j0429;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/study/j0429/jstl3Ok")
public class Jstl3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		MemberVO vo = null;
		vo = new MemberVO();
		vo.setName("바알벨제붑");
		vo.setAge(999);
		vo.setGender("남자");
		vo.setAddress("HELL");
		vo.setJob("HELL Lord");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("미카엘");
		vo.setAge(999);
		vo.setGender("남자");
		vo.setAddress("HEAVEN");
		vo.setJob("Ark Angel");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("김도완");
		vo.setAge(30);
		vo.setGender("남자");
		vo.setAddress("청주");
		vo.setJob("프로그래머 지원생");
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		request.setAttribute("cnt", vos.size());
		
		String viewPage = "/study/0429_JSTL/jstl3Res.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, respond);
		
	}
}
