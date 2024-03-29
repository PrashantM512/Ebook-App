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

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
		
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		BookDao book=new BookDao(DBConnect.getConnection());
		Book bk=book.getBookById(bid);
		
		CartDAO ckt=new CartDAO(DBConnect.getConnection());
        try {
			Cart cart=new Cart();
			
			cart.setBid(bid);
			cart.setUid(uid);
			cart.setBookName(bk.getBookName());
			cart.setAuthor(bk.getAuthor());
			cart.setPrice(Integer.parseInt(bk.getPrice()));
			cart.setTotalPrice(Integer.parseInt(bk.getPrice()));
			
			boolean f=ckt.addIntoCart(cart);
        	if(f) {
        		session.setAttribute("addSuccess", "Book added to cart successfully...");
        		response.sendRedirect("new_books.jsp");
        		
        	}else {
        		session.setAttribute("addFailed", "Something went wrong...");
        		response.sendRedirect("new_books.jsp");
        		
        	}
        	
        	response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
