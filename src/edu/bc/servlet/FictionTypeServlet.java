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

import edu.bc.model.CategoriesModel;
import edu.bc.model.StoryHeaderModel;
import edu.bc.dao.CategoriesDao;
import edu.bc.dao.StoryDao;

@WebServlet(urlPatterns = { "/fictiontype" })
public class FictionTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FictionTypeServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		int member_id = 0;
		if(session.getAttribute("member_id") != null) {
			member_id = (int)session.getAttribute("member_id");
		}
		
		String categories = (String)session.getAttribute("categories");
		String errorString = null;
		List<CategoriesModel> listCategories = null;
		List<StoryHeaderModel> list = null;

		listCategories = CategoriesDao.QueryCategories();
		list = StoryDao.QueryStoryHeader(member_id, categories);
		// Store info in request attribute, before forward to views

		request.setAttribute("errorString", errorString);
		request.setAttribute("CategoriesModel", listCategories);
		request.setAttribute("StoryHeaderModel", list);
		request.setAttribute("categories", categories);

		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/fictiontype.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

