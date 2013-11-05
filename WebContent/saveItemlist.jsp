<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Item details</title>
</head>
<body>
	<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String user = "root";
String dbpasswd = "personal";

String sql = "insert into advertisements (itemname,itemdescription,itemprice,itemquantity,seller,isSold) values (?,?,?,?,?,?)";

String name = request.getParameter("itemname");
String description = request.getParameter("itemdescription");
double price = Double.parseDouble(request.getParameter("itemprice"));
int quantity = Integer.parseInt(request.getParameter("itemquantity"));
String seller = session.getAttribute("email").toString();


if((!(name.equals(null) || name.equals("")) && !(description.equals(null) || description.equals("")) && !(seller.equals(null) || seller.equals(""))))
{
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpasswd);
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, description);
		ps.setDouble(3, price);
		ps.setInt(4, quantity);
		ps.setString(5, seller);
		ps.setInt(6, 0);
		int success = ps.executeUpdate();
		
		if(success == 1)
			response.sendRedirect("welcome.jsp");	
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

	<center>
		<p style="color: red">Error In posting Advertisement</p>
	</center>
	<% 
	getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>