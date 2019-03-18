package Project;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class dataUpdate
 */
@WebServlet("/dataUpdate")
public class dataUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dataUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		String search =(String)session.getAttribute("search");
		String eventid=request.getParameter("eventid");
		String eventname=request.getParameter("eventname");
		String date=request.getParameter("eventdate");
		String time=request.getParameter("eventtime");
		String venue=request.getParameter("eventvenue");
		String eventtype=request.getParameter("eventtype");
		int nooftickets=Integer.parseInt(request.getParameter("nooftickets"));
		Connection con= Consql.getConnection();
		insertEvent idetails=new insertEvent();
		idetails.setEventid(eventid);
		idetails.setEventname(eventname);
		idetails.setEventdate(date);
		idetails.setEventtime(time);
		idetails.setVenue(venue);
		idetails.setEventtype(eventtype);
		idetails.setNooftickets(nooftickets);
		Consql.update(search, idetails, con);
		RequestDispatcher grd=request.getRequestDispatcher("Admin.jsp");
		grd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
