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
	/* function calc(flag) {
		if(flag == 'hap') myform.action = "hap.do3";
		else if(flag == 'cha') myform.action = "cha.do3";
		else if(flag == 'gop') myform.action = "gop.do3";
		else if(flag == 'mok') myform.action = "mok.do3";
		myform.submit();
	} */
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
		<a href="List.do4" class="btn btn-primary mr-3">List연습</a>
		<a href="Input.do4" class="btn btn-primary mr-3">Input연습</a>
		<a href="Update.do4" class="btn btn-primary mr-3">Update연습</a>
		<a href="Delete.do4" class="btn btn-primary mr-3">Delete연습</a>
		<a href="Search.do4" class="btn btn-primary mr-3">Search연습</a>
	</div>
	<!-- <div>
  	<a href="javascript:calc('hap')" class="btn btn-success mr-3">합</a>
  	<a href="javascript:calc('cha')" class="btn btn-warning mr-3">차</a>
  	<a href="javascript:calc('gop')" class="btn btn-info mr-3">곱</a>
  	<a href="javascript:calc('mok')" class="btn btn-primary mr-3">몫</a>
  	</div> -->
	<hr/>
	<div>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/mapping/test2.do">
			<input type="number" name="su1" value="${su1}" class="form-control mb-2"/>
			<input type="number" name="su2" value="${su2}" class="form-control mb-2"/>
			<div><input type="submit" value="전송하기"/></div>
		</form>
	</div>
	<div>
		<div>두 수의 합: ${hap}</div>
		<div>두 수의 차: ${cha}</div>
		<div>두 수의 곱: ${gop}</div>
		<div>두 수의 몫: ${mok}</div>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
