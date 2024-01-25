package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDao;
import com.DAO.CartDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;
import com.entity.Cart;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session=request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
	    String email=request.getParameter("email");
	    String phone=request.getParameter("phone");
	    String password=request.getParameter("password");
	    
	    UserDAOImpl us=new UserDAOImpl(DBConnect.getConnection());
	    User usr=us.getUserById(id);
	    String originalPass=usr.getPassword();

	    if(password.equals(originalPass)) {
	    	try {
	    		User user=new User(name,email,phone);
	    		us.updateUserById(id, user);
	    		session.setAttribute("updateSuccess","Profile updated successfully...");
	    		response.sendRedirect("settings.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("updateFailed","Something went wrong...");
	    		response.sendRedirect("settings.jsp");
			}
	    }else {
	    
	    	session.setAttribute("wrongPass", "Please enter correct password... ");
	    	response.sendRedirect("update_profiel.jsp");
	    }
		
		doGet(request, response);
	}

}
