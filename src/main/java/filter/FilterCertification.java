package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//@WebFilter("/*")	/*거쳐갈 경로명 지정해주기 */
public class FilterCertification implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("1. 필터 수행 전~");
		
		String admin = request.getParameter("admin") == null ? "" : request.getParameter("admin");
		String u = request.getParameter("u") == null ? "" : request.getParameter("u");
		System.out.println(admin+"/"+u);
		
		PrintWriter out = response.getWriter();
		
		//필터 내에서는 session 객체 사용 불가임 
//		HttpSession session = request.gets;;;
		ServletContext application = request.getServletContext();
		String aCertification = application.getAttribute("aCertification") == null? "" : (String)application.getAttribute("aCertification");
		
		//주소창에 쿼리 스트링 admin=admin으로 들어왔을 때만 통과시키도록 해보자
		if(!admin.equals("admin")) {
			//일반 유저이면서 인증코드가 없다면, 발급 대기 메세지를 띄우고 돌려보내자
			if(aCertification.equals("")) {
				out.println("<script>");
				out.println("alert('아직 인증코드가 발급되지 \\n 않았습니다.');");
				out.println("history.back();");		/* 뒤로 돌려보내기 명령어 백 뒤에 숫자 넣어주면 그 수만큼 뒤로 간다. */
				out.println("</script>");
				return;
			}
			//일반유저가 인증코드 존재시에 들어오는곳
			String aUserCertification = application.getAttribute("aCertification") == null ? "" : (String) application.getAttribute("aCertification");
			if(!aUserCertification.equals(aCertification)) {
				if(!u.equals(aCertification)) {
					out.println("<script>");
					out.println("alert('인증 코드를 확인하쇼');");
					out.println("history.back();");
					out.println("</script>");
					return;
				} else {
					out.println("<script>");
					out.println("alert('인증 되었습니다~');");
					out.println("</script>");
					application.setAttribute("aCertification", u);
				}
			}
		}
		
		chain.doFilter(request, response);
		
		if(admin.equals("admin") && aCertification.equals("")) {
			out.println("<script>");
			out.println("alert('관리자님 인증코드 발급하세요');");
//			out.println("location.href='';");	/* 필터 안에서는 경로 지정 이동 불가임 왜냐 경로 이동 시킬때 다시 필터에 걸릴 확률이 높으므로 */ 
			out.println("</script>");
		}
		
		System.out.println("2. 필터 수행 후~");
	}
	
}
