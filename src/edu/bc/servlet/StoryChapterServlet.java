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

import edu.bc.model.StoryChapterModel;
import edu.bc.model.StoryHeaderModel;
import edu.bc.dao.StoryDao;

@WebServlet(urlPatterns = { "/storychapter" })
public class StoryChapterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StoryChapterServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		String errorString = null;
		List<StoryChapterModel> list = null;

		//int story_header_id = Integer.parseInt(request.getParameter("storyHeaderId"));
		String storyHeaderId = (String)session.getAttribute("storyHeaderId");
		
		list = StoryDao.QueryStoryChapter(storyHeaderId);
		// Store info in request attribute, before forward to views

		if(list.size() > 0) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("StoryChapterModel", list);
			request.setAttribute("storyname", list.get(0).getStory_header_name());
			request.setAttribute("storycontent", list.get(0).getStory_header_content());
			request.setAttribute("storyimg", list.get(0).getStory_header_img());
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
