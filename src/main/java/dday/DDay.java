package dday;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DDay")
public class DDay extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate date = LocalDate.now();
		System.out.println(date.getYear());
		String now = date.toString();
		System.out.println(now);
		String DDay = "2024-05-10";
		String YYYY = now.substring(0,4);
		String MM = now.substring(5,7);
		String DD = now.substring(8);
		
	}

}
