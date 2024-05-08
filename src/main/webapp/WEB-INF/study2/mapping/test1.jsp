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
<script type="text/javascript">
	'use strict';
	function fCheck(flag) {
		if(flag == 1) {
			myform.submit();
		} else if(flag == 3) {
			myform.action = "${ctp}/mapping/test1res2";
			myform.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>이곳은 test.jsp(WEB-INF/study2/mapping/test.jsp)</h3>
	${msg}
	<hr/>
	<div>
		<input type="button" value="두 수의 합/차" onclick="fCheck(1)" class="btn btn-primary mr-3"/>
		<input type="button" value="전송" onclick="fCheck(2)" class="btn btn-primary mr-3"/>
		<input type="button" value="전송" onclick="fCheck(3)" class="btn btn-primary mr-3"/>
		
	</div>
	<hr/>
	<div>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/mapping/test1Ok">
			<input type="number" name="su1" value="${su1}" class="form-control mb-2"/>
			<input type="number" name="su2" value="${su2}" class="form-control mb-2"/>
		</form>
	</div>
	<div>
		<div>두 수의 합: ${hap}</div>
		<div>두 수의 차: ${cha}</div>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
