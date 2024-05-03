<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="study.j0429.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
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
	<button type="button" onclick="javascript:location.href='jstl2.jsp'">JSTL2</button>
	<button type="button" onclick="javascript:location.href='jstl3.jsp'">JSTL3 반복문 응용</button>
	<button type="button" onclick="javascript:location.href='jstl4.jsp'">JSTL4 function 태그</button>
	<button type="button" onclick="javascript:location.href='jstl1.jsp'">JSTL1</button>
	<h1>JSTL Format연습</h1>
	<hr/>
	<pre>
		사용 용도: 형식문자열을 표현(지정)할때 사용한다.(예: 숫자컴마,화폐단위,백분율,날짜형식,...)
		사용법: < fmt : 명령어... value="$ {값/변수}" pattern="표현패턴" <!-- type="화폐단위" --> / >
	</pre>
	<c:set var="won1" value="7654321"/>
	<c:set var="won2" value="7654.62333331"/>
	<div>
		won1 = ${won1} / won2 = ${won2}
		<hr/>
		1.천단위 쉼표: <br/>
		<fmt:formatNumber value="${won1}"></fmt:formatNumber><br/>
		<fmt:formatNumber value="${won2}"></fmt:formatNumber><br/>
		
		<fmt:formatNumber value="${won1}" pattern="0,000"></fmt:formatNumber><br/>	<!-- 자동 반올림 해줌 -->
		<fmt:formatNumber value="${won2}" pattern="0,000"></fmt:formatNumber><br/>
		
		<fmt:formatNumber value="${won1}" pattern="0,000.0"></fmt:formatNumber><br/>	<!-- 자동 반올림 해줌 -->
		<fmt:formatNumber value="${won2}" pattern="0,000.0"></fmt:formatNumber><br/>
		
		<fmt:formatNumber value="${won1}" pattern="#,##0.0"></fmt:formatNumber><br/>	<!-- 자동 반올림 해줌 -->
		<fmt:formatNumber value="${won2}" pattern="#,##0.0"></fmt:formatNumber><br/>	<!-- #은 자릿수 없으면 안채워줌 즉 0은 없앤다 이말임  -->
		
		2.화폐단위:<br/>
		원화: <fmt:formatNumber value="${won1}" type="currency"></fmt:formatNumber><br/>
		USD: <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD"></fmt:formatNumber><br/>
		<hr/>
		
		3.백분율<br/>
		<c:set var="per" value="0.987654"/>
		<fmt:formatNumber value="${per}" type="percent"></fmt:formatNumber>	<!-- 반올림 해주고 100곱해준다 -->
		<fmt:formatNumber value="${per}" type="percent" pattern="0.0%"></fmt:formatNumber>	<!-- 반올림 해주고 100곱해준다 -->
		<hr/>
		
		4.날짜<br/>
		오늘날짜: <%=new Date() %> <br/>
		<c:set var="today" value="<%=new Date()%>"/><br/>
		오늘날짜2: ${today} : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
		오늘날짜3: ${today} : <fmt:formatDate value="${today}" pattern="yyyy--dd"/> <br/>
		오늘날짜4: ${today} : <fmt:formatDate value="${today}" pattern="yyyy년-MM월-dd일"/> <br/>
		현재시간1: <fmt:formatDate value="${today}" pattern="hh:mm:ss"/><br/>
		현재시간2: <fmt:formatDate value="${today}" pattern="hh시:mm분:ss초"/><br/>
		현재날짜와 시간: <fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
		<hr/>
		
		5.국가별 설정(로케일)<br/>
		현재 톰캣서버의 기본 로케일(): <%=response.getLocale() %><br/>
		톰캣서버의 기본 로케일을 미국식으로 변경: <fmt:setLocale value="en_US"/><br/>
		<fmt:formatNumber value="${won2}" type="currency"/><br/>
		<hr/>
		
		6.core라이브러리에 있는거 location.href = ""; => redirect
		<!--   예2) < c : redirect url='경로' >
	     				< c : param name="변수명" value="값" />
	     			< / c : redirect > -->
		7.import: core라이브러리에 있음
		<c:import url="/include/bs4.jsp"/>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
