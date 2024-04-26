<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h2>쿠키 연습 메뉴</h2>
	<div class="row">
		<div><a href="t01_cookiesSave.jsp" class="btn btn-success">쿠키저장</a></div>
		<div><a href="t01_cookiesCheck.jsp" class="btn btn-success">쿠키확인</a></div>
		<div><a href="t01_cookiesAllDelete.jsp" class="btn btn-success">쿠키전체삭제</a></div>
		<div><a href="t01_cookiesPwdDelete.jsp" class="btn btn-success">쿠키비밀번호삭제</a></div>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
