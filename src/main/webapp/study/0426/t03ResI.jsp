<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
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
	<h3>인사과 방</h3>
	<p>아이디:${mid}</p>
	<p>비밀번호:${pwd}</p>
	<p><a href="t03.jsp" class="btn btn-warning">돌아가기</a></p>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
