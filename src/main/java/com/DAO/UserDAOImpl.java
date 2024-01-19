package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			String query="INSERT INTO User(name,email,phone,password) VALUES(?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,us.getName());
			stmt.setString(2,us.getEmail());
			stmt.setInt(3, us.getPhone());
			stmt.setString(4,us.getPassword());
			int a=stmt.executeUpdate();
			if(a==1) {
				f=true;
			}
			
		} catch (Exception e) {
			
		}
		
		return f;
	}

	
	
	
}
