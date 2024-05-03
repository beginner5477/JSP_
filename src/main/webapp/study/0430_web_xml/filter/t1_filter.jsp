<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	'use strict';
	function fCheck(flag) {
		if(flag == 'OK') myform.action = "${ctp}/j0430/T01Ok";
		else myform.action = "${ctp}/j0430/T01Ok2";
		myform.submit();
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>filter 한글처리 연습</h2>
	<form name="myform" method="post" action="">
		<div><input type="text" name="content" value="간단소개"/></div>
		<div><textarea rows="1" cols="1" name="introduce"></textarea></div>
		<div><input type="button" value="전송1" onclick="fCheck('OK')"/></div>
		<div><input type="button" value="전송2" onclick="fCheck('NO')"/></div>
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
