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
<script>
	'use strict';
	function certificationCheck() {
		let certification = myform.certification.value;
		if(certification == ""|| certification.length != 4) {
			alert("인증을 확인하세요(4자리)");
			return false;
		} else {
			location.href="${ctp}/j0430/T02_certification?admin=admin&u="+certification;
		}
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>이곳은 인증 코드 발급 창입니다.</h2>
	<form name="myform">
		<div><input type="text" name="certification" value="1234" class="form-control"/></div>
		<div><input type="button" value="인증 코드 발급" onclick="certificationCheck()" /></div>
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
