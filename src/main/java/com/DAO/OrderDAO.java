package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	public List<Order> getAllOrders() {
	    List<Order> list = new ArrayList<Order>();
	    Order order = null;

	    try {
	    	String table="order";
	        String query = "SELECT * FROM `"+table+"` ";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            order = new Order();
	            order.setOrderId(rs.getInt(2));
	            order.setUserName(rs.getString(3));
	            order.setEmail(rs.getString(4));
	            order.setAddress(rs.getString(5));
	            order.setPhone(rs.getString(6));
	            order.setBookName(rs.getString(7));
	            order.setPrice(rs.getString(8));
	            order.setPayment(rs.getString(9));
	            order.setLandmark(rs.getString(10));
	            order.setCity(rs.getString(11));
	            order.setState(rs.getString(12));
	            order.setPincode(rs.getInt(13));
	            list.add(order);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public List<Order> getOrdersByUid(int uid) {
		List<Order> list = new ArrayList<Order>();
	    Order order = null;
	    try {
	    	String table="order";
	        String query = "SELECT * FROM `"+table+"` WHERE uid=?";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setInt(1, uid);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            order = new Order();
	            order.setOrderId(rs.getInt(2));
	            order.setUserName(rs.getString(3));
	            order.setEmail(rs.getString(4));
	            order.setAddress(rs.getString(5));
	            order.setPhone(rs.getString(6));
	            order.setBookName(rs.getString(7));
	            order.setPrice(rs.getString(8));
	            order.setPayment(rs.getString(9));
	            order.setLandmark(rs.getString(10));
	            order.setCity(rs.getString(11));
	            order.setState(rs.getString(12));
	            order.setPincode(rs.getInt(13));
	            order.setDate(rs.getString(14));
	            list.add(order);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public boolean deleteOrderById(int id) {
	boolean f=false;
	try {
		String query="DELETE FROM `order` WHERE orderId=?";
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setInt(1, id);
		stmt.executeUpdate();
		f=true;
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
  }
}
