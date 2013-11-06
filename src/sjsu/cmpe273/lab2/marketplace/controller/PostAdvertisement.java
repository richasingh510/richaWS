package sjsu.cmpe273.lab2.marketplace.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class PostAdvertisement {

	public PostAdvertisement() {}

	@WebMethod(action="saveAdvertisement")
	public void saveAdvertisement(String name, String description, double price, int quantity, String seller) {

		Connection con= null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/marketplace";
		String username = "root";
		String dbpassword = "personal";

		String sql = "insert into advertisements (itemname,itemdescription,itemprice,itemquantity,seller,isSold) values (?,?,?,?,?,?)";

		if((!(name.equals(null) || name.equals("")) && !(description.equals(null) || description.equals("")) && !(seller.equals(null) || seller.equals(""))))
		{
			try{
				try {
					Class.forName(driverName);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				con = DriverManager.getConnection(url, username, dbpassword);
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, description);
				ps.setDouble(3, price);
				ps.setInt(4, quantity);
				ps.setString(5, seller);
				ps.setInt(6, 0);
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
