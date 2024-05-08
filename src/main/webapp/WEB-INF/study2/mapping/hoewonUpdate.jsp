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
	function fCheck(cnt) {
		myform.mid.value = document.getElementById("mid"+cnt).value;
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>회원 정보 수정하기</h3>
	<p>수정을 원하는 ID를 클릭하세요.</p>
	<p>인덱스는 수정 불가능임</p>
	<table>
		<tr>
			<th>idx</th>
			<th>mid</th>
			<th>pwd</th>
			<th>name</th>
			<th>age</th>
			<th>gender</th>
			<th>address</th>
		</tr>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
		<td>${vo.getIdx()}</td>
		<td><input onclick="fCheck(${st.count})" type="button" id="mid${st.count}" value="${vo.getMid()}"/></td>
		<td>${vo.getPwd()}</td>
		<td>${vo.getName()}</td>
		<td>${vo.getAge()}</td>
		<td>${vo.getGender()}</td>
		<td>${vo.getAddress()}</td>
		</tr>
	</c:forEach>
	</table>
	<form name="myform" method="post" action="hoewonUpdateOk.do5">
		선택된 ID:<input type="text" name="mid" readonly/>
		필드명:<input type="text" name="fieldName"/>
		수정내용:<input type="text" name="content"/>
		<input type="submit" value="제출하기"/>
	</form>
	<div>
		<a href="test5.do5">돌아가기</a>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
