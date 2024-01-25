package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Order;

public class OrderDAO {

	private Connection conn;

	public OrderDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public Order addOrderById(int uid,Order ord) {		
		try {
			String query="INSERT INTO `order`(uid,userName,email,address,phone,bookName,price,payment,landmark,city,state,pincode) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1,uid );
			stmt.setString(2,ord.getUserName());
			stmt.setString(3,ord.getEmail() );
			stmt.setString(4, ord.getAddress());
			stmt.setString(5, ord.getPhone());
			stmt.setString(6, ord.getBookName());	
			stmt.setString(7, ord.getPrice());
			stmt.setString(8, ord.getPayment());
			stmt.setString(9,ord.getLandmark() );
			stmt.setString(10, ord.getCity());
			stmt.setString(11,ord.getState() );
			stmt.setInt(12, ord.getPincode());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ord;
	}
}
