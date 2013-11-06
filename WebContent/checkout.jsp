<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<form method="post" action="saveuserform.jsp">
<center><h2 style="color:green">User Payment Details</h2></center>
<table border="1" align="center">
<tr>
<td> First Name :</td>
<td><input type="text" name="firstname"/></td>
</tr>
<tr>
<td> Last Name :</td>
<td><input type="text" name="lastname"/></td>
</tr>
<tr>
<td>Email :</td>
<td><input type="text" name="email"/></td>
</tr>
<tr>
<td> Country :</td>
<td><input type="text" name="country"/></td>
</tr>
<tr>
<td> PhoneNumber :</td>
<td><input type="text" name="phone"/></td>
</tr>
<tr>
<td> Credit Card Number :</td>
<td><input type="text" name="ccno"/></td>
</tr>
<tr>
<td>Select Expiry Date</td>
<td><select name="CCExpiresMonth">
<option value="select">--Month--
<option value="01">January
<option value="02">Feburary
<option value="03">March
<option value="04">April
<option value="05">May
<option value="06">June
<option value="07">July
<option value="08">August
<option value="09">September
<option value="10">October
<option value="11">November
</option>
</select>
<select name="CCExpiresYear">
<option value="select">--Year--
<option value="04">2004
<option value="05">2005
<option value="06">2006
<option value="07">2007
<option value="08">2008
<option value="09">2009
<option value="10">2010
<option value="11">2011
<option value="12">2012
<option value="13">2013
<option value="14">2014
<option value="15">2015
</option>
</select>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Confirm Pay &gt;&gt;"/></td>
</table>
</form>
</body>
</html>