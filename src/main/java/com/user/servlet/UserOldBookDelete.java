package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDao;
import com.DAO.CartDAO;
import com.DB.DBConnect;
import com.entity.Book;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class UserOldBookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserOldBookDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
			int id=Integer.parseInt(request.getParameter("id"));
	        try {
	        	 BookDao book=new BookDao(DBConnect.getConnection());
	             book.deleteUserOldBookById(id);
	             session.setAttribute("deleted","Your Book Deleted Successfully...");
	             response.sendRedirect("user_old_books.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("failed","Something went wrong...");
			}
	         
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		doGet(request, response);
	}

}
