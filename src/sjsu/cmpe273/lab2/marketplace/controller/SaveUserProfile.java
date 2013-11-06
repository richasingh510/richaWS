package sjsu.cmpe273.lab2.marketplace.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class SaveUserProfile {

	public SaveUserProfile() {}

	@WebMethod(action="saveAdvertisement")
	public void saveUserProfile(String firstname, String lastname, String email, String password) {
		
		Connection con= null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/marketplace";
		String username = "root";
		String dbpassword = "personal";

		String sql = "insert into userprofile (firstname,lastname,email,password) values (?,?,?,?)";

		if((!(firstname.equals(null) || firstname.equals("")) && !(lastname.equals(null) || lastname.equals("")) && !(email.equals(null) || email.equals("")) && !(password.equals(null) || password.equals("")))) 
		{
			try{
				try {
					Class.forName(driverName);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				con = DriverManager.getConnection(url, username, dbpassword);
				ps = con.prepareStatement(sql);
				ps.setString(1, firstname);
				ps.setString(2, lastname);
				ps.setString(3, email);
				ps.setString(4, password);
				ps.executeUpdate();
								
				ps.close();				
				}
			catch(SQLException sqe)
			{
				sqe.printStackTrace();
			}	
		}
	}

}
