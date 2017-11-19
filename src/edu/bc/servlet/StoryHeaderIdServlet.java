package edu.bc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/storyheaderid" })
public class StoryHeaderIdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String storyHeaderId = request.getParameter("storyHeaderId");
		String storyHeaderName = request.getParameter("storyHeaderName");
		String storyHeaderImg = request.getParameter("storyHeaderImg");
		String storyHeaderContent = request.getParameter("storyHeaderContent");
		
		HttpSession session = request.getSession(false);
		if (session != null)			
			session.setAttribute("storyHeaderId", storyHeaderId);
			session.setAttribute("storyHeaderName", storyHeaderName);
			session.setAttribute("storyHeaderImg", storyHeaderImg);
			session.setAttribute("storyHeaderContent", storyHeaderContent);
				
	}
}