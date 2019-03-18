<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,Project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Event</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body style="background-color:lightblue">
<div class="container-fluid">

<div class="row mt-4">
<div class="col-4" style="margin-top:10%;padding-left:5%">
<img src="Images\updategif.gif" width="250px" width="250px">
</div>
<div class="col-4 jumbotron text-dark">
<b style="margin-left:40%">Update Event</b></br>
<form method="post"class="form-group" action="dataUpdate" onsubmit="return eventvalidate()">
<%ArrayList<insertEvent> a1=(ArrayList)request.getAttribute("event");
Iterator<insertEvent> itr =a1.iterator();
if(itr.hasNext()){
while(itr.hasNext()){
	insertEvent id=itr.next();
	%>
	<label for="eventid">Event id</label>
	<input type="text" class="form-control" name="eventid" value=<%=id.getEventid() %> id="eventid">
       <label for="eventname">Event Name</label><span id="span1"></span>
       <textarea id="eventname" class="form-control" name="eventname"><%=id.getEventname() %></textarea>
       <label for="eventdate">EventDate</label>
       <input type="text"id="eventdate" class="form-control" value=<%=id.getEventdate() %> name="eventdate">
       <label for="eventtype">EventType</label>
       <input type="text"id="eventtype" class="form-control" value=<%=id.getEventtype()%> name="eventtype">
       <label for ="eventtime">Event Time</label>
       <input type="text" id="eventdate"class="form-control" value=<%=id.getEventtime() %> name="eventtime">
       <label for="venue">Venue</label>
		<textarea id="venue" class="form-control" name="eventvenue"><%=id.getVenue() %></textarea>
		    <label for ="nooftickets">NoofTickets</label><span id="span2"></span>
       <input type="number" id="nooftickets"class="form-control" value=<%=id.getNooftickets() %> name="nooftickets">
		<button type="submit" class="btn btn-primary mt-2">Update</button>
		<%}}else{ %><b style="color:red">Invalid Event id</b><%} %>
       </form>
       </div>
       <div class="col-4" style="margin-top:8%;padding-left:8%">
      <img src="Images/update2.gif" width="250px" height="250px">
       </div>
       </div>
       </div>
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
function eventvalidate(){
	var name=document.getElementById("eventname").value;
	
	var tickets=document.getElementById("nooftickets").value;
	if(eventname(name)&&ticketvalidation(tickets)){
		return true;
	}
	else{
		return false;
	}
}
function eventname(name){
var	pattern="^[A-Za-z]+$";
if(name.match(pattern)!=null){
	document.getElementById("span1").innerHTML="";

	return true;
}
else{
	document.getElementById("span1").innerHTML="eventname should be only alphabets";
	document.getElementById("span1").style.color="red";
	return false;
	
}}
function ticketvalidation(tickets){
	var pattern1="^[1-9]{1}[0-9]+$";
	if(tickets.match(pattern1)!=null){
		
		document.getElementById("span2").innerHTML="";
		return true;
	}
	else{
		document.getElementById("span2").innerHTML="no. of tickets cannot be negitive or 0";
		document.getElementById("span2").style.color="red";
		return false;
	}
}
	


</script>      
</body>
</html>