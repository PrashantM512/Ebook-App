package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f=false;
		
		try {
			String query="INSERT INTO user(name,email,phone,password) VALUES(?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,us.getName());
			stmt.setString(2,us.getEmail());
			stmt.setString(3, us.getPhone());
			stmt.setString(4,us.getPassword());
			int a=stmt.executeUpdate();
			if(a==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	public User login(String email, String password) {
		User user=null;
	
		
		String query="SELECT * FROM user WHERE email=? and password=?";
		try {
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setLandmark(rs.getString(6));
				user.setCity(rs.getString(7));
				user.setState(rs.getString(8));
				user.setPincode(rs.getInt(9));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	
	
	
}
