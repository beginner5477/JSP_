<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>성적계산하기</h2>
  <hr/>
  <div><a href="t02_1.jsp" class="btn btn-success">방법1servlet</a></div>
  <div><a href="t02_2.jsp" class="btn btn-primary">방법2jsp명령어태그</a></div>
  <div><a href="t02_3.jsp" class="btn btn-primary">방법3</a></div>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>