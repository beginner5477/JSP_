package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class FilterTest implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		System.out.println("이곳은 필터 수행 전 입니다.");
		chain.doFilter(request, response);
//		System.out.println("이곳은 필터 수행 후 입니다.");	/*나올때 걸리는 부분임 즉, response때 걸리는 부분*/
	}

}
