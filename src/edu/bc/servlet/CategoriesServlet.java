package edu.bc.servlet;


	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.SQLException;
	import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

import edu.bc.dao.CategoriesDao;
import edu.bc.model.CategoriesModel;

	@WebServlet(urlPatterns = { "/categories" })
	public class CategoriesServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		public CategoriesServlet() {
			super();
		}

		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			HttpSession session = request.getSession(true);

			String errorString = null;
			List<CategoriesModel> list = null;

			//int story_header_id = Integer.parseInt(request.getParameter("storyHeaderId"));
			String storyHeaderId = (String)session.getAttribute("storyHeaderId");
			
			list = CategoriesDao.QueryCategories();
			// Store info in request attribute, before forward to views

			if(list.size() > 0) {
				request.setAttribute("CategoriesModel", list);
			}
			

			// Forward to /WEB-INF/views/productListView.jsp
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/storychapter.jsp");
			dispatcher.forward(request, response);
		}

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}

	}
