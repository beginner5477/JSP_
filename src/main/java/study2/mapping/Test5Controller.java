package study2.mapping;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do5")
public class Test5Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI() == null ? "" : request.getRequestURI();
		String viewPage ="/WEB-INF/study2/mapping/";
		String comm = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		Test5Interface commInter = null;
		if(comm.equals("test5")) {
			viewPage += "test5.jsp";
		} else if(comm.equals("hoewonList")) {
			commInter = new hoewonList();
			commInter.execute(request, response);
			viewPage += "hoewonList.jsp";
		} else if(comm.equals("hoewonSearch")) {
			viewPage += "hoewonSearch.jsp";
		} else if(comm.equals("hoewonDelete")) {
			commInter = new hoewonList();
			commInter.execute(request, response);
			viewPage += "hoewonDelete.jsp";
		} else if(comm.equals("hoewonUpdate")) {
			commInter = new hoewonList();
			commInter.execute(request, response);
			viewPage += "hoewonUpdate.jsp";
		} else if(comm.equals("hoewonInsert")) {
			viewPage += "hoewonInsert.jsp";
		} else if(comm.equals("hoewonSearchOk")) {
			commInter = new HoewonSearhOk();
			commInter.execute(request, response);
			viewPage += "hoewonSearch.jsp";
		} else if(comm.equals("hoewonDeleteOk")) {
			commInter = new HoewonDeleteOk();
			commInter.execute(request, response);
			viewPage = "";
			viewPage += "/WEB-INF/common/message.jsp";
		} else if(comm.equals("hoewonInsertOk")) {
			commInter = new HoewonInsertOk();
			commInter.execute(request, response);
			viewPage = "";
			viewPage += "/WEB-INF/common/message.jsp";
		} else if(comm.equals("hoewonUpdateOk")) {
			commInter = new HoewonUpdateOk();
			commInter.execute(request, response);
			viewPage = "";
			viewPage += "/WEB-INF/common/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	

}
