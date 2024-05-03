<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String hostIp = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>t01.jsp</h3>
	<hr/>
	<h1>서버의 환경변수 값 확인</h1>
	<div>호스트IP: <%=hostIp %></div>
	<div>호스트IP: <%=request.getRemoteAddr() %></div>
	<div>전송방식: <%=request.getMethod() %></div>
	<div>접속프로토콜: <%=request.getProtocol() %></div>
	<div>서버접속 포트 <%=request.getServerPort() %></div>
	<div>접속한 서버 이름 <%=request.getServerName() %></div>
	<div>웹 애플리케이션의 Context이름 <%=request.getContextPath() %></div>
	<div>접속 URL <%=request.getRequestURL() %></div>
	<div>접속 URI <%=request.getRequestURI() %></div>
	<div>
		<img src="<%=request.getContextPath() %>/images/111.jpg"/>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
