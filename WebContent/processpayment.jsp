<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%! String errorMessage; %>
	<%
String firstname= request.getParameter("firstname");
String lastname= request.getParameter("lastname");
String email = request.getParameter("email");
String country = request.getParameter("country");
int phone= Integer.parseInt(request.getParameter("phone"));
String ccno= request.getParameter("ccno");
int CCExpiresMonth= Integer.parseInt(request.getParameter("CCExpiresMonth"));
int CCExpiresYear= Integer.parseInt(request.getParameter("CCExpiresYear"));

if(ccno.length() != 16)
	errorMessage = "Credit Card should have minimum 16 digits";
else if(firstname == null || firstname.length() == 0 || lastname == null || lastname.length() == 0)
	errorMessage = "You must specify the name of the card holder";

if(errorMessage != null)
{
	%>

	<center>
		<p style="color: red"><%= errorMessage %></p>
	</center>
	<% 
	getServletContext().getRequestDispatcher("/checkout.jsp").include(request, response);
}

response.sendRedirect("paymentconfirm.jsp");	

%>
</body>
</html>
