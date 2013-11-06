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
<%! String itemName, buyername;
double itemPrice;
int quantity;

%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String username = "root";
String dbpassword = "personal";

String sql = "insert into shoppingcart (buyer,itemname,itemprice,itemquantity) values (?,?,?,?)";
String itemname= request.getParameter("itemname");
double itemprice = Double.parseDouble(request.getParameter("itemprice"));
int itemquantity = Integer.parseInt(request.getParameter("itemquantity"));;
String buyer = session.getAttribute("email").toString();


if(( !(buyer.equals(null) || buyer.equals("")) && !(itemname.equals(null) || itemname.equals(""))))
{
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, username, dbpassword);
		ps = con.prepareStatement(sql);
		ps.setString(1, buyer);
		ps.setString(2, itemname);
		ps.setDouble(3, itemprice);
		ps.setInt(4, itemquantity);
	
		
		int success = ps.executeUpdate();
		
		if(success == 1)
			response.sendRedirect("shoppingcart.jsp");	
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
