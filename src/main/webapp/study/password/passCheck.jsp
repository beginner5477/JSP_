<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>login.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
<script>
	'use strict';
	
	function fCheck(idx) {
		let pwd = myform.pwd.value;
		if(pwd.trim() == "") {
			alert("비밀번호를 입력하세요.");
			myform.pwd.focus();
		} else {
			myform.idx.value = idx;
			myform.action = "${pageContext.request.contextPath}/study/password/PassCheck";
			myform.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>비밀번호 암호화 연습</h2>
	<pre>
		암호학에서는 salt는 데이터 비밀번호 통과암호를 해시처리하는 단방향 함수의 추가입력으로 사용되는 랜덤 데이터이다
		솔트는 스토리지에서 비밀번호를 보호하기 위해 사용한다
		솔트는 레인보우 테이블(해시 테이블)과 같은 미리 계산된 테이블을 사용하는 공격에서 방어를 담당한다
	</pre>
  <form name="myform" method="post">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">비번 체크</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="1234" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="숫자비밀번호" onclick="fCheck(1)" class="btn btn-success mr-2"/>
          <input type="button" value="문자+숫자비번넘기기" onclick="fCheck(2)" class="btn btn-success mr-2"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx"/>
  </form>
  <div>비밀번호를 전송 후 콘솔창에서 암호화된 비밀번호를 확인해보장~</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>