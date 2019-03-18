<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,Project.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="Register.css">
</head>
<body>
<div class="container-fluid">
<div class="row">
<div class="col-6" style="margin-top:190px"  title="Welcome!!">
<span style="font-size: 3vw">Sign Up</span>
</div>
<div class="col-6 mt-2 " >
<form method="post" onsubmit="return register()" action="RegisterServlet">
<label for="name"><i>Name</i></label><span id="sp1" style="font-size:15px"></span>
<input type="text" id="name" name="name" class="form-control" placeholder="Firstname">
<label for="email"><i>Email</i></label>
<input type="email" id="email"class="form-control"name="email"placeholder="Email" >
<label for="username"><i>Username</i></label><span id="sp2" style="font-size:15px"></span>
<input type="text" id="username" name="username" class="form-control"placeholder="Username">
<label for="password1"><i>Password</i></label><span id="sp3" style="font-size:15px"></span>
<input type="password" id="password1" name="password"class="form-control"placeholder="Password">
<input type="password" id="password2"class="form-control mt-3"placeholder="Retype-Password" onchange="retype()">
<input type="checkbox" class="mt-3" onclick="showpassword()">
<label>Show Password</label><br/>
<label>Gender</label><span id="sp4" style="font-size:15px"></span>
	<div class="ml-5">
		<input type="radio" class="sex" name="sex" value="male"> Male<br/>
		<input type="radio" class="sex" name="sex" value="female"> Female<br/>
		<input type="radio" class="sex" name="sex" value="transgender"> Trans gender<br/>
	</div>
<button type="submit"  class="submit  mt-3" style="outline: none">Submit</button>
</form>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
function register(){
	var name = document.getElementById("name").value.trim();
	var user = document.getElementById("username").value.trim();
	var pass1=document.getElementById("password1").value.trim();
	var pass2=document.getElementById("password2").value.trim();
	if(!genvalidation()){
		document.getElementById("sp4").innerHTML="please enter the gender";
		document.getElementById("sp4").style.color="red"; 
 }
	if(namevalidation(name)&&uservalidation(user)&&passvalidation(pass1,pass2)&&retype()&&genvalidation()){
		
		return true;
	}
	else{
	return false;
	}
}
	//name validation//
	function namevalidation(name){
	var pattern="^[A-Za-z ]+$";
	if(name==""){
		document.getElementById("sp1").innerHTML="!!Please fill the field!!";
		document.getElementById("sp1").style.color="red";
		return false;
	}
	else if(name.match(pattern)!=null){document.getElementById("sp1").innerHTML="";
	return true;
	}
	else{
		document.getElementById("sp1").innerHTML="!!Please fill with valid pattern!!";
		document.getElementById("sp1").style.color="red";
	return false;
	}
	}
	//user validation//
	function uservalidation(user)
	{
	var pattern="^[A-Za-z0-9 ]+$";
	if(user==""){
		document.getElementById("sp2").innerHTML="please enter the username";
		document.getElementById("sp2").style.color="red";
		return false;
	}
	else if(user.match(pattern)!=null){
	return true;
	}
	else{
		document.getElementById("sp2").innerHTML="please fill  valid username";
		document.getElementById("sp2").style.color="red";
	return false;
	}
	}

	// password validation//
	function passvalidation(pass1,pass2){
		var pattern="^[A-Za-z0-9 !@#$%^&*]+$";
		if(pass1.match(pattern)!=null&&pass2.match(pattern)!=null){
			
			return true;
		}
		else if(pass1==""||pass2==""){
			document.getElementById("sp3").innerHTML="please enter the password";
			document.getElementById("sp3").style.color="red";
			return false;
		}
		else{
			return false;
		}
	}
	// retype pass//
	function retype(){
		var pass1=document.getElementById("password1").value.trim();
		var pass2=document.getElementById("password2").value.trim();
		if(pass1==pass2){
			return true;
		}
		else{
			alert("password miss match");
			return false;
		}
	}
	//show password//
	function showpassword(){
		var pass1=document.getElementById("password1");
		var pass2=document.getElementById("password2");
		
		if(pass1.type=="password"){
			pass1.type="text";
			pass2.type="text";
		}
		else{
			pass1.type="password";
			pass2.type="password";
		}
	}
	//gender validation//
	function genvalidation(){
		 var arr=document.getElementsByClassName("sex");
		 for(var i=0;i<arr.length;i++){
	            if(arr[i].checked){
	            	return true;
	               
	            }
	       
	}
		 
	}
	
</script>
</body>
</html>