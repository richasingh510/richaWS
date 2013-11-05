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
<form method="post" action="saveItemList.jsp">
<center><h2 style="color:green">User Sign Up</h2></center>
<table border="1" align="center">
<tr>
<td>Enter Item Name :</td>
<td><input type="text" name="itemname"/></td>
</tr>
<tr>
<td>Enter Item Description :</td>
<td><input type="text" name="itemdescription"/></td>
</tr>
<tr>
<td>Enter Item Price :</td>
<td><input type="text" name="itemprice"/></td>
</tr>
<tr>
<td>Enter Quantity :</td>
<td><input type="password" name="itemquantity"/></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="submit"/></td>
</table>
</form>
</body>
</html>