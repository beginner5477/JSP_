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
	<h3>이곳은 test.jsp(WEB-INF/study2/mapping/test.jsp)</h3>
	${msg}
	<div>
		<form name="myform" method="post" action="testOk.jsp">
			
		</form>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
