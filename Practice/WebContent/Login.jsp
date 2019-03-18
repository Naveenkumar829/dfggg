<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body onsubmit="return validate()">
<form  action="NextPage.jsp" >
<label>UserName:</label><br/> 
<input type="text"  name="name" id="name"/><br/>
<label>PassWord:</label><br/>
<input type="password"  name="password" id="pwd"/>
  <a href="#" onclick="showpass()"> <img src="1.jpg" width="10px" height="10px" /></a><br/>
  <span id="span1"> </span><br/>
<span id="span2"></span><br/>
<input type="submit" value="Login">
</form>
<script>
function validate(){
	var username=document.getElementById("name").value;
	var password=document.getElementById("pwd").value;
	password=password.toLowerCase();
	//console.log(username=="admin");
	if(username=="admin" && password=="admin"){
		document.getElementById("span1").innerHTML="success";
		return true;
	}
	else{
		document.getElementById("span1").innerHTML="invalid credentials";
		return false;
	}
}	 
	
function showpass(){
	var r=document.getElementById("pwd");
	if(r.type=="text"){
		r.type="password";
}
	else{
		r.type="text";
		}
	}

</script>

</body>
</html>