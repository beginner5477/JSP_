<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jstl2.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>JSTL(Java Standard Tag Library)</h2>
  <div class="text-right">
    <button type="button" onclick="location.href='jstl1.jsp';" class="btn btn-success">JSTL core라이브러리</button>
    <button type="button" onclick="javascript:location.href='jstl3.jsp'">JSTL3</button>
    <button type="button" onclick="javascript:location.href='jstl4.jsp'">JSTL4 function 태그</button>
  	<button type="button" onclick="javascript:location.href='jstl5.jsp'">JSTL5 formatting 태그</button>
  </div>
  <hr/>
  <h3>JSTL 반복문(core라이브러리 사용 : forEach문)</h3>
  <pre>
    사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수"> ~~ < / c : forEach >
    			 : setp 이 1인경우는 생략 가능하다. varStatus="변수" 는 필요할때만 선언해서 사용하면 된다.
    사용법2 : < c : forEach var="변수" items=" $ {객체명/배열}" varStatus="매개변수" > ~~ < / c : forEach >
    사용법3 : < c : forTokens var="변수" items=" $ {객체명/배열}" delims="구분기호" > ~~ < / forTokens >
  </pre>
  <hr/>
  
  <p>사용법 1</p>
<%-- <%for(int i=1; i<=10; i++) { } %> --%>
	<%-- <c:forEach var="i" begin="1" end="10" step="1" varStatus="st"> --%>
	<c:forEach var="i" begin="1" end="10">
		${i} /
	</c:forEach>
	<br/><br/>
	
	<p>사용법 2</p>
<%
  String[] cards = {"국민","BC", "LG", "현대", "삼성", "농협", "비자"};
  pageContext.setAttribute("cards", cards);
%>
  <c:forEach var="card" items="${cards}">
  	${card} /
  </c:forEach>
  <br/><br/>
  
	<p>사용법 3</p>
	<c:set var="hobbys" value="등산/낚시/수영/바둑/바이크/독서/영화감상" />
	취미 : ${hobbys}<br/>
	취미를 콤마(,)로 분리후 출력 : 
	<c:forTokens var="hobby" items="${hobbys}" delims="/">
	  ${hobby} ,
	</c:forTokens>
	<br/><br/>
	
	<p>사용법 4(상태변수 사용예제)</p>
	<pre>
	  상태변수 예약어 : count - 1부터 1씩 증가처리,
	  						 	index - 인덱스번호(0번부터 시작)
	  						 	current - 현재 아이템...
	  						 	first - 첫번째 아이템인가????
	  						 	last - 마지막번째 아이템인가????
	</pre>
  <c:forEach var="card" items="${cards}" varStatus="st">
  	${st.count}.(${st.index}) : ${card} : 조건? a.${st.current} / b.${st.first} / c.${st.last}<br/>
  </c:forEach>
  <br/>
  <hr/>
  
  <h4>사용예제</h4>
  <div>구구단 5단을 출력하세요</div>
  
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>