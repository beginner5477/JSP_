<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("abc", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	function pageSizeCheck() {
		let pageSize = document.getElementById("sel").value;
		location.href ="${ctp}/GuestList?page=${page}&pageSize="+pageSize;
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2 class="text-center">방명록 리스트</h2>
	
	<table class="table table-borderless">
			<tr>
				<td><a href="#" class="btn btn-primary">관리자</a></td>
				<td><a href="${ctp}/guest/guestInput.jsp" class="btn btn-primary">글쓰기</a></td>
				<td>
					<c:if test="${pag > 1}"><a href="${ctp}/GuestList?pag=${pag-1}&pageSize=${pageSize}">←</a></c:if>
					<c:if test="${pag < totPage}"><a href="${ctp}/GuestList?pag=${pag+1}&pageSize=${pageSize}">→</a></c:if>
					<a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}">첫 페이지</a>
					<a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}">마지막 페이지</a>
					${pag}/${totPage}
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-right">
					<select name="sel" id="sel" onchange="pageSizeCheck()">
						<option <c:if test="${pageSize == 1}">selected</c:if>>1</option>
						<option <c:if test="${pageSize == 2}">selected</c:if>>2</option>
						<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
						<option <c:if test="${pageSize == 4}">selected</c:if>>4</option>
						<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
						<option <c:if test="${pageSize == 6}">selected</c:if>>6</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>번호: ${vo.idx}</th>
				<th>방문IP: ${vo.guestIP}</th>
			</tr>
		</table>
	<c:set var="curScrStartNo" value="${curScrStartNo}"/>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<th>번호: ${curScrStartNo}</th>
				<th>방문IP: ${vo.guestIP}</th>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${vo.name}</td>
				<th>방문일자</th>
				<td>${vo.visitDate}</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">${vo.homePage}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${fn:replace(vo.content,abc,"<br/>")}</td>
			</tr>
		</table>
		<br/>
		<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	</c:forEach>
	<!-- 블록 페이지 시작 -->
	<div class="text-center">
		<c:if test="${curBlock > 0}"><a href="${ctp}/GuestList?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></c:if>
		<c:if test="${curBlock != lastBlock}">
		<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+1+(blockSize-1)}">
			<c:if test="${i==pag}"><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}"><font color="red"><b>[${i}]</b></font></a></c:if> 
			<c:if test="${i!=pag}"><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></c:if> 
		</c:forEach>
		</c:if>
		<c:if test="${curBlock == lastBlock}">
		<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+(totPage % blockSize)}">
			<c:if test="${i==pag}"><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}"><font color="red"><b>[${i}]</b></font></a></c:if> 
			<c:if test="${i!=pag}"><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></c:if> 
		</c:forEach>
		</c:if>
		
		<c:if test="${curBlock < lastBlock}"><a href="${ctp}/GuestList?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></c:if>
	</div>
	
	<!-- 블록 페이지 끝 -->
	
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
