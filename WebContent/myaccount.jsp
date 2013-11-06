<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account</title>
</head>
<body>

	<p>
		Welcome,
		<%=session.getAttribute("email")%></p>

		<a href="logout.jsp">Logout</a>

		<%!String itemname, itemdescription, seller;
	double itemprice;
	int itemquantity;%>
		<%
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String email = session.getAttribute("email").toString();

			String driverName = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/marketplace";
			String username = "root";
			String dbpassword = "personal";

			String sql = "select * from useraccount where email=? AND accounttype='seller'";

			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, username, dbpassword);
				ps = con.prepareStatement(sql);
				ps.setString(1, email);
				rs = ps.executeQuery();
		%>
	
	<br/>
	<br/>
	
	<table border="1">
		<tr>
			<td>Item Name</td>
			<td>SELL Price</td>
			<td>Quantity SOLD</td>
			<td></td>
		</tr>
		<%
			while (rs.next()) {
					itemname = rs.getString("itemname");
					itemprice = rs.getDouble("itemprice");
					itemquantity = rs.getInt("itemquantity");
		%>

		<tr>
			<td><%=itemname%></td>
			<td><%=itemprice%></td>
			<td><%=itemquantity%></td>
		</tr>

		<%
			}
				rs.close();
				ps.close();
			} catch (SQLException sqe) {
				out.println(sqe);
			}
		%>
	</table>
	
	<br/>
	<br/>
	
			<%

			sql = "select * from useraccount where email=? AND accounttype='buyer'";

			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, username, dbpassword);
				ps = con.prepareStatement(sql);
				ps.setString(1,email);
				rs = ps.executeQuery();
		%>
	
	<table border="1">
		<tr>
			<td>Item Name</td>
			<td>BUY Price</td>
			<td>Quantity BOUGHT</td>
			<td></td>
		</tr>
		<%
			while (rs.next()) {
					itemname = rs.getString("itemname");
					itemprice = rs.getDouble("itemprice");
					itemquantity = rs.getInt("itemquantity");
		%>

		<tr>
			<td><%=itemname%></td>
			<td><%=itemprice%></td>
			<td><%=itemquantity%></td>
		</tr>

		<%
			}
				rs.close();
				ps.close();
			} catch (SQLException sqe) {
				out.println(sqe);
			}
		%>
	</table>
	
	

</body>
</html>