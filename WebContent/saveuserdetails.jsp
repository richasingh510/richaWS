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
String url = "jdbc:mysql://localhost:3306/logindb";
String user = "root";
String dbpsw = "personal";

String sql = "insert into userprofile (FirstName,LastName,UserName,password) values (?,?,?,?)";
String firstname= request.getParameter("firstname");
String lastname= request.getParameter("lastname");
String name = request.getParameter("name");
String password = request.getParameter("password");


if((!(firstname.equals(null) || firstname.equals("")) && !(lastname.equals(null) || lastname.equals("")) && !(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals("")))) 
{
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1, firstname);
		ps.setString(2, lastname);
		ps.setString(3, name);
		ps.setString(4, password);
		
		int success = ps.executeUpdate();
		
		if(success == 1)
			response.sendRedirect("home.jsp");	
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
	
		<center><p style="color:red">Error In Login</p></center>
		<% 
	getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>
