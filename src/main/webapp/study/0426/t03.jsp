<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	  <h2>회원 로그인</h2>
	  <p>(부서명: 인사과I, 자재과J, 생산과S, 총무과C)</p>
  <form name="myform" method="post" action="t03Ok.jsp">
  	<div>아이디
  	  <input type="text" name="mid" value="admin" class="form-control mb-3" autofocus required />
  	</div>
  	<div>비밀번호
  	  <input type="password" name="pwd" value="1234" class="form-control mb-3" required />
  	</div>
  	<div>
  	  <input type="submit" value="로그인" class="btn btn-success"/>
  	  <input type="reset" value="재입력" class="btn btn-success"/>
  	</div>
   </form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
