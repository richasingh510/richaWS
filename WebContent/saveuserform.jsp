<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userfName;
String userlName;
String userdbName;
String userdbPsw;

%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String username = "root";
String dbpassword = "personal";

String sql = "insert into checkout (firstname,lastname,email,country,phone,ccno,CCExpiresMonth,CCExpiresYear) values (?,?,?,?,?,?,?,?)";
String firstname= request.getParameter("firstname");
String lastname= request.getParameter("lastname");
String email = request.getParameter("email");
String country = request.getParameter("country");
int phone= Integer.parseInt(request.getParameter("phone"));
int ccno= Integer.parseInt(request.getParameter("ccno"));
int CCExpiresMonth= Integer.parseInt(request.getParameter("CCExpiresMonth"));
int CCExpiresYear= Integer.parseInt(request.getParameter("CCExpiresYear"));


if((!(firstname.equals(null) || firstname.equals("")) && !(lastname.equals(null) || lastname.equals("")) && !(email.equals(null) || email.equals("")) && !(country.equals(null) || country.equals("")))) 
{
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, username, dbpassword);
		ps = con.prepareStatement(sql);
		ps.setString(1, firstname);
		ps.setString(2, lastname);
		ps.setString(3, email);
		ps.setString(4, country);
		ps.setInt(5,phone);
		ps.setInt(6,ccno);
		ps.setInt(7,CCExpiresMonth);
		ps.setInt(8,CCExpiresYear);
		
		int success = ps.executeUpdate();
		
		if(success == 1)
			response.sendRedirect("paymentconfirm.jsp");	
		else
			response.sendRedirect("error.jsp");
		
		ps.close();				
		}
	catch(SQLException sqe)
	{
		out.println(sqe);
	}	
}
else
{
	%>
	
		<center><p style="color:red">Error In Signup</p></center>
		<% 
	getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>
