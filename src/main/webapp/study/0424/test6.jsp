<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test4.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	//자바 스크립트 한줄주석
    	/*
    		자바스크립트 여러줄 주석
    	*/
    	<%--JSP 주석은 프론트에서 안 보임 --%>
    </script>
</head>		
<body>
<p><br/><p>
<div class="container">
	<%
		/* new Date(); */
		new java.util.Date();
		
	%>
	<p>오늘은 <%=new Date() %>입니다.</p>
	<%
		LocalDate currentDate = LocalDate.now();
	%>
	<p>오늘은 <%=currentDate %> 입니다.</p>
	<%
		LocalDateTime currentTime = LocalDateTime.now();
	%>
	<p>오늘의 날짜 시간은 <%=currentTime %> 입니다</p>
	<p>오늘의 시간은 <%=currentTime.toString().substring(11,19) %> 입니다</p>
	<p><input type="button" value="새로고침" onclick="location.reload()" class="btn btn-success"/></p>
</div>
<p><br/><p>
</body>
</html>