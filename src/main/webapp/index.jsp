<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
<c:set var="hi" value="${firstCk}"/>
<head>
  <title>Bootstrap 4 dddㅇㅇㅇWebsite Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../include/bs4.jsp" %>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  body {
  	/* opacity: 0.8; */
  	background-image: url("${pageContext.request.contextPath}/images/123.jpg");
  	background-size: 100% 100%;
  	isolation: isolate;
  	 position: relative;
  }
  body::after {
	  content: '';
	  position: absolute;
	  background: white;
	  z-index: -1;
	  inset: 0;
	  opacity: 0.2;
  }
  </style>
  <script>
  let idleCheck;
  let idleNum = 0;
  	$(()=>{
  		latestFive1();
  		idleCheck = setInterval(idlePlus, 1000);
  	});
  	function latestFive1() {
	  	if("${hi}"=="") {
	  		location.href="${pageContext.request.contextPath}/database/LatestFive";
	  	}
  	}
  	function idlePlus() {
  		idleNum++;
  		if(idleNum == 5) {
  			/* location.href="${pageContext.request.contextPath}/database/LatestFive"; */
  			location.reload();
  		}
  	}
  	document.onclick = () => {
  		idleNum = 0;
  	}
  	document.onmousemove = () => {
  		idleNum = 0;
  	}
  	document.onkeypress = () => {
  		idleNum = 0;
  	}
  	function dday() {
  		document.getElementById("myform").submit();
  	}
  </script>
  <style>
  	p {
  		color: violet;
  	}
  	h2 {
  		color: aqua;
  	}
  	tr {
  		color: #blue;
  	}
  </style>
</head>
<body>
<%@ include file ="./include/header.jsp" %>


<%@ include file ="./include/nav.jsp" %>

<div class="container" style="margin-top:30px;" >
  <div class="row">
    <div class="col-sm-5">
      <h2>About Me</h2>
      <h5>Photo of me:</h5>
      <div class="fakeimg">
      	dd
      </div>
      <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
      <form id="myform" name="myform" method="post" action="/javaclass/DDay"> <input type="date"
         id="date"
         name="date"
         max="2077-06-20"
         min="2024-05-04"
         onchange="dday()"
  		 /></form>
      <p>D-Day:${DDay}</p>
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      <h3>Some Links</h3>
      <p>Lorem ipsum dolor sit ame.</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
      <p style="text-align: center"><font size="5pt">●●최근 회원 가입한 사람들●●</font></p>
      <table class="table table-bordered">
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
      			<td>${vo.getMid()}</td>
      			<td>${vo.getPwd()}</td>
      			<td>${vo.getName()}</td>
      			<td>${vo.getAge()}</td>
      			<td>${vo.getGender()}</td>
      			<td>${vo.getAddress()}</td>
      		</tr>
      	</c:forEach>
      	</table>
    </div>
    <div class="col-sm-7">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class="fakeimg"><img src="/javaclass/images/114.jpg" style="width:100%; height:500px;"/></div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      <br>
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg"><img src="/javaclass/images/113.jpg" style="width:100%; height:450px;"/></div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>
<br/><br/><br/><br/>
<%@ include file ="../../include/footer.jsp" %>
</body>
</html>

