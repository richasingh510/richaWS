<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Confirm</title>
</head>
<body>
<p>Payment Successful</p>
	<%
Connection con= null;
PreparedStatement ps1 = null;
PreparedStatement ps2 = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String username = "root";
String dbpassword = "personal";

String sql = "insert into useraccount (itemname,itemprice,itemquantity,email,accounttype)values (?,?,?,?,?)";

String itemname = session.getAttribute("itemname").toString();
double price = Double.parseDouble(session.getAttribute("itemprice").toString());
int quantity = Integer.parseInt(session.getAttribute("itemquantity").toString());
String buyer = session.getAttribute("email").toString();
String seller = session.getAttribute("seller").toString();


	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, username, dbpassword);
		ps1 = con.prepareStatement(sql);
		ps1.setString(1, itemname);
		ps1.setDouble(2, price);
		ps1.setInt(3, quantity);
		ps1.setString(4, seller);
		ps1.setString(5, "seller");
		ps1.executeUpdate();
		
		
		ps2= con.prepareStatement(sql);
		ps2.setString(1, itemname);
		ps2.setDouble(2, price);
		ps2.setInt(3, quantity);
		ps2.setString(4, buyer);
		ps2.setString(5, "buyer");
		ps2.executeUpdate();
		
	
		ps1.close();
		ps2.close();
	}
		
	catch(SQLException sqe)
	{
		out.println(sqe);
	}
	%>
	
	<a href="myaccount.jsp">My Account</a>

	

</body>
</html>