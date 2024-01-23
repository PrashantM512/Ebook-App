package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAO {

	private Connection conn;

	public CartDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addIntoCart(Cart c) {
		boolean f=false;
		try {
			String query="INSERT INTO cart(bid,uid,bookName,author,price,totalPrice) VALUES(?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1,c.getBid());
			stmt.setInt(2, c.getUid());
			stmt.setString(3, c.getBookName());
			stmt.setString(4, c.getAuthor());
			stmt.setInt(5, c.getPrice());
			stmt.setInt(6, c.getTotalPrice());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	 
}
