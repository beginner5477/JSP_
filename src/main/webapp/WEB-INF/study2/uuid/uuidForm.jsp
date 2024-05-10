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
	let str = "";
	function uuidCheck() {
		$.ajax({
			url:"${ctp}/UuidProcess",
			type:"get",
			success:function(res) {
				str += res + "<br/>";
				demo.innerHTML = str;
			},
			error:function() {
				alert("전송오류");
			}
		});
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>UUID란</h2>
	<pre>
		Universally Unique Identifier로서 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 규악이다.
		'거의 중복 확률이 0에 수렴하는 ID를 만드려는 방법의 표준화이다'
		128bit로 16진수로 표현시에 32자릿수로 표현됨(8-4-4-12)
		예) 3312ADDF-3139-0013-3939ABBDC331
	</pre>
	<div>
		<form name="myform">
			<input type="button" value="UUID생성" onclick="uuidCheck()" class="btn btn-success"/>
			<input type="button" value="다시하기" onclick="location.reload()" class="btn btn-secondary"/>
		</form>
	</div>
	<div id="demo"></div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
