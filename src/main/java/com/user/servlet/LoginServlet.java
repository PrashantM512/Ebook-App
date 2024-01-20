package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		jakarta.servlet.http.HttpSession session=request.getSession();
		
		UserDAOImpl user=new UserDAOImpl(DBConnect.getConnection());
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email.equals("admin@gmail.com")&&password.equals("admin")) {
			User us=new User();
			session.setAttribute("userObj",us);
			response.sendRedirect("admin/home.jsp");
		}else{
			User us=user.login(email, password);
		   if(us!=null) {
			   session.setAttribute("userObj",us);
			   response.sendRedirect("home.jsp");
			   
		   }else {
			   session.setAttribute("invalid","invalid email or password...");
			   response.sendRedirect("login.jsp");
		   }
			
			
			
		}
		
		doGet(request, response);
	}

}
