<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = (String) session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/DDay">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/GuestList">Guest</a>
      </li>
      <%
      	if(!mid_.equals("")) {
      %>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>    
      <li class="nav-item mr-2">
        <div class="dropdown">
			    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
			      Study1
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">t01.jsp</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적 계산</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t01_cookies.jsp">쿠키</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">애플리케이션연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">storage연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp">jstl연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_filter.jsp">filter연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_certification.jsp">인증코드 발행</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t1_init.jsp">컨텍스트 초기값 연습</a>
			     <%--  <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/login.jsp">데이터베이스 연습</a> --%>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿 생명주기</a>
			      
			    </div>
			  </div>
      </li>
      <li class="nav-item mr-2">
        <div class="dropdown">
			    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
			      Study2
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/password/passCheck.jsp">비번 암호화 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/mapping/Test1">디렉토리 mapping 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/mapping/Test2.do">확장자 mapping 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/mapping/Test3.do3">확장자3 mapping 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/mapping/Test4.do4">확장자4 mapping 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/test5.do5">확장자5 mapping 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/ajax/test1.st">AJAX 연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/ajax/test2.st">AJAX 연습 응용</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/ajax/test3.st">AJAX 연습 회원관리</a>
			    </div>
			  </div>
      </li>
      <%
      	}
      %>
      <li class="nav-item">
      <% if(!mid_.equals("")) {%>
        <a class="nav-link" href="${pageContext.request.contextPath}/j0427/Logout">LogOut</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/database/Logout">LogOut</a>
      <%} else { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/study/0428_logIn/login.jsp">LogIn</a>
        <a class="nav-link" href="<%=request.getContextPath()%>/study/database/login.jsp">LogIn</a>
      <%} %>
      </li>    
    </ul>
  </div>  
</nav>