<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JSTL3_VO</title>
<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<button type="button" onclick="javascript:location.href='jstl1.jsp'">JSTL1 core library</button>
	<button type="button" onclick="javascript:location.href='jstl2.jsp'">JSTL2 반복문 응용</button>
	<button type="button" onclick="javascript:location.href='jstl4.jsp'">JSTL4 function 태그</button>
  	<button type="button" onclick="javascript:location.href='jstl5.jsp'">JSTL5 formatting 태그</button>
	<h3>JSTL반복문 응용 연습</h3>
	<hr/>
	<h2>회원 자료 출력하기</h2>
	<form name="myform" method="post" action="${ctp}/study/j0429/jstl3Ok">
		<input type="submit" value="회원리스트" class="btn btn-success"/>
		
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
