<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String[] img2 = request.getParameterValues("img2");
	String res = "";
	String jud = request.getParameter("jud");
	if(jud == null) jud = "";
	if(jud.equals("a")&&img2!=null)
	{
		for(int i = 0; i < img2.length; i++) {
			res += "<img src='"+request.getContextPath()+"/images/"+img2[i]+".jpg' width='50%'/><br/>";
		} 
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t08.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	window.onload = () => {
	  	function picPrint() {
	  		if("<%=jud%>" == "a") {
	  			document.getElementById("demo").innerHTML = "<%=res%>";
	  		}
	  	}
	  	picPrint();
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>아래 콤보상자에서 그림파일을 선택하면 선택된 그림을 화면에 출력시켜주시오.</h2>
  <hr/>
  <form action="t08_이미지숙제.jsp">
	  	<input type="hidden" name="jud" value="a"/>
	  <div>그림선택
	    <select name="img2" size="5" multiple>
	      <option>111</option>
	      <option>112</option>
	      <option>113</option>
	      <option>114</option>
	      <option>115</option>
	    </select>
	    <input type="submit" value="그림출력"/>
	  </div>
  </form>
  <div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>