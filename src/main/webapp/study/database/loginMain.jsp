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
	
	function nameSearch() {
		let name = document.getElementById("name").value;
		if(name.trim() == "") {
			alert("검색할 성명을 입력하세요.");
			document.getElementById("name").focus();
		} else {
			location.href = "${ctp}/database/LoginSearch?name="+name;
		}
	}
	function loginList() {
		location.href = "${ctp}/study/database/LoginList";
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h1>회원 전용 메인 방</h1>
	<hr/>
	<div>
		<input type="button" value="전체조회" onclick="loginList()"/>
	</div>
	<table class="table table-hover">
		<tr>
			<th>인덱스 번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>성명</th>
			<th>나이</th>
			<th>성별</th>
			<th>주소</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.getIdx()}</td>
				<td>${vo.getMid()}</td>
				<td>${vo.getPwd()}</td>
				<td><a href="${ctp}/study/database/LoginView?idx=${vo.idx}&name=${vo.name}">${vo.getName()}</a></td>
				<td>${vo.getAge()}</td>
				<td>${vo.getGender()}</td>
				<td>${vo.getAddress()}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6" class = "m-0 p-0"></td></tr>
		
	</table>
	<br/>
	<div class="input-group">
		<div class= "input-group-prepend"><span class="input-group-text">성명</span></div>
		<input type="text" name="name" id="name" class="form-control"/>
		<button onclick="nameSearch()">개별조회</button>
	
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
