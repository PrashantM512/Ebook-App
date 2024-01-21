package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Book;

public class BookDao {
     private Connection conn;

	public BookDao(Connection conn) {
		super();
		this.conn = conn;
	}

    public Book addBook(Book bk) {
    	boolean f=false;
    	Book book=new Book();
    	try {
			String query="INSERT INTO book_dtls(bookId,boookName,author,price,bookCategory,status,photo) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, bk.getBookId());
			stmt.setString(2, bk.getBookName());
			stmt.setString(3, bk.getAuthor());
			stmt.setString(4, bk.getPrice());
			stmt.setString(5, bk.getBookCategory());
			stmt.setString(6, bk.getStatus());
			stmt.setString(7, bk.getPhoto());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return book;
    }
}
