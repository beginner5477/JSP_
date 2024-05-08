<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	'use strict';
	function idCheck(mid) {
		if(mid.trim() == "") {
			alert("아이디를 입력하세요.");
			myform.mid.focus();
			return "0";
		}
	}
	function idCheck0() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag != "0") {
			location.href = "${ctp}/ajaxIdCheck1.st?mid="+mid;
		}
	}
	function idCheck1() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag == "0") return false;
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET","${ctp}/ajaxIdCheck2.st?mid="+mid);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				demo.innerHTML = xhr.responseText;
			}
		}
	}
	function idCheck2() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag == "0") return false;
		
		fetch("${ctp}/ajaxIdCheck2.st?mid="+mid)
			.then((res) => res.json())
			.then((res) => {
				console.log("res: "+ res);
			})
			.catch((error) => {
				console.log("error: "+error);
			})
	}
	function idCheck3() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag == "0") return false;
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "${ctp}/ajaxIdCheck2.st?mid="+mid);
		xhr.send();
		
		xhr.addEventListener("load",(e) => {
			console.log(e);
			if(e.target.status == 200) {
				demo.innerHTML = mid + e.target.responseText;
			} else {
				demo.innerHTML = "검색 서버 오류";
			}
		});
	}
	function idCheck4() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag == "0") return false;
		
		$.ajax({
			url: "${ctp}/AjaxIdCheck2_",
			type: "get",
			data: {"mid" : mid},	//앞이 서버 변수명이고 뒤가 jsp페이지 변수의 값임  
			/* dataType: "json", */
			contextType: "application/json",
			charset: "UTF-8",
			timeout: 1000,
			beforeSend: function() {
				console.log("mid(전송 전): ", mid);
			},
			success: function(res) {
				let str = "<font color='blue'>검색아이디: "+mid+", 성명: " + res+"</font>";
				$("#demo").html(str);
			},
			error: function() {
				alert("전송오류...");
			},
			complete: function() {
				console.log("mid(전송 후): ", mid);
			}
		});
	}
	function idCheck5() {
		let mid = myform.mid.value.trim();
		let flag = idCheck(mid);
		if(flag == "0") return false;
		
		$.ajax({
			url: "${ctp}/AjaxIdCheck2_",
			/* type: "get", */
			data: {"mid" : mid},	//앞이 서버 변수명이고 뒤가 jsp페이지 변수의 값임  
			success: function(res) {
				let str = "<font color='blue'>검색아이디: "+mid+", 성명: " + res+"</font>";
				$("#demo").html(str);
			},
			error: function() {
				alert("전송오류...");
			}
		});
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<div>
		<form name="myform">
			아이디: <input type="text" name="mid" id="mid" class="form-control">
			<div>
				<input type="button" value="아이디검색(동기식)" onclick="idCheck0()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(xhr식)" onclick="idCheck1()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(fetch식)" onclick="idCheck2()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(xhr식)" onclick="idCheck3()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(AJAX)" onclick="idCheck4()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(AJAX 생략버전)" onclick="idCheck5()" class="btn btn-primary mr-3"/>
			</div>
		</form>
		출력결과: <div id="demo">${param.mid}${param.name}</div>
	</div>
	<h2>HTTP통신</h2>
	<pre>
		동기식(Sysnchronous): 먼저 시작된 하나의 작업이 끝날때까지 다른 작업들은 시작하지 않고 기다렸다가, 그 작업이 끝나면 새로운 작업을 시작하는 방식
		비동기식(Asysnchronous) : 먼저 시작된 작업을 무시하고 다른 새로운 작업들이 시작되는 방식임.
		
		바닐라 자바스크립트(고전방식)의 비동기식: 브라우저의 XMLHttpRequest 사용함
		ECMA6 자바스크립트의 비동기식: 콜백함수, Promise, async/await, fetch()방식 등등이 있음.
		
		<h4>AJAX</h4>
		Asynchronous Javascript And Xml의 줄임말임
		자바스크립트 라이브러리 중에 하나이며 브라우저 객체인 XMLHttpRequest를 이용해서 전체 페이지를 고치지 않아도 부분적인 페이지 일부만을 위한 데이터를
		로드하는 기법임.
		과거에는 XML방식을 선호하였으나 현재는 JSON방식을 더 많이 사용중임.
		
		<h5>AJAX에서의 메소드(전송방식) 종류</h5>
		- GET: 데이터를 읽거나  주로 검색할 때 사용
		- POST: 새로운 리소스를 생성할 때 사용
		- PUT: 리소스를 생성/업데이트할 때 사용
		- DELETE: 지정된 리소스를 삭제할 때 사용
	</pre>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>