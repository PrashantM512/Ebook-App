package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.http.HttpSession;

import com.DAO.OrderDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Order;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int uid=Integer.parseInt(request.getParameter("uid"));
		String userName=request.getParameter("username");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("mobile");
		String bookName=request.getParameter("bookname");
		String price=request.getParameter("price");
		String payment=request.getParameter("payment");
		String landmark=request.getParameter("landmark");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		
		
		try {
			OrderDAO ord=new OrderDAO(DBConnect.getConnection());
			Order order=new Order(uid,userName,email,address,phone,bookName,price,payment,landmark,city,state,pincode);
			ord.addOrderById(uid, order);
			session.setAttribute("orderSuccess", "Your order Placed successfully...");
			response.sendRedirect("cart.jsp?uid="+uid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		doGet(request, response);
	}

}
