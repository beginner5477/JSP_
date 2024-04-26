<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String mid = "okm5477";
	Cookie cookieMid = new Cookie("cMid",mid);
		//쿠키의 만료시간(초)단위다.
	cookieMid.setMaxAge(60*60*24);
	response.addCookie(cookieMid);
	String tel = "010-1111-3333";
	Cookie cookieTel = new Cookie("cTel",tel);
		//쿠키의 만료시간(초)단위다.
	cookieTel.setMaxAge(60*60*24);
	response.addCookie(cookieTel);
	String pwd = "okcashback";
	Cookie cookiePwd = new Cookie("cPwd",pwd);
		//쿠키의 만료시간(초)단위다.
	cookiePwd.setMaxAge(60*60*24);
	response.addCookie(cookiePwd);
%>

<script>
	alert("쿠키가 생성 후 저장되었습니다.");
	location.href="t01_cookies.jsp";
</script>