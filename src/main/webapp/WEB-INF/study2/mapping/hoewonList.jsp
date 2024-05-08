<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script type="text/javascript">
	alert("${message}");
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<table>
		<tr>
			<th>인덱스</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>주소</th>
		</tr>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
		<td>${vo.getIdx()}</td>
		<td>${vo.getMid()}</td>
		<td>${vo.getPwd()}</td>
		<td>${vo.getName()}</td>
		<td>${vo.getAge()}</td>
		<td>${vo.getGender()}</td>
		<td>${vo.getAddress()}</td>
		</tr>
	</c:forEach>
	</table>
	<div>
		<a href="test5.do5">돌아가기</a>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
