<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
</head>
<body>
<%! String email;
String pwd;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String username = "root";
String dbpassword = "personal";

String sql = "select email,password from userprofile where email=? and password=?";

String name = request.getParameter("email");
String password = request.getParameter("password");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
{
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, username, dbpassword);
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next())
		{			
			email = rs.getString("email");
			pwd = rs.getString("password");
			if(name.equals(email) && password.equals(pwd))
				{
					session.setAttribute("email",email);				
					response.sendRedirect("welcome.jsp");				
				}						   
		}
		else
			response.sendRedirect("error.jsp");
		rs.close();
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