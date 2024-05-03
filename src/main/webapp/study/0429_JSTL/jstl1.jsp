<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jstl1.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    th {
      background-color: #ccc;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>JSTL(Javaserverpages Standard Tag Library)</h2>
  <button type="button" onclick="javascript:location.href='jstl2.jsp'">JSTL2</button>
  <button type="button" onclick="javascript:location.href='jstl3.jsp'">JSTL3 반복문 응용</button>
  <button type="button" onclick="javascript:location.href='jstl4.jsp'">JSTL4 function 태그</button>
  <button type="button" onclick="javascript:location.href='jstl5.jsp'">JSTL5 formatting 태그</button>
  
  <table class="table table-bordered">
    <tr>
      <th>라이브러리</th>
      <th>주소(URI)</th>
      <th>접두어</th>
      <th>기본문법</th>
    </tr>
    <tr>
      <td>Core</td>
      <td>http://java.sun.com/jsp/jstl/core</td>
      <td>c</td>
      <td>< c : 태그명.... ></td>
    </tr>
    <tr>
      <td>Formatting</td>
      <td>http://java.sun.com/jsp/jstl/fmt</td>
      <td>fmt</td>
      <td>< fmt : 태그명.... ></td>
    </tr>
    <tr>
      <td>Function</td>
      <td>http://java.sun.com/jsp/jstl/function</td>
      <td>fn</td>
      <td>$ { fn : 태그명.... }</td>
    </tr>
    <tr>
      <td>SQL</td>
      <td>http://java.sun.com/jsp/jstl/sql</td>
      <td>sql</td>
      <td>< sql : 태그명.... ></td>
    </tr>
  </table>
  <hr/>
  <div>
    앞의 라이브러리를 사용할 경우에는 반드시 상단에 jsp지시자중 'taglib'를 이용하여 먼저 선언후 사용해야 한다.
  </div>
  <hr/>
  <h2>Core 라이브러리 사용예</h2>
  <pre>
  	용도: 변수제어(선언/값할당/출력/제거), 제어문(조건문, 반복문)에 사용
  	변수 선언: < c : set var="변수명" value="값" > </ c : set> 	<!-- 여기서 중간에 띄워 쓰기는 제외 시키고 사용해야됨. -->
  	변수 선언: < c : set var="변수명" value="값" /> 	<!-- 여기서 중간에 띄워 쓰기는 제외 시키고 사용해야됨. -->
  	변수 출력: < c : out value="값/변수/수식" />
  	변수 제거: < c : remove var="변수명" />
  </pre>
  <hr/>
  su1 변수 선언 후에 초기값으로 100을 할당 <c:set var="su1" value="100"/><br/>
  su1 변수를 출력 <c:out value="${su1}"/><br/>	<!-- serverstorage에 저장 시키는 개념이라는 말임 -->
  su1 변수를 출력 ${su1}<br/>
  값 200을 출력 <c:out value="200"/><br/>
  수식을 출력 <c:out value="${100 * 200}"/><br/>
  수식을 출력 <c:out value="${'100' + '200'}"/><br/>	<!-- 여기서는 문자로 표현된 숫자도 그냥 연산으로 쳐줌 -->
  <% String name = "홍길동"; %>
  값을 출력`? <%=name %><br/>
  값을 출력`? <c:out value='<%=name %>'/><br/>		<!-- 현재 페이지의 변수 표현식이므로 나옴 -->
  값을 출력`? <c:out value='${name}'/><br/>	<!-- 저장소에 set 시킨적 없으므로 당연히 안나옴 -->
  <% pageContext.setAttribute("name", name); %> <!-- 저장소에 set한 후에 출력시키면 나옴 -->
  값을 출력? <c:out value='${name}'/><br/>
  su1변수를 제거하기 <c:remove var="su1"/><br/>
  su1변수값을 출력? ${su1}<br/>
  su1변수의 name변수 값을저장하기 <c:set var="su1" value="${name}"></c:set><br/>
  su1에 저장된값 출력해보기 <c:out value="${su1}"></c:out><br/>	<!-- 객체도 저장 출력 가능 하다? -->
  <hr/>
  
  JSTL 제어문(조건문(if), 반복문(forEach))<br/>
  <p>사용법: < c : if test="$ {조건식}"> 조건식에 따른 처리할 내용 </ c : if></p>	<!-- 주의점: 조건식의 내용은 EL표기법으로 넣어준다 -->
  <p>특징1: jstl의 숫자비교는 문자 형식으로 비교합니다.</p>
  <p>특징2: EL조건문에서는 else가 없다!</p>
  <p>사용예시: su3=300, su4=400</p>
  <c:set var="su3" value="300"></c:set>	
  <c:set var="su4" value="400"></c:set>
  su3 = ${su3 }<br/>
  su4 = ${su4 }<br/>
  <div>1.su3와 su4의 비교 <c:if test="${su3==su4}">su3와 su4는 같다.</c:if></div>	
  <div>2.su3와 su4의 비교 <c:if test="${su3!=su4}">su3와 su4는 같지 않다.</c:if></div>	
  <div>3.su3와 su4의 비교 <c:if test="${su3 < su4}">su4가 더 크다.</c:if></div>
  <div>4.su3와 su4의 비교 <c:if test="${su3 > su4}">su3가 더 크다.</c:if></div>
  <c:set var="su10" value="9"></c:set>	
  <c:set var="su11" value="10"></c:set>
  <div>5.su10와 su11의 비교 <c:if test="${su10 < su11}">su11가 더 크다.</c:if></div>
  <div>6.su10와 su11의 비교 <c:if test="${su10 > su11}">su10가 더 크다.</c:if></div>	<!-- 얘기인 즉슨 EL안에서의 비교는 문자비교로 들어간다는 말임 -->
  <div>7.su10와 su11의 비교 <c:if test="${su10+0 < su11+0}">su11가 더 크다.</c:if></div>	<!-- 숫자로 비교하고 싶으면 숫자로 인식 시킨다음에 해야됨. -->
  <div>8.su3와 su4의 비교 <c:if test="${su3+0 gt su4+0}">su3가 더 크다.</c:if></div>
  <div>9.su3와 su4의 비교 <c:if test="${su3+0 lt su4+0}">su4가 더 크다.</c:if></div>
  
  <hr/>
  
  <div>예제: URL에 jumsu를 QueryString방식으로 입력 후에 학점을 구하시오.</div>
  <div>
  	<c:set var="jumsu" value="${param.jumsu}"/>
  	<c:if test="${jumsu+0 >= 90}">학점:A</c:if>
  	<c:if test="${jumsu+0 < 90 && jumsu+0 >= 80}">학점:B</c:if>
  	<c:if test="${jumsu+0 < 80 && jumsu+0 >= 70}">학점:C</c:if>
  	<c:if test="${jumsu+0 < 70 && jumsu+0 >= 60}">학점:D</c:if>
  	<c:if test="${jumsu+0 < 60}">학점:F</c:if>
  </div>
	<%-- <hr/>
	다중 조건 비교: choose ~ when <br/>

		사용법:
		< c : choose >
			< c : when test="조건식1">수행내용1</ c : when>
			< c : when test="조건식2">수행내용1</ c : when>
			< c : when test="조건식3">수행내용1</ c : when>
			< c : when test="조건식4">수행내용1</ c : when>
			~~
			< c : otherwise > 달리 없으면 수행내용 switch의 디폴트랑 같다 </ c : otherwise >
		</ c : choose >
		<div>학점은?
			<c:choose>	
				<c:when test="${jumsu > 90}">학점:A</c:when>	<!-- choose when에서는 EL안의 비교가 숫자로 먹힌다?? 신기하네 -->
				<c:when test="${jumsu > 80}">학점:B</c:when>
				<c:when test="${jumsu > 70}">학점:C</c:when>
				<c:when test="${jumsu > 60}">학점:D</c:when>
				<c:otherwise >학점:F</c:otherwise>
			</c:choose>
		</div>
		<hr/> --%>
	<%-- <div>예제2: URL에 직급코드(code)를 쿼리 스트링으로 넘겨와서 직급명을 구하자</div>
		<c:set var="code" value="${param.code}"/>
			<c:choose>	
				<c:when test="${code == 'A'}">직급:부장</c:when>	<!-- choose when에서는 EL안의 비교가 숫자로 먹힌다?? 신기하네 -->
				<c:when test="${code == 'B'}">직급:과장</c:when>
				<c:when test="${code == 'C'}">직급:차장</c:when>
				<c:when test="${code == 'D'}">직급:사원</c:when>
				<c:otherwise >직급:비사원</c:otherwise>
			</c:choose>
  --%>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>