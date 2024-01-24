package com.user.servlet;

import java.io.IOException;
import com.DAO.CartDAO;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RemoveFromCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RemoveFromCart() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int cartid = Integer.parseInt(request.getParameter("cid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        
        try {
            CartDAO cart = new CartDAO(DBConnect.getConnection());
            cart.removeFromCart(cartid);
            session.setAttribute("removed", "Book removed successfully...");
            response.sendRedirect("cart.jsp?uid="+uid);
           
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedRemove", "Something wenr wrong...");
            response.sendRedirect("cart.jsp?uid="+uid);
        }

        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}