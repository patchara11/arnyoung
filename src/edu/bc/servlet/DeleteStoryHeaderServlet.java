package edu.bc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.bc.dao.LoginDao;
import edu.bc.dao.StoryHeaderDao;

public class DeleteStoryHeaderServlet extends HttpServlet {

		private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();

			String id = request.getParameter("storyHeaderId");			
			boolean status = StoryHeaderDao.DeleteStoryHeader(id);
			if (status) {				
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/storyheader");
				return;
			} else {
				out.print("<p style=\"color:red\">Delete Story Header error</p>");

				RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
				rd.include(request, response);
			}

			out.close();

		}
	}
