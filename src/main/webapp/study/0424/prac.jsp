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
	<p>여러 값 넘겨 보기 연습</p>
	<form name="myform" method="post" action="/javaclass/Prac1">
		성명: <input type="text" name="name"/><br/>
		나이: <input type="number" name="age"/><br/>
		비밀번호: <input type="password" name="password"/><br/>
		취미: <input type="text" name="hobby"/><br/>
		<input type="submit" value="제출"/><br/>
	</form>
</div>
<p><br/><p>
</body>
</html>