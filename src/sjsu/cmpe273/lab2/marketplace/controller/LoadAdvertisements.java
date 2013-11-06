package sjsu.cmpe273.lab2.marketplace.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import sjsu.cmpe273.lab2.marketplace.model.Advertisements;

@WebService
public class LoadAdvertisements {

	public LoadAdvertisements() {}

	@WebMethod(action="loadAdvertisements")
	public List<Advertisements> loadAdvertisements() {

		List<Advertisements> ads = new ArrayList<Advertisements>();
		Advertisements ad;

		String itemname, itemdescription, seller;
		double itemprice;
		int itemquantity;
		Connection con= null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/marketplace";
		String username = "root";
		String dbpassword = "personal";

		String sql = "select * from advertisements";

		try{
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, username, dbpassword);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next())
			{		
				ad = new Advertisements();
				itemname = rs.getString("itemname");
				itemdescription = rs.getString("itemdescription");
				itemprice = rs.getDouble("itemprice");
				itemquantity = rs.getInt("itemquantity");
				seller = rs.getString("seller");
				
				ad.setItemName(itemname);
				ad.setItemDescription(itemdescription);
				ad.setItemPrice(itemprice);
				ad.setSeller(seller);
				
				ads.add(ad);

			}
			rs.close();
			ps.close();				
		}
		catch(SQLException sqe)
		{
			sqe.printStackTrace();
		}	

		return ads;

	}
}
