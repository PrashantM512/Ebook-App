package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Cart> getCartProducts(int uid) {
		List<Cart> list=new ArrayList<Cart>();
		Cart ckt=null;
		int totalPrice=0;
		try {
			String query="SELECT * FROM cart WHERE uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, uid);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				ckt=new Cart();
				ckt.setCid(rs.getInt(1));
				ckt.setBid(rs.getInt(2));
				ckt.setUid(rs.getInt(3));
				ckt.setBookName(rs.getString(4));
				ckt.setAuthor(rs.getString(5));
				ckt.setPrice(rs.getInt(6));
				totalPrice=totalPrice+rs.getInt(7);
				ckt.setTotalPrice(totalPrice);
				
				list.add(ckt);
			}
			
		} catch (Exception e) {
			e.printStackTrace();		}
		
		return list;
	}
	
	public boolean removeFromCart(int cid) {
		boolean f=false;
		try {
			String query="DELETE FROM cart WHERE cid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, cid);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean removeAllFromCart(int uid) {
		boolean f=false;
		try {
			String query="DELETE FROM cart WHERE uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, uid);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	 
}
