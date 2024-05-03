<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("abc", "\n"); %>
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
	<h2 class="text-center">방명록 리스트</h2>
	
	<table class="table table-borderless">
			<tr>
				<td><a href="#" class="btn btn-primary">관리자</a></td>
				<td><a href="${ctp}/guest/guestInput.jsp" class="btn btn-primary">글쓰기</a></td>
			</tr>
			<tr>
				<th>번호: ${vo.idx}</th>
				<th>방문IP: ${vo.guestIP}</th>
			</tr>
		</table>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<th>번호: ${vo.idx}</th>
				<th>방문IP: ${vo.guestIP}</th>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${vo.name}</td>
				<th>방문일자</th>
				<td>${vo.visitDate}</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">${vo.homePage}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${fn:replace(vo.content,abc,"<br/>")}</td>
			</tr>
		</table>
		<br/>
	</c:forEach>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
