<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>서블릿 파일 호출하기</h2>
	<p>Get 방식: <a href="/javaclass/Tt7">7번 Get서블릿 호출</a>
	<p>Get 방식: <a href="/javaclass/Tt8">get방식서블릿 호출</a>
	<div>
		<div>
			<form name="myform" method="post" action="/javaclass/Tt8">
			<input type="submit" value="전송" class="btn btn-success"/>
			</form>
		</div>
	</div>
</div>
<p><br/><p>
</body>
</html>