package com.entity;

public class Order {
    private int uid;
	private int	orderId;
  	private String userName;
  	private String email;
  	private String address;
  	private String phone;
  	private String bookName;
  	private String price;
  	private String payment;
  	private String landmark;
  	private String city;
  	private String state;
  	private int	pincode;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Order(int uid, int orderId, String userName, String email, String address, String phone, String bookName, String price, String payment, String landmark, String city, String state, int pincode) {
		super();
		this.uid = uid;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.bookName = bookName;
		this.price = price;
		this.payment = payment;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Order(int uid, String userName, String email, String address, String phone, String bookName, 
			String price, String payment, String landmark, String city, String state, int pincode) {
		super();
		this.uid = uid;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.bookName = bookName;
		this.price = price;
		this.payment = payment;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

  	
}
