package com.DAO;

import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


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
    
    public List<Book> getBooks() {
    	List<Book> list=new ArrayList<Book>();
    	Book book=null;
    	try {
    		String query="SELECT * FROM book_dtls";
            PreparedStatement stmt=conn.prepareStatement(query);
            ResultSet rs= stmt.executeQuery();
            while(rs.next()) {
            	book=new Book();
            	book.setBookId(rs.getInt(1));
            	book.setBookName(rs.getString(2));
            	book.setAuthor(rs.getString(3));
            	book.setPrice(rs.getString(4));
            	book.setBookCategory(rs.getString(5));
            	book.setStatus(rs.getString(6));
            	book.setPhoto(rs.getString(7));
            	list.add(book);
            	
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    
    public Book getBookById(int id) {
    	Book book=null;
    	
    	try {
    		String query="SELECT * FROM book_dtls WHERE bookId=?";
    		PreparedStatement stmt=conn.prepareStatement(query);
    		stmt.setInt(1, id);
    		ResultSet rs=stmt.executeQuery();
    		
    		while(rs.next()) {
    			book=new Book();
        		book.setBookId(rs.getInt(1));
        		book.setBookName(rs.getString(2));
        		book.setAuthor(rs.getString(3));
        		book.setPrice(rs.getString(4));
        		book.setBookCategory(rs.getString(5));
        		book.setStatus(rs.getString(6));
        		book.setPhoto(rs.getString(7));
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return book;
    }
    
    public Book editBookById(int id,Book book) {
    	
    	try {
			String query="UPDATE book_dtls SET boookName=?,author=?,price=?,bookCategory=?,status=?,photo=? WHERE bookId=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, book.getBookName());
			stmt.setString(2, book.getAuthor());
			stmt.setString(3, book.getPrice());
			stmt.setString(4, book.getBookCategory());
			stmt.setString(5, book.getStatus());
			stmt.setString(6, book.getPhoto());
			stmt.setInt(7, book.getBookId());
			stmt.executeUpdate();
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return book;
    }
    
    public Boolean deleteBookById(int id) {
    	boolean d=false;
    	
    	try {
			String query="DELETE FROM book_dtls WHERE bookId=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			d=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	return d;
    }
    public List<Book> getRecentBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"Active");
			ResultSet rs=stmt.executeQuery();
			int i=1;
			while(rs.next()&&i<=4) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
        		i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    public List<Book> getNewBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"New");
			stmt.setString(2,"Active");
			ResultSet rs=stmt.executeQuery();
			int i=1;
			while(rs.next()&&i<=4) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
        		i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    public List<Book> getOldBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE bookCategory=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"old");
			ResultSet rs=stmt.executeQuery();
			int i=1;
			while(rs.next()&&i<=4) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
        		i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    public List<Book> getAllRecentBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"Active");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    public List<Book> getAllNewBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"New");
			stmt.setString(2,"Active");
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    public List<Book> getAllOldBooks(){
    	List<Book> list=new ArrayList<Book>(); 
    	Book bk=null;
    	
    	try {
    		String query = "SELECT * FROM book_dtls WHERE bookCategory=? ORDER BY bookId DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"old");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				bk=new Book();
				bk.setBookId(rs.getInt(1));
        		bk.setBookName(rs.getString(2));
        		bk.setAuthor(rs.getString(3));
        		bk.setPrice(rs.getString(4));
        		bk.setBookCategory(rs.getString(5));
        		bk.setStatus(rs.getString(6));
        		bk.setPhoto(rs.getString(7));
        		list.add(bk);
        	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    
}
