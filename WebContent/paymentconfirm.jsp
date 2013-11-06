<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>

<p>Payment Successfull</p>

<%! String itemname, buyer;
double itemprice;
int itemquantity;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String username = "root";
String dbpassword = "personal";

String sql = "select * from shoppingcart where buyer=?";

String buyer = session.getAttribute("email").toString();

	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, username, dbpassword);
		ps = con.prepareStatement(sql);
		ps.setString(1, buyer);
		rs = ps.executeQuery();
		%>
		<table border="1">
		<tr>
		<td> Item Name </td>
		<td> Item Price </td>
		<td> Item Quantity </td>
		<td> </td>
		</tr>
		<%
		while(rs.next())
		{			
			itemname = rs.getString("itemname");
			itemprice = rs.getDouble("itemprice");
			itemquantity = rs.getInt("itemquantity");
			
			%>

	<tr>
	<form method="post" action="checkout.jsp">
		<td><%=itemname%></td>
		<td><%=itemprice%></td>
		<td><%=itemquantity%></td>
		<td><input type="submit" value="CheckOut"/></td>
	</form>	
	</tr>


	<%
		}
		rs.close();
		ps.close();				
		}
	catch(SQLException sqe)
	{
		out.println(sqe);
	}	

%>
</table>

</body>
</html>