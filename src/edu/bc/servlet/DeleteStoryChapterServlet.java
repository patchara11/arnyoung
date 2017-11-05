package edu.bc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.bc.dao.LoginDao;
import edu.bc.dao.StoryDao;

public class DeleteStoryChapterServlet extends HttpServlet {

		private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();

			String id = request.getParameter("storyDetailId");			
			boolean status = StoryDao.DeleteStoryDetail(id);
			if (status) {				
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/storychapter");
				return;
			} else {
				out.print("<p style=\"color:red\">Delete Story Header error</p>");

				RequestDispatcher rd = request.getRequestDispatcher("storychapter.jsp");
				rd.include(request, response);
			}

			out.close();

		}
	}
