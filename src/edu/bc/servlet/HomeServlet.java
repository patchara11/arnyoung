package edu.bc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.bc.dao.StoryDao;
import edu.bc.model.StoryHeaderModel;
 

@WebServlet(urlPatterns = { "/home"})
public class HomeServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public HomeServlet() {
   	super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
       	throws ServletException, IOException {
	
		List<StoryHeaderModel> listAction = null;
	  	List<StoryHeaderModel> listDrama = null;
	  	List<StoryHeaderModel> listHorror = null;
	  	
	  	List<StoryHeaderModel> listTop = null;
	  	List<StoryHeaderModel> listActionTop = null;
	  	List<StoryHeaderModel> listDramaTop = null;
	  	List<StoryHeaderModel> listHorrorTop = null;
	   	
	  	listAction = StoryDao.QueryStoryHeaderByCategories(1);
	  	listDrama = StoryDao.QueryStoryHeaderByCategories(2);
	  	listHorror = StoryDao.QueryStoryHeaderByCategories(3);
	  	
	  	listTop = StoryDao.QueryStoryHeaderTop();  	
	  	listActionTop = StoryDao.QueryStoryHeaderByCategoriesTop(1);
	  	listDramaTop = StoryDao.QueryStoryHeaderByCategoriesTop(2);
	  	listHorrorTop = StoryDao.QueryStoryHeaderByCategoriesTop(3);
	  	
	  	request.setAttribute("listAction", listAction);
		request.setAttribute("listDrama", listDrama);
		request.setAttribute("listHorror", listHorror);
		request.setAttribute("listTop", listTop);
		request.setAttribute("listActionTop", listActionTop);
		request.setAttribute("listDramaTop", listDramaTop);
		request.setAttribute("listHorrorTop", listHorrorTop);
	  	
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	   	 
	   }
	 
	   @Override
	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	       	throws ServletException, IOException {
	   	doGet(request, response);
	   }
	   
	   
	 
	}
