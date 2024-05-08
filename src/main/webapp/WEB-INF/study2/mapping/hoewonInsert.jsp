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
	<form name="myform" method="post" action="hoewonInsertOk.do5">
		이름:<input type="text" name="name"/><br/>
		아이디:<input type="text" name="mid"/><br/>
		비번:<input type="text" name="pwd"/><br/>
		나이:<input type="number" name="age"/><br/>
		성별:<input type="text" name="gender"/><br/>
		주소:<input type="text" name="address"/><br/>
		<input type="submit" value="제출하기"/>
	</form>
	<div>
		<a href="test5.do5">돌아가기</a>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
