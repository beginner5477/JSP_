<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("name", name);
%> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	function deleteCheck() {
		let ans = confirm("회원 삭제 하시겠습니까?");
		if(ans) {
			location.href = "${ctp}/database/LoginDelete?mid=${vo.mid}";
		}
	}
</script>

</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/database/UpdateOk">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">회원 정보</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${vo.mid}" autofocus readonly class="form-control"/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="${vo.pwd}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="${vo.name}" class="form-control"/></td>
      </tr>
      <tr>
        <th>나이</th>
        <td><input type="number" name="age" value="${vo.age}" class="form-control"/></td>
      </tr>
      <tr>
        <th>성별</th>
        <td><input type="radio" name="gender" value="남자"<c:if test="${vo.gender=='남자'}">checked</c:if>/>남자
        <input type="radio" name="gender" value="여자"<c:if test="${vo.gender=='여자'}">checked</c:if>/>여자</td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address" value="${vo.address}" class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="수정" class="btn btn-success mr-2"/>
          <input type="button" <c:if test="${vo.mid==sMid}"> value="탈퇴" </c:if> <c:if test="${vo.mid!=sMid}"> value="삭제" </c:if> onclick="deleteCheck()" class="btn btn-warning mr-2"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}"/>
  </form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
