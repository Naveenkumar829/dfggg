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
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession login=request.getSession();
		Connection con= Consql.getConnection();
		String username=request.getParameter("username").trim();
		String pass=request.getParameter("password").trim();
		if(username.equals("admin")&&pass.equals("admin")) {
			RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
			rd.include(request, response);
				
		}
		else if(Consql.login(username,pass,con)) {
			RequestDispatcher rd=request.getRequestDispatcher("Home.html");
			rd.forward(request, response);

			
		}
		else{
			PrintWriter pw= response.getWriter();
			response.setContentType("text/html");
			RequestDispatcher rd=request.getRequestDispatcher("Login.html");
			rd.include(request, response);
			pw.write("<script>alert('Invalid Username or Invalid Password');</script>");
			
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
