package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DAO.OrderDAO;
import com.DB.DBConnect;
import com.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CompleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompleteOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session=request.getSession();
       int uid=Integer.parseInt(request.getParameter("id"));
       OrderDAO order=new OrderDAO(DBConnect.getConnection());
       order.deleteOrderById(uid);
       session.setAttribute("completed", "Order Completed Successfully...");
       response.sendRedirect("admin/orders.jsp");
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
