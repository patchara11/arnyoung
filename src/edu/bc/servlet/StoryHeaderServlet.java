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

import edu.bc.model.StoryHeaderModel;
import edu.bc.dao.StoryHeaderDao;

@WebServlet(urlPatterns = { "/storyheader" })
public class StoryHeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StoryHeaderServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		int member_id = (int)session.getAttribute("member_id");
		String username = (String)session.getAttribute("username");
		String errorString = null;
		List<StoryHeaderModel> list = null;

		list = StoryHeaderDao.QueryStoryHeader(member_id);
		// Store info in request attribute, before forward to views

		request.setAttribute("errorString", errorString);
		request.setAttribute("StoryHeaderModel", list);
		request.setAttribute("username", username);

		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/storyheader.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
