<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*,Project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color:dimgrey">
<nav class="navbar fixed-top bg-light ">
<img src="Images/logo.png" width="45px" height="35px">
<a class="navbar-brand text-dark"><b >Artistry Events</b></a>
<ul class="nav">
<li class="nav-item"><a class="nav-link active" href="#" data-toggle="modal" data-target="#CreateEvent">Create Event</a></li>
<li class="nav-item"><a class="nav-link " href="#" data-toggle="modal" data-target="#UpdateEvent">Update Event</a></li>
<li class="nav-item"><a class="nav-link" href="NewRegisterServlet">Check Registered People</a> </li>
<li class="nav-item"><a class="nav-link " href="CreateTicketServlet">Events Ticket details</a></li>
<li class="nav-item"><a class="nav-link" href="NewRegisterServlet">Check new Register</a></li>
<form action="LogoutServlet">
					<button class="btn btn-default" style="color:rgb(0, 129, 209);">Logout</button>
					</form>
</ul>
</nav>
<div class="container-fluid text-white"style="margin-top:5%">
<h3 style="text-align:center"><b>Welcome Back  Admin!!</b></h3>
<div class="row">
<div class="col-12">

About Events is a creative Destination Management Company in Spain (Barcelona, Madrid, Andalusia, Valencia, Alicante, Basque Country, Canary Islands and Balearic Islands)

All our projects are the result of a combination of creativity, innovation and flexibility. With more than 15 years of experience in the tourism industry around the world, our services reach the highest standards resulting in successful meetings and events for our clients. Members of the industry association Meeting Professional International (MPI) we stay on top of the latest trends and have a strong network in and around Spain.

Clients can expect a structured approach and fast response times to meet the needs of international business.

Our highly trained staff speak multiple languages and is happy to respond to your requests in: English, French, German, Spanish, Catalan, Greek or Italian.

We truly enjoy working with and for our clients!

Our Mission statement: To generate value for our clients in order to provide them with an outstanding event experience by adapting our creative ideas, innovative projects, flexible operations and international mentality to their needs.
About Events is a creative Destination Management Company in Spain (Barcelona, Madrid, Andalusia, Valencia, Alicante, Basque Country, Canary Islands and Balearic Islands)

</div>
</div>
</div>
<!--   All Register display -->
<div class="modal" id="allregister">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Registered Details</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div> 

      <!-- Modal body -->
      <div class="modal-body">
<%
ArrayList users = (ArrayList)request.getAttribute("details");
if (request.getAttribute("details")!= null) {
%>
<table class="table table-hover">
<tr>
<th>UserName</th>
<th>Email</th>
<th>Name</th>
<th>Gender</th>
</tr>
<%
Iterator<users> itr=users.iterator();

while(itr.hasNext())
{
	
users use =itr.next();
%>
<tr>
<td><%=use.getUsername()%></td>
<td><%=use.getEmail() %></td>
<td><%=use.getName() %></td>
<td><%=use.getGender() %></td>

</tr>
<%
}
} %>
</table>
</div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!--   New Register display -->
<div class="modal" id="newregister">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Registered Details</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div> 

      <!-- Modal body -->
      <div class="modal-body">
<%
ArrayList users1 = (ArrayList)request.getAttribute("details");
if (request.getAttribute("details")!= null) {
%>
<table class="table table-hover">
<tr>
<th>UserName</th>
<th>Email</th>
<th>Name</th>
<th>Gender</th>
</tr>
<%
Iterator<users> itr=users1.iterator();

while(itr.hasNext())
{
	
users use1 =itr.next();
%>
<tr>
<td><%=use1.getUsername()%></td>
<td><%=use1.getEmail() %></td>
<td><%=use1.getName() %></td>
<td><%=use1.getGender() %></td>

</tr>
<%
}
} %>
</table>
</div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!--   Update Event  -->
<!-- The Modal -->
<div class="modal" id="UpdateEvent">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Update by Event Id</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <form action="UpateEvent">
      <label class="form-group">Enter the Event Id</label>
       <input type="text" name="eventid" class="form-control" id="eventid" required>
        <button type="submit" class="btn btn-primary mt-2" >Update By Event id</button>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- Create Event -->
<!-- The Modal -->
<div class="modal" id="CreateEvent">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Creating The Event</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <form method="post" action="CreateEvent" onsubmit="return eventvalidate()">
       <label class="form-group">Event Id</label>
       <input type="text" class="form-control" name="eventid" id="eventid" required>
       <label class="form-group">Event Name</label><span id="span1"></span>
       <textarea class="form-control" name="eventname" id="eventname"></textarea>
       <label class="form-group" >EventDate</label>
       <input type="date" class="form-control" name="eventdate" required>
              <label class="form-group" >Event Time</label>
       <input type="time" class="form-control" name="eventtime" required>
       <label class="form-group" >Type of Event</label>
       <select required class="form-control" name="eventtype">
       <option selected="true" value="" disabled="disabled">Please Select the Event Type</option>
       <option value="Conference">Conference</option>
       <option value="Coperate" >Coperate</option>
       <option value="Conserts" >Conserts</option>
       <option value="Auction" >Auction</option>
       <option value="Wedding" >Wedding</option>
       <option value="Exhibition" >Exhibition</option>
       <option value="Party" >Party</option>
       <option value="Birthday">Birthday</option>
       <option value="NewProduct" >NewProduct</option>
       </select>
       <label class="form-group">Venue</label>
		<textarea class="form-control"  name="venue" id="venue" required></textarea>
		       <label class="form-group">No of tickets</label><span id="span2"></span>
       <input type="number" class="form-control" name="nooftickets" id="nooftickets" required>
		<button type="submit" class="btn btn-primary mt-2" >Submit</button>
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<!--  Tickets display -->

<!-- The Modal -->
<div class="modal" id="Ticketdetails">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Event Ticket Details</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
<%
ArrayList usertickets = (ArrayList)request.getAttribute("eventdetail");
if (request.getAttribute("eventdetail")!= null) {
%>
<table class="table table-hover">
<tr>
<th>Event id</th>
<th>Event name</th>
<th>No of Tickets</th>
</tr>
<%
Iterator<insertEvent> itr= usertickets.iterator();

while(itr.hasNext())
{
	
	insertEvent use =itr.next();
%>
<tr>
<td><%=use.getEventid() %></td>
<td><%= use.getEventname() %></td>
<td><%=use.getNooftickets() %></td>
</tr>
<%
}
} %>
</table>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
function eventvalidate(){
	var name=document.getElementById("eventname").value;
	var id=document.getElementById("eventid").value;
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
