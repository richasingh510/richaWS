package sjsu.cmpe273.lab2.marketplace.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class SavePurchase {

	public SavePurchase() {}

	@WebMethod(action="saveAdvertisement")
	public void savePurchase(String itemname, String description, double price, int quantity, String seller, String buyer) {

		Connection con= null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/marketplace";
		String username = "root";
		String dbpassword = "personal";

		String sql = "insert into useraccount (itemname,itemprice,itemquantity,email,accounttype)values (?,?,?,?,?)";

		try{
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, username, dbpassword);
			ps1 = con.prepareStatement(sql);
			ps1.setString(1, itemname);
			ps1.setDouble(2, price);
			ps1.setInt(3, quantity);
			ps1.setString(4, seller);
			ps1.setString(5, "seller");
			ps1.executeUpdate();


			ps2= con.prepareStatement(sql);
			ps2.setString(1, itemname);
			ps2.setDouble(2, price);
			ps2.setInt(3, quantity);
			ps2.setString(4, buyer);
			ps2.setString(5, "buyer");
			ps2.executeUpdate();


			ps1.close();
			ps2.close();
		}

		catch(SQLException sqe)
		{
			sqe.printStackTrace();
		}
	}

}
