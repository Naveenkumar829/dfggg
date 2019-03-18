<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,Project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<center style="color:blue"><h3>Welcome to  New Product Events!!!</h3></center>
<div class="container-fluid">
<div class="row">
<div class="col-4">
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Booking for NewProduct events</h4>
        <button type="button" class="close" data-dismiss="modal" style="outline: none">&times;</button>
      </div> 

      <!-- Modal body -->
      <div class="modal-body">

           <%
ArrayList NewProductEvent = (ArrayList)request.getAttribute("NewProductEvent");
if (NewProductEvent.size()!=0) {
%>
<form method="post" action="TicketGenServlet">
        <label class="form-group">Event Id</label>
<select required name="eventid" class="form-control"><option selected="true" value="" disabled="disabled"> please select the event id</option>
<%
Iterator<insertEvent> itr= NewProductEvent.iterator();

while(itr.hasNext())
{
	
insertEvent use =itr.next();
%>

<option  value=<%=use.getEventid()%>><%= use.getEventid() %></option>
<% 
}%></select>
        
        
        
        <label class="form-group mt-2">No of Tickets</label>
        <input name="nooftickets" type="number" class="form-control" required>
        <button type="submit" class="btn btn-primary mt-2">Submit</button>
        </form>
<%
}
else{ %>
        <b>Currently there  are No Events</b> <%} %>        
        
        
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<div  style="font-size:20px;background-color:rgb(104, 252, 244)">
<div style="font-size:20px">
<p style="color:grey"><span style="color:red;margin-left:120px">*</span> Current Events<br/>
<marquee behaviour="scroll" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
<a href="#" style="color:grey" >
LADIES NIGHT
Panic on the Dance Floor - Poolside Ladies
Taj MG Road, Bengaluru
Fri, 1 Mar , 9:00PM <sup style="color:red">New</sup></a><br/>
<a href="#"  style="color:grey">LADIES NIGHT
Panic on the Dance Floor - Poolside Ladies
Taj MG Road, Bengaluru
Fri, 07 Mar , 9:00PM  <sup style="color:red">New</sup></a><br/>
<a href="#"  style="color:grey">LADIES NIGHT
Panic on the Dance Floor - Poolside Ladies
Taj MG Road, Bengaluru
Fri, 07 Mar , 9:00PM <sup style="color:red">New</sup></a><br/>
<a href="#"  style="color:grey">LADIES NIGHT
Panic on the Dance Floor - Poolside Ladies
Taj MG Road, Bengaluru
Fri, 07 Mar , 9:00PM  <sup style="color:red">New</sup></a><br/>
<a href="#"  style="color:grey">LADIES NIGHT
Panic on the Dance Floor - Poolside Ladies
Taj MG Road, Bengaluru
Fri, 07 Mar , 9:00PM  <sup style="color:red">New</sup></a><br/>
</marquee>
</p>
</div></div>
</div>
<div class="col-8">
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item">
      <img src="Images\Newproduct\newproduct1.jpg"" alt="Los Angeles" style="width:800px;height:380px">
    </div>
    <div class="carousel-item  active">
      <img src="Images\Newproduct\product2.jpg" alt="Hard Rock Cafe"style="width:800px;height:380px">
    </div>
    <div class="carousel-item">
      <img src="Images\Newproduct\product3.jpg" alt="Strom festival"style="width:800px;height:380px">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
  </div>
  <div class="mt-4" style="color:black;margin-left:25%">
 <b> Legato Project seminar conference!!</b>
<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" style="margin-left:10px" data-toggle="modal" data-target="#myModal">
  Book a Ticket
</button>
</div>
<div class="mt-4">
<marquee behaviour="scroll" direction="left" onmouseover="this.stop()" onmouseout="this.start()" style="color:red"><h5>For details contact us +91 9848022338,+91 9666344636</h5>
</marquee></div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>