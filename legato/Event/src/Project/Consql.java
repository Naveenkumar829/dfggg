package Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

public class Consql {
	public static Connection getConnection() {
		try {
		//load driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		//create the connection
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ArtistryEvents","root","admin");
		return con;
		}
		catch(ClassNotFoundException|SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static boolean login(String x,String y,Connection Con) {
		Boolean flag=false;
		try {
			String sqlExceute="select * from  ArtistryEvents.register where username=?and password=? ";
			PreparedStatement pstmt = Con.prepareStatement(sqlExceute);
			pstmt.setString(1,x);
			pstmt.setString(2,y);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				flag =true;
				break;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
		
	}
	public static boolean Register(String v,String w,String x,String y,String z,Connection Con) {
		
		Boolean flag=false;
		if(!validate(v,Con)) {
		try {
			
			String sqlExceute="insert into ArtistryEvents.register values(?,?,?,?,?)";
			PreparedStatement pstmt = Con.prepareStatement(sqlExceute);
			pstmt.setString(1,v);
			pstmt.setString(2,w);
			pstmt.setString(3,x);
			pstmt.setString(4,y);
			pstmt.setString(5,z);
			pstmt.executeUpdate();
			pstmt.close();
			
				flag =true;
			
			}
			
		 catch (SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
			flag=false;
		}
		
	
		}
		
		return flag;
		
	}
private static boolean validate(String v,Connection con) {
		// TODO Auto-generated method stub
	boolean flag=false;
	
	String sql="select * from ArtistryEvents.register where username=?";
	PreparedStatement pstmt;
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,v);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			return true;
		}
		pstmt.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return flag;
	}

public static ArrayList<users> displayall(Connection Con) {
	try {
		String sql="select * from ArtistryEvents.register";
		PreparedStatement pstmt = Con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<users> a1=new ArrayList<users>();
		while(rs.next()) {
			users us = new users();
			us.setUsername(rs.getString(1));
			us.setPassword(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setName(rs.getString(4));
			us.setGender(rs.getString(5));
			a1.add(us);
		}
		return a1;
	}
	catch(SQLException e){
		
		e.printStackTrace();
		return null;
	}
			
		
		
	}
//Events Display/
public static ArrayList<insertEvent> displayevent(Connection Con) {
	boolean flag=false;
	try {
		String sql="select * from ArtistryEvents.insertevents";
		PreparedStatement pstmt = Con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<insertEvent> a1=new ArrayList<insertEvent>();
		while(rs.next()) {
			insertEvent us = new insertEvent();
			us.setEventid(rs.getString(1));
			us.setEventname(rs.getString(2));
			us.setEventdate(rs.getString(3));
			us.setEventtime(rs.getString(4));
			us.setEventtype(rs.getString(5));
			us.setVenue(rs.getString(6));
			us.setNooftickets(rs.getInt(7));
			a1.add(us);
			
		}
		return a1;
		
	}
	catch(SQLException e){
		
		e.printStackTrace();
		return null;
	}
			
		
		
	}
public static ArrayList<insertEvent> displayevents(Connection Con ,String x) {
	try {
		String sql="select * from ArtistryEvents.insertevents where type=?";
		PreparedStatement pstmt = Con.prepareStatement(sql);
		pstmt.setString(1,x);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<insertEvent> a1=new ArrayList<insertEvent>();
		while(rs.next()) {
			insertEvent us = new insertEvent();
			us.setEventid(rs.getString(1));
			us.setEventname(rs.getString(2));
			us.setEventdate(rs.getString(3));
			us.setEventtime(rs.getString(4));
			us.setEventtype(rs.getString(5));
			us.setVenue(rs.getString(6));
			us.setNooftickets(rs.getInt(7));
			a1.add(us);
			
		}
		return a1;
		
	}
	catch(SQLException e){
		
		e.printStackTrace();
		return null;
	}
			
		
		
	}

public static boolean insertevent(insertEvent eventdetails,Connection con) {
	boolean flag=false;
	if(!eventidvalidate(eventdetails.getEventid(),con)) {
	try {
	String sql="insert into ArtistryEvents.insertevents values(?,?,?,?,?,?,?)";
	PreparedStatement pstmst=con.prepareStatement(sql);
	pstmst.setString(1,eventdetails.getEventid());
	pstmst.setString(2, eventdetails.getEventname());
	pstmst.setString(3,eventdetails.getEventdate() );
	pstmst.setString(4,eventdetails.getEventtime());
	pstmst.setString(5,eventdetails.getVenue());
	pstmst.setString(6, eventdetails.getEventtype());
	pstmst.setInt(7,eventdetails.getNooftickets());
	pstmst.executeUpdate();
	flag=true;
	pstmst.close();
	}
	catch(SQLException e){
		e.printStackTrace();
		
	}}
	return flag;
	
}
public static   ArrayList<insertEvent> display(String search,Connection con){
	String sql="select * from ArtistryEvents.insertevents where eventid=?";
	try {
		PreparedStatement pstmst=con.prepareStatement(sql);
		pstmst.setString(1, search);
		ArrayList<insertEvent> a1=new ArrayList<insertEvent>();
		ResultSet rs=pstmst.executeQuery();
		while(rs.next()) {
			insertEvent eventdetails=new insertEvent();
			eventdetails.setEventid(rs.getString(1));
			eventdetails.setEventname(rs.getString(2));
			eventdetails.setEventdate(rs.getString(3));
			eventdetails.setEventtime(rs.getString(4));
			eventdetails.setVenue(rs.getString(5));
			eventdetails.setEventtype(rs.getString(6));
			eventdetails.setNooftickets(rs.getInt(7));
			a1.add(eventdetails);
		}
		return a1;
		
	}
	catch(SQLException e) {
		e.printStackTrace();		
	}
	return null;
}
public static boolean eventidvalidate(String search,Connection con){
	boolean flag=false;
	String sql="select * from ArtistryEvents.insertevents where eventid=?";
	try {
		PreparedStatement pstmst=con.prepareStatement(sql);
		pstmst.setString(1, search);

		ResultSet rs=pstmst.executeQuery();
		while(rs.next()) {
			return true;
		}
		pstmst.close();
		
	}
	catch(SQLException e) {
		e.printStackTrace();		
	}
	return flag;
}

public static void update(String search,insertEvent idetails,Connection con) {
	
	String sql="update ArtistryEvents.insertevents set eventid=?,eventname=?,date=?,time=?,venue=?,type=?,nooftickets=? where eventid=?";
	try {
		
	PreparedStatement pstmt=con.prepareStatement(sql);
	
	pstmt.setString(1, idetails.getEventid());
	 pstmt.setString(2,idetails.getEventname());
	 pstmt.setString(3,idetails.getEventdate());
	 pstmt.setString(4,idetails.getEventtime());
	 pstmt.setString(5,idetails.getVenue());
	 pstmt.setString(6, idetails.getEventtype());
	 pstmt.setInt(7, idetails.getNooftickets());
	 pstmt.setString(8,search);
	 pstmt.executeUpdate();
	 pstmt.close();
	 con.close();
	
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();

}
}
//ticket gen//
public static void ticketdisplay(Connection Con ,String x,int tickets) {
	try {
		String sql="select * from ArtistryEvents.insertevents where eventid=?";
		PreparedStatement pstmt = Con.prepareStatement(sql);
		pstmt.setString(1,x);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<insertEvent> a1=new ArrayList<insertEvent>();
		while(rs.next()) {
			
			int Admintickets=rs.getInt(7);
			
			Admintickets=Admintickets-tickets;
			String sqls="update ArtistryEvents.insertevents set eventid=?,eventname=?,date=?,time=?,venue=?,type=?,nooftickets=? where eventid=?";
			try {
				
			PreparedStatement ptmt=Con.prepareStatement(sqls);
			ptmt.setString(1, rs.getString(1));
			ptmt.setString(2, rs.getString(2));
			ptmt.setString(3, rs.getString(3));
			ptmt.setString(4, rs.getString(4));
			ptmt.setString(5, rs.getString(5));
			ptmt.setString(6, rs.getString(6));
			ptmt.setInt(7,Admintickets);
			ptmt.setString(8,x);
			 
			 
			 ptmt.executeUpdate();
			
			
		} catch (SQLException e) {
		//TODO Auto-generated catch block
		e.printStackTrace();

		}

		}

		
	}
	catch(SQLException e){
		
		e.printStackTrace();
	
	}
			
		
		
	}



	}
