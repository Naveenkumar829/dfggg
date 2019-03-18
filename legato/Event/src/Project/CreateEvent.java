package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateEvent
 */
@WebServlet("/CreateEvent")
public class CreateEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String eventid=request.getParameter("eventid");
		String eventname=request.getParameter("eventname");
		String eventtime=request.getParameter("eventtime");
		String eventdate=request.getParameter("eventdate");
		String eventtype=request.getParameter("eventtype");
		String venue=request.getParameter("venue");
		int nooftickets=Integer.parseInt(request.getParameter("nooftickets"));
		Connection con= Consql.getConnection();
		insertEvent eventdetails=new insertEvent();
		eventdetails.setEventid(eventid);
		eventdetails.setEventname(eventname);
		eventdetails.setEventdate(eventdate);
		eventdetails.setEventtime(eventtime);
		eventdetails.setEventtype(eventtype);
		eventdetails.setNooftickets(nooftickets);
		eventdetails.setVenue(venue);
	if(Consql.insertevent(eventdetails, con)) {
		PrintWriter pw= response.getWriter();
		response.setContentType("text/html");
	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
	rd.include(request, response);}
	else {
		PrintWriter pw= response.getWriter();
		response.setContentType("text/html");
		pw.write("<script>alert('InvalidEventid');</script>");
		RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
		rd.include(request, response);
		
	}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
