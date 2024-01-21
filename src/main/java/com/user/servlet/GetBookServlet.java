package com.user.servlet;

import com.DAO.BookDao;
import com.DB.DBConnect;
import com.entity.Book;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
		
		int id=Integer.parseInt(request.getParameter("id")); 
		BookDao book=new BookDao(DBConnect.getConnection());
		Book bk=book.getBookById(id);
		
		session.setAttribute("bookObj", bk);
		response.sendRedirect("admin/edit_book.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
