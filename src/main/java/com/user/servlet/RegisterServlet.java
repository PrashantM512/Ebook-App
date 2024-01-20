package com.user.servlet;

import java.io.IOException;


import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	
    	try {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String password=request.getParameter("password");
			String check=request.getParameter("check");
           // System.out.print(name+""+email+""+phone+""+password+""+check);
			
			if(check!=null) {
				User us=new User();
				us.setName(name);
				us.setEmail(email);
				us.setPhone(phone);
				us.setPassword(password);
				
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConnection());
				boolean f=dao.userRegister(us);
				if(f) {
					//System.out.println("successfully Registerd..");
					session.setAttribute("success","Successfully Registerd.." );
					response.sendRedirect("register.jsp");
				}else {
					//System.out.println("Something went wrong..");
					session.setAttribute("unsuccess","Something went wrong..");
					response.sendRedirect("register.jsp");
				}
				
			}else {
				//System.out.println("Please accept terms and conditions...");
				session.setAttribute("check","Please accept terms and conditions...");
				response.sendRedirect("register.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    }
}
