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
	function idCheck1() {
		let mid = myform.mid.value;
		if(idCheck(mid) == "0") return false;
		$.ajax({
			url: "${ctp}/AjaxIdCheck2_1",
			type: "GET",
			data: {"mid" : mid},
			success: function(res) {
				$("#demo").html(res);
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	function idCheck2() {
		let mid = myform.mid.value;
		if(idCheck(mid) == "0") return false;
		$.ajax({
			url: "${ctp}/AjaxIdCheck2_2",
			type: "GET",
			data: {"mid" : mid},
			success: function(res) {
				$("#demo").html(res);
    			let str = res.split("/");
    			$("#imsiMid").html(str[0]);
    			$("#imsiName").html(str[1]);
    			$("#imsiAge").html(str[2]);
    			$("#imsiGender").html(str[3]);
    			$("#imsiAddress").html(str[4]);
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	function idCheck3() {
		let mid = myform.mid.value;
		if(idCheck(mid) == "0") return false;
		$.ajax({
			url: "${ctp}/AjaxIdCheck2_2",
			type: "GET",
			data: {"mid" : mid},
			success: function(res) {
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	function idCheck3() {
    	let mid = myform.mid.value;
    	if(idCheck(mid) == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxIdCheck2_3",
    		type :"get",
    		data : {mid : mid},
    		success:function(res) {
    			console.log("res : ", res);
    			$("#demo").html(res);
    			
    			let js = JSON.parse(res);
    			console.log("js : ", js);
    			
    			$("#imsiMid").html(js.mid);
    			$("#imsiName").html(js.name);
    			$("#imsiAge").html(js.age);
    			$("#imsiGender").html(js.gender);
    			$("#imsiAddress").html(js.address);
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
	function idCheck4() {
    	let mid = myform.mid.value;
    	if(idCheck(mid) == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxIdCheck2_4",
    		type :"get",
    		data : {"mid" : mid},
    		success:function(res) {
    			console.log("res : ", res);
    			$("#demo").html(res);
    			
    			let js = JSON.parse(res);
    			console.log("js : ", js);
    			
    			let tMid="", tName="", tAge="", tGender="", tAddress="";
    			for(let j of js) {
    				tMid += j.mid + "/";
    				tName += j.name + "/";
    				tAge += j.age + "/";
    				tGender += j.gender + "/";
    				tAddress += j.address + "/";
    			}
    			
    			$("#imsiMid").html(tMid);
    			$("#imsiName").html(tName);
    			$("#imsiAge").html(tAge);
    			$("#imsiGender").html(tGender);
    			$("#imsiAddress").html(tAddress);
    		},
    		error : function() {
    			alert("전송오류!!");
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
	<h3>AJAX 값 전달 연습</h3>
	<div>
		<form name="myform">
			아이디: <input type="text" name="mid" id="mid" class="form-control">
			<div>
				<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-primary mr-3"/>
			</div>
		</form>
		출력결과: <div id="demo">${param.mid}${param.name}</div>
	</div>
	 <div>
	    <div>아이디 : <span id="imsiMid"></span></div>
	    <div>성명 : <span id="imsiName"></span></div>
	    <div>나이 : <span id="imsiAge"></span></div>
	    <div>성별 : <span id="imsiGender"></span></div>
	    <div>주소 : <span id="imsiAddress"></span></div>
	  </div>
	<h2>HTTP통신</h2>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>