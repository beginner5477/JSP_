<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
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
	  <button type="button" onclick="javascript:location.href='jstl1.jsp'">JSTL1 core library</button>
	  <button type="button" onclick="javascript:location.href='jstl3.jsp'">JSTL3 반복문 응용</button>
	  <button type="button" onclick="javascript:location.href='jstl4.jsp'">JSTL4 function 태그</button>
  	<button type="button" onclick="javascript:location.href='jstl5.jsp'">JSTL5 formatting 태그</button>
	  <hr/>
	  <h3>JSTL 반복문(core 사용 forEach문)</h3>
	  <pre>
	  	 사용법1: < c : forEach var="변수" begin="초기값" step="증감치" varStatus="매개변수">~~ < / c : forEach >
	  	 사용법2: < c : forEach var="변수" items="$ {객체명/배열명} varStatus="매개변수"> ~~ < / c : forEach>
	  	 사용법3: < c : forTokens var="변수" items="$ {객체명/배열명}" delims="구분기호"> ~~ < / c : forTokens>
	  </pre>
	  <%-- <c:forEach var="i" begin="1" end="10" step="1" varStatus="st"> --%>
	  <c:forEach var="i" begin="1" end="10">
	  	${i}/
	  </c:forEach>
	  <div>
	  	<% 
	  		String[] cards = {"국민","삼성","우리","하나"};
	  		pageContext.setAttribute("cards", cards);
	  	%>
	  	<c:forEach var="card" items="${cards}">
	  		${card} / 
	  	</c:forEach>
	  </div>
	  <c:set var="hobbys" value="등산/낚시/게임/로아/롤/카르마온라인"/>
	  취미: ${hobbys}<br/>
	  <c:forTokens var="hobby" items="${hobbys}" delims="/">
	  	${hobby} ,
	  </c:forTokens>
	  
	  
	  <pre>
	  	상태변수 예약어: count는 1부터 1씩 번호매겨 출력해줌, index 인덱스번호 즉 0부터 시작
	  				current는 현재 아이템을 표출 , first는 첫번째 아이템인지를 true/false 반환
	  				last는 마지막 아이템인지를  트루false 반환
	  </pre>
	  <c:forEach var="card" items="${cards}" varStatus="st">
	  		${st.count}.${st.index} ${card} : 조건? a.${st.current} / b.${st.first} / c.${st.last} <br/>
	  </c:forEach>
	  <br/>
	  <hr/>
	  <div>5단을 출력하세요 구구단</div>
	  <p>저장된 그림 5장을 출력하시오.</p>
	  <div>
	  	<c:forEach var="i" begin="111" end="115" varStatus="st">
	  		<img src="${ctp}/images/${i}.jpg" width="100px"/>
	  	</c:forEach>
	  </div>
	  
	  <p>배열을 넘길때 문자열로 넘겨온 문자열을 구분자로 구분해서 출력하는것</p>
	  <div>
	  	 <c:set var="pics" value="111.jpg/112.jpg/113.jpg/114.jpg/115.jpg"/>
		 <c:forTokens var="pics" items="${pics}" delims="/" varStatus="st">
		  	<img src="${pageContext.request.contextPath}/images/${pics}" width="100px"/>
		 	<c:if test="${st.count % 3 == 0}"><br/></c:if>
		 </c:forTokens>
	  </div>
	  <p>2차원 배열 형식으로 저장된 자료를 한행에 3개씩 출력하쇼</p>
	  <%
	  	String[][] members = {
	  			{"바알","9999","지옥"},	
	  			{"예수","-1","천국"},	
	  			{"미카엘","9999","천당"},	
	  			{"킹크림슨","43","프랑스"}	
	  	};
	  	pageContext.setAttribute("members", members);
	  %>
	  
	  <c:forEach var="member" items="${members}">
	  	<c:forEach var="m" items="${member}">
	  		${m} /
	  	</c:forEach>
	  	<br/>
	  </c:forEach>
	  
	  <p>4번행에서 "프랑스"란 단어를 빨간색으로 표시하세요</p>
	  <c:forEach var="member" items="${members}" varStatus="st">
	  	<c:forEach var="m" items="${member}" varStatus="st1">
	  		<c:if test="${st1.count ==3 && st.count == 4 }"><font color="red">${m}</font></c:if>
	  		<c:if test="${st1.count !=3 || st.count != 4 }">${m}</c:if>
	  	</c:forEach>
	  	<br/>
	  </c:forEach>
	  
	  <p>나이가 1000살 미만은 굵고 파랑색으로 표시</p>
	  <c:forEach var="member" items="${members}" varStatus="st">
	  	<c:forEach var="m" items="${member}" varStatus="st1">
	  		<c:if test="${st1.count==2}">
	  			<c:if test="${m+0 < 1000}"> <font color="blue">${m}/</font> </c:if>
	  			<c:if test="${m+0 >= 1000}">${m}/</c:if>
	  		</c:if>
	  		<c:if test="${st1.count!=2}">
	  			${m}/
	  		</c:if>
	  	</c:forEach>
	  	<br/>
	  </c:forEach>
	  
	  <p>앞의 cards의 내용중에 첫번째 카드의 배경색은 노랑, 마지막카드의 배경색은 하늘색으로 출력하쇼ㅗ</p>
	  <c:forEach var="card" items="${cards}" varStatus="st">
	  	<c:if test="${st.first}"><font color="blue">${card}/</font></c:if>
	  	<c:if test="${st.last}"><font color="skyblue">${card}/</font></c:if>
	  	<c:if test="${!st.last&&!st.first}">${card}/</c:if>
	  	</c:forEach>
	  	
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
