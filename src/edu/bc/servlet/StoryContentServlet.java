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
import edu.bc.model.StoryChapterModel;
import edu.bc.model.StoryHeaderModel;
import edu.bc.dao.CategoriesDao;
import edu.bc.dao.StoryDao;

@WebServlet(urlPatterns = { "/storycontent" })
public class StoryContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StoryContentServlet() {
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
		String storyHeaderName = (String)session.getAttribute("storyHeaderName");
		String storyHeaderImg = (String)session.getAttribute("storyHeaderImg");
		String storyHeaderContent = (String)session.getAttribute("storyHeaderContent");
		int memberId = (int)session.getAttribute("member_id");
		
		String storyDetailName = (String)session.getAttribute("storyDetailName");
		String storyDetailContent = (String)session.getAttribute("storyDetailContent");
		
		list = StoryDao.QueryStoryChapter(storyHeaderId, memberId);
		// Store info in request attribute, before forward to views

		request.setAttribute("storyname", storyHeaderName);
		request.setAttribute("storycontent", storyHeaderContent);
		request.setAttribute("storyimg", storyHeaderImg);
		
		request.setAttribute("storydetailname", storyDetailName);
		request.setAttribute("storydetailcontent", storyDetailContent);
		
		if(list.size() > 0) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("StoryChapterModel", list);
		}
		

		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/storycontent.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
