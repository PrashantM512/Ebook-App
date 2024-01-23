package com.entity;

public class Cart {
     private int cid;
     private int bid;
     private int uid;
     private String bookName;
     private String author;
     private int price;
     private int totalPrice;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cid, int bid, int uid, String bookName, String author, int price, int totalPrice) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.uid = uid;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	public Cart(int bid, int uid, String bookName, String author, int price, int totalPrice) {
		super();
		this.bid = bid;
		this.uid = uid;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
     
     
}
