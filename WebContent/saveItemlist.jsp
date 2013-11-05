<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Item details</title>
</head>
<body>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/logindb";
String user = "root";
String dbpsw = "personal";

String sql = "select name,password from userdetail where name=? and password=?";

String name = request.getParameter("itemname");
String description = request.getParameter("itemdescription");
int price = Integer.parseInt(request.getParameter("itemprice"));
int itemquantity = Integer.parseInt(request.getParameter("itemquantity"));


if((!(name.equals(null) || name.equals("")) && !(description.equals(null) || description.equals("")) && !(info.equals(null) || info.equals("")) && !(price.equals(null)) && !(itemquantity.equals(null))))
{
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1, itemname);
		ps.setString(2, itemdes);
		ps.setString(3, sellerinfo);
		ps.setInt(4, itemprice);
		ps.setInt(5, quantity);
		rs = ps.executeQuery();
		if(rs.next())
		{			
			itemname = rs.getString("itemname");
			itemdes = rs.getString("itemdescription");
			sellerinfo = rs.getString("sellerinfo");
			itemprice = rs.getInt("itemprice");
			quantity = rs.getInt("itemquantity");
			if(name.equals(itemname) && description.equals(itemdes) && info.equals(sellerinfo) && price.equals(itemprice) && itemquantity.equals(quantity))
				{
					session.setAttribute("itemname",itemname);	
					session.setAttribute("itemdescription",itemdes);
					session.setAttribute("sellerinfo",sellerinfo);	
					session.setAttribute("itemprice",itemprice);
					session.setAttribute("itemquantity",quantity);	
					//response.sendRedirect("welcome.jsp");				
				}						   
		}
		else
			response.sendRedirect("error.jsp");
		rs.close();
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
	
		<center><p style="color:red">Error In Login</p></center>
		<% 
	getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>