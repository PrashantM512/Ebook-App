package com.user.servlet;

import com.DAO.BookDao;
import com.DB.DBConnect;
import com.entity.Book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          
            String searchKeyword=request.getParameter("search");
            try {
				BookDao bk=new BookDao(DBConnect.getConnection());
				List<Book> list=bk.searchBooks(searchKeyword);
				System.out.println(list);
				request.setAttribute("list",list);
				RequestDispatcher dispatcher = request.getRequestDispatcher("searched_books.jsp");
				dispatcher.forward(request, response);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
            
		
		doGet(request, response);
	}

}
