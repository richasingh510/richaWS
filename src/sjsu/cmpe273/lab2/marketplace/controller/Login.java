package sjsu.cmpe273.lab2.marketplace.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class Login {

	public Login() {}
	
	String email, pwd;

	@WebMethod (action="verifyCredentials")
	public boolean verifyCredentials(String name, String password) {

		boolean isValid = true;

		Connection con= null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/marketplace";
		String username = "root";
		String dbpassword = "personal";

		String sql = "select email,password from userprofile where email=? and password=?";

		if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
		{
			try{
				try {
					Class.forName(driverName);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				con = DriverManager.getConnection(url, username, dbpassword);
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, password);
				rs = ps.executeQuery();
				if(rs.next())
				{			
					email = rs.getString("email");
					pwd = rs.getString("password");
					if(name.equals(email) && password.equals(pwd))
					{
						isValid = true;				
					}						   
				}
				else
					isValid = false;
				rs.close();
				ps.close();				
			}
			catch(SQLException sqe)
			{
				sqe.printStackTrace();
			}	
		}


		return isValid;

	}

}
