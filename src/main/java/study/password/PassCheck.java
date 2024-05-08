package study.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/password/PassCheck")
public class PassCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		pwd = pwd.toUpperCase();
		
		System.out.println(mid);
		System.out.println(pwd);
		System.out.println(idx);
		if(idx==1) {
			//숫자만을 암호화 하는 경우임 암호키(0x1234ABCD)
			int key = 0x1234ABCD;
			int encPwd, decPwd;
			encPwd = Integer.parseInt(pwd) ^ key;
			System.out.println("인코딩된 비밀번호: "+encPwd);
			System.out.println("앞에서 암호화된 비밀번호를 DB에 저장처리한다: "+encPwd);	//DB에 저장했다고 가정함
			
			System.out.println("DB에 저장된 비밀번호를 다시 불러와서 디코딩 복호화처리한다.");
			decPwd = encPwd ^ key;
			System.out.println("디코딩된 비밀번호: "+decPwd);
			System.out.println("로그인 인증처리한다. 들어온거랑 비교해서");
		} else if(idx==2) {
			//문자숫자 조합을 암호화 해보자
			//ASC코드로 변환해서 처리
			long intPwd;
			String strPwd="";
			for(int i = 0; i < pwd.length(); i++) {
				intPwd = (long)(pwd.charAt(i));	//char에 들어간 문자를 숫자형으로 바꾸면 아스키코드 대입된 걸로 변환됨??
				strPwd += intPwd+"";
			}
			System.out.println("아스키코드로 변환된 비번: "+strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			//암호화시킬 salt키를 선정
			long key = 0x1234ABCD;
			long encPwd = (intPwd) ^ key;
			strPwd = key+String.valueOf(encPwd);
			System.out.println("암호화된 비번:"+strPwd);	//암호화된 비번
			System.out.println("디비에 저장중입니다."+strPwd);	//DB에 저장하는 것을 가정함
			
			long decPwd = Long.parseLong(strPwd);
			decPwd = decPwd ^ key;
			strPwd = decPwd + "";
			System.out.println("해독된 비번"+strPwd);
			//해독된 숫자 ASC코드를 다시 문자화시킴
			String res = "";
			char ch;
			for(int i = 0; i < strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i,i+2));
				res += ch+"";
			}
			System.out.println("문자화된 해독 비번:"+res);
		}
	}
}
