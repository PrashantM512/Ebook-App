package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import com.DB.DBConnect;
import com.entity.Book;
import com.DAO.BookDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminAddBookServlet
 */
@MultipartConfig
public class AdminAddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String bookName = request.getParameter("bname");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String bookCategories = request.getParameter("btype");
		String Status = request.getParameter("status");
		Part photo = request.getPart("bimg");
		String photoName = photo.getSubmittedFileName();

		try {

			BookDao book = new BookDao(DBConnect.getConnection());
			Book bk = new Book();
			bk.setBookName(bookName);
			bk.setAuthor(author);
			bk.setPrice(price);
			bk.setBookCategory(bookCategories);
			bk.setStatus(Status);
			bk.setPhoto(photoName);

			book.addBook(bk);
			String path = getServletContext().getRealPath("") + "books";
			File file = new File(path);
			photo.write(path + file.separator + photoName);
			session.setAttribute("added", "Book Added Successfully...");
			response.sendRedirect("admin/add_books.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failed", "Something went wrong...");
			response.sendRedirect("admin/add_books.jsp");
		}

		doGet(request, response);
	}

}
