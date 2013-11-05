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


<p>Welcome, <%=session.getAttribute("email")%></p>
<p><a href="postAdvertisement.jsp">Post Advertisement</a>
<p><a href="logout.jsp">Logout</a>

<%! String itemname, itemdescription, seller;
double itemprice;
int itemquantity;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/marketplace";
String user = "root";
String dbpsw = "personal";

String sql = "select * from advertisements";

	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		%>
		<table border="1">
		<tr>
		<td> Item Name </td>
		<td> Item Description </td>
		<td> Item Price </td>
		<td> Item Quantity </td>
		<td> Seller </td>
		<td> </td>
		</tr>
		<%
		while(rs.next())
		{			
			itemname = rs.getString("itemname");
			itemdescription = rs.getString("itemdescription");
			itemprice = rs.getDouble("itemprice");
			itemquantity = rs.getInt("itemquantity");
			seller = rs.getString("seller");
			
			%>
	
	<tr>
		<td><%=itemname%></td>
		<td><%=itemdescription%></td>
		<td><%=itemprice%></td>
		<td><%=itemquantity%></td>
		<td><%=seller%></td>
		<form method="post" action="addtocart.jsp">
		<td><input type="submit" value="AddToCart"/></td>
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