<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
	<h2>이곳에 init(서블릿)에서 보낸 값을 찍어봅니다.</h2>
	<p>
		회사명: ${sLogoName}<br/>
		홈페이지주소: <a href="${sHomeAddress}">${sHomeAddress}</a>
	</p>
	<hr/>
	<p><a href="${ctp}/j0430/T03_init" class="btn btn-success">컨트롤러 다녀오기~</a></p>
	<p><a href="${ctp}/j0430/T03_sessionOut" class="btn btn-success">세션 끊기</a></p>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
