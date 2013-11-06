<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Payment</title>
</head>
<body>
<form method="post" action="processpayment.jsp">
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
<option value="select">--Month--</option>
<option value="01">January</option>
<option value="02">Feburary</option>
<option value="03">March</option>
<option value="04">April</option>
<option value="05">May</option>
<option value="06">June</option>
<option value="07">July</option>
<option value="08">August</option>
<option value="09">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
</select>
<select name="CCExpiresYear">
<option value="select">--Year--</option>
<option value="04">2014</option>
<option value="05">2015</option>
<option value="06">2016</option>
<option value="07">2017</option>
<option value="08">2018</option>
<option value="09">2019</option>
<option value="10">2020</option>
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