package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GuestList")
public class GuestList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		//1. 현재 페이지 번호를 구해온다
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		//2. 한 페이지에 표시할 분량을 구한다
		int pageSize = request.getParameter("pageSize") == null? 5 :  Integer.parseInt(request.getParameter("pageSize"));
		
		//3.총 분량을 구한다 SQL문중에 count() 함수를 쓴다.
		int totRecCnt = dao.getTotRecCnt();
		
		//4. 총 페이지 건수를 구한다
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		
		//5. 현재 페이지에서 출력할 시작 인덱스 번호를 구해보장
		int startIndexNo = (pag - 1) *pageSize;
		
		//6. 현재 화면에 표시될 시작 번호를 구하자
		int curScrStartNo = totRecCnt - (pag - 1)*(pageSize);
		
		
		//블록 페이징 처리하기 (시작블록을 0으로 해보자)
		//1.블록의 크기를 결정하자 (이번엔 3개로 처리)
		int blockSize = 3;
		
		//2.현재 페이지가 속할 블록 번호를 구한다 
		int curBlock = (pag - 1) / blockSize;
		
		//3.라스트 블록을 구한다
		int lastBlock = (totPage - 1) / blockSize;
		
		
		
		
		//한페이지에 표시할 건수만 DAO가서 가져온다
		
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		vos = dao.getGuestList(startIndexNo,pageSize);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("vos", vos);
		
		request.getRequestDispatcher("/guest/guestList.jsp").forward(request, response);
		
	}
}
