<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping cart</title>
</head>
<body>


	<p>
		Welcome,
		<%=session.getAttribute("email")%></p>
	<p>
		<a href="logout.jsp">Logout</a>

		<%

String itemname= request.getParameter("itemname");
double itemprice = Double.parseDouble(request.getParameter("itemprice"));
int itemquantity = Integer.parseInt(request.getParameter("itemquantity"));
String seller = request.getParameter("seller");
String buyer = session.getAttribute("email").toString();
session.setAttribute("seller", seller);
session.setAttribute("itemname", itemname);
session.setAttribute("itemprice", itemprice);
session.setAttribute("itemquantity", itemquantity);


		%>
	
	<table border="1">
		<tr>
			<td>Item Name</td>
			<td>Item Price</td>
			<td>Item Quantity</td>
			<td></td>
		</tr>

		<tr>
			<form method="post" action="checkout.jsp">
				<td><%=itemname%></td>
				<td><%=itemprice%></td>
				<td><%=itemquantity%></td>
				<td><input type="submit" value="CheckOut" /></td>
			</form>
		</tr>
	</table>
</body>
</html>