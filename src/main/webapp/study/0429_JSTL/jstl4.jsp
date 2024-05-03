<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="study.j0429.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
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
  <button type="button" onclick="javascript:location.href='jstl1.jsp'">JSTL1 </button>
  <button type="button" onclick="javascript:location.href='jstl5.jsp'">JSTL5 formatting 태그</button>
  <hr/>
  
  <h2>JSTL Function 라이브러리 태그 써보기</h2>
  <pre>
  	사용법: $ { fn:함수명(변수/값/...) }
  	관계연산자 ==(eq) !=(ne) >(gt) <(lt) >=(ge) <=(le)
  </pre>
<%
	String str = "Welcome to My Lando";
	pageContext.setAttribute("str", str);
	String[] hobbys = {"등산","낚시","롤","배그","로아","마블 영화보기"};
	pageContext.setAttribute("hobbys", hobbys);
	
ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	
	MemberVO vo = null;
	
	vo = new MemberVO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	
	request.setAttribute("vo", vo);
	
	vo = new MemberVO();
	vo.setName("김말숙");
	vo.setAge(33);
	vo.setGender("여자");
	vo.setJob("회사원");
	vo.setAddress("청주");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("이기자");
	vo.setAge(30);
	vo.setGender("남자");
	vo.setJob("공무원");
	vo.setAddress("제주");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("소나무");
	vo.setAge(53);
	vo.setGender("여자");
	vo.setJob("군인");
	vo.setAddress("인천");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("고인돌");
	vo.setAge(13);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
%>
	<hr/>
	<div>
		str변수의 값: ${str}<br/>
		1.str변수의 길이(length): <%=str.length() %> / ${fn:length(str)}<br/>
		2.hobbys의 길이: <%=hobbys.length %> / ${fn:length(hobbys)}<br/>
		3.vos의 길이: <%=vos.size() %> / ${fn:length(vos)}<br/>
		<hr/>
		4.대문자로 변환 투 어퍼 케이스: <%=str.toUpperCase() %> / ${fn:toUpperCase(str)} <br/>
		4.소문자로 변환 투 로우어 케이스: <%=str.toLowerCase() %> / ${fn:toLowerCase(str)} <br/>
		<hr/>
		5.문자열에서 추출 서브스트링: <%=str.substring(0,5) %> / ${fn:substring(str,0,5)} <br/>
		5.문자열에서 추출 서브스트링: <%=str.substring(5) %> / ${fn:substring(str,5,-1)} <!-- 음수 넣어주면 마지막 문자까지 뽑아준다 --> <br/>
		5.문자열에서 추출 서브스트링: <%=str.substring(5) %> / ${fn:substring(str,5,fn:length(str))}  <br/>
		<hr/>
		6.특정문자의 위치값 앞에서부터 (indexOf): <%=str.indexOf("o") %> / ${fn:indexOf(str,"o")} <br/>
		6.특정문자의 위치값 뒤에서부터 찾기: <%=str.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(str,"o")} --%> 이건 펑션 라이브러리에서 지원 안해줌<br/>
		6.str변수의 값 중에서 'o'문자가 들어있는 모든 위치를 출력하세요<br/>
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
			<c:if test="${fn:substring(str,i,i+1) == 'o'}">o의 인덱스 값은 ${i}</c:if>
		</c:forEach>
		6.'o'문자의 2번째 인덱스 값을 출력해보자	<br/>
		70.'o'문자의 마지막 인덱스 값을 출력해보자	<br/>
		<c:set var="idx" value="0"></c:set>
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
			<c:if test="${fn:substring(str,i,i+1) == 'o'}"><c:set var="idx" value="${i}"></c:set> </c:if>
		</c:forEach>
		마지막 o의 인덱스 번호는: ${idx}<br/>
		<hr/>
		7.substringBefore() / substringAfter()<br/>
		문자 o앞의 문자열을 출력~ ${fn:substringBefore(str,"o")} <br/> 
		문자 o뒤의 문자열을 출력~ ${fn:substringAfter(str,"o")} <br/> 
		<hr/>
		8.문자열분리(split(대상,분리 기준문자))배열로 저장시킴<br/>
			str변수 문자열 중에서 'o'를 기준으로 분리해서 출력해보자~<br/>
			<c:set var="strs" value="${fn:split(str,'o')}"></c:set>
			<c:forEach var="s" items="${strs}" varStatus="st">
				${st.count}:${s} /
			</c:forEach>
		<br/>
		<hr/>
		9.치환(replace())<br/>
			str변수안의 'o'를 'O'로 치환하기 <%=str.replace("o","O") %> / ${fn:replace(str,"o","O")}
		<br/>
		10.특정 문자열 포함 유무는 contains()<br/>
		예)str변수안에 My포함 유무 ${fn:contains(str,"My")}<br/>
		예)str변수안에 My포함 유무 ${fn:contains(str,"my")}
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
