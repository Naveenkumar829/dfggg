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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username").trim();
		String pass=request.getParameter("password").trim();
		String name=request.getParameter("name").trim();
		String email=request.getParameter("email").trim();
		String gender=request.getParameter("sex").trim();
		Connection con= Consql.getConnection();
		if(Consql.Register(username,pass,email,name,gender,con)) {
			RequestDispatcher grd=request.getRequestDispatcher("Login.html");
			grd.include(request, response);
			

			
		}
		else{
			PrintWriter w= response.getWriter();
			response.setContentType("text/html");
			w.write("<b style='color:red'><center>Username Exists</center></b>");
			RequestDispatcher grd=request.getRequestDispatcher("Register.jsp");
			grd.include(request, response);
			
			
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
