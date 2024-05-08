package dday;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DDay")
public class DDay extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String targ = request.getParameter("date");
		System.out.println(targ);
		LocalDate date = LocalDate.now();
		if(targ != null) {
			LocalDate targetDate = LocalDate.of(Integer.parseInt(targ.substring(0, 4)) , Integer.parseInt(targ.substring(5, 7)), Integer.parseInt(targ.substring(8)));
			
			HttpSession session = request.getSession();
			System.out.println(date.until(targetDate,ChronoUnit.DAYS));
			session.setAttribute("DDay", date.until(targetDate,ChronoUnit.DAYS));
			
		}
		request.getRequestDispatcher("/").forward(request, response);
	}

}
