<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
Employee Inventory management system<%= session.getAttribute("session")%>

<pre>
<input type="button" name="Display All"  value="Display All"/><br/>

<input type="button" name="Search By User_Id"  value="Search By User_Id"/>
</pre>
</form>
</body>
</html>