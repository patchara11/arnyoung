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
import edu.bc.dao.PaymentDao;
import edu.bc.dao.StoryDao;

@WebServlet(urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		String errorString = null;
		List<StoryChapterModel> list = null;
        Double totalPrice = 0.00;
		
		int memberId = (int)session.getAttribute("member_id");
		
		list = PaymentDao.QueryStoryChapter(memberId);
		// Store info in request attribute, before forward to views
        for (StoryChapterModel item : list) {
          	totalPrice += item.getStory_header_price();
		}
		
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("storycontent", "");
		request.setAttribute("storyimg", "");
		
		if(list.size() > 0) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("StoryChapterModel", list);
		}
		

		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/cart.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
