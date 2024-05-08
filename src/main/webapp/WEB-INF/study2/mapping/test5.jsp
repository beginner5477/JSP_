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
	function pathCheck() {
		let pathCheck = document.getElementById("pathCheck").value;
		location.href = pathCheck;
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>안녕하세용? 여기는 DB접근 페이지 입니다.</h3>
	<p>원하는 기능을 선택해주세용~</p>
	<ol>
		<li><a href="hoewonList.do5">회원정보 조회하기</a></li>
		<li><a href="hoewonSearch.do5">회원정보 개별조회하기</a></li>
		<li><a href="hoewonDelete.do5">회원정보 삭제하기</a></li>
		<li><a href="hoewonUpdate.do5">회원정보 수정하기</a></li>
		<li><a href="hoewonInsert.do5">회원정보 입력하기</a></li>
	</ol>
	<select id="pathCheck" onchange="pathCheck()">
		<option value="test5.do5">선택하기</option>
		<option value="hoewonList.do5">회원정보 조회하기</option>
		<option value="hoewonSearch.do5">회원정보 개별조회하기</option>
		<option value="hoewonDelete.do5">회원정보 삭제하기</option>
		<option value="hoewonUpdate.do5">회원정보 수정하기</option>
		<option value="hoewonInsert.do5">회원정보 입력하기</option>
	</select>
	
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
