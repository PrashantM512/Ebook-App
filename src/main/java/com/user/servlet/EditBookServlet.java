package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.DAO.BookDao;
import com.DB.DBConnect;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EditBookServlet
 */
@MultipartConfig
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServlet() {
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
		int bookId=Integer.parseInt(request.getParameter("bid"));
		String bookName=request.getParameter("bname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String category=request.getParameter("btype");
		String status=request.getParameter("status");
		Part photo=request.getPart("bimg");
		String email="Admin";
		
		
		String photoName = Paths.get(photo.getSubmittedFileName()).getFileName().toString();
		
		try {
			BookDao book=new BookDao(DBConnect.getConnection());
			Book bk=new Book();
			bk.setBookId(bookId);
			bk.setBookName(bookName);
			bk.setAuthor(author);
			bk.setPrice(price);
			bk.setBookCategory(category);
			bk.setStatus(status);
			bk.setEmail(email);
			if (photoName != null && !photoName.isEmpty()){
				bk.setPhoto(photoName);
			}
			

			book.editBookById(bookId,bk);
			
			
				try {
					if(photoName!=null) {
						 String path = getServletContext().getRealPath("")+"books";
						   System.out.println(path);
						  File file = new File(path); 
						  photo.write(path + file.separator + photoName);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			 
			session.setAttribute("editSuccess", "Book "+bookName+" edited successfully...");
			response.sendRedirect("admin/all_books.jsp");
			
		} catch (Exception e) {
			 e.printStackTrace();
			 System.out.println("Exception Message: " + e.getMessage());
			session.setAttribute("editFailed", "Edit operation failed...");
			response.sendRedirect("admin/edit_book.jsp");
		}
		
		
		
		doGet(request, response);
	}

}
