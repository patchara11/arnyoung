package edu.bc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.bc.dao.RegisterDao;
import edu.bc.dao.StoryDao;
import edu.bc.model.LoginModel;
import edu.bc.model.StoryDetailModel;

public class AddStoryChapterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoryDetailModel storydetailmodel = new StoryDetailModel() ;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(true);
				
//		storydetailmodel.setStory_detail_act(new String(request.getParameter("storyActName").getBytes("ISO8859_1"),"UTF-8"));		
//		storydetailmodel.setStory_detail_content(new String(request.getParameter("editor1").getBytes("ISO8859_1"),"UTF-8"));
		
		storydetailmodel.setStory_detail_act(request.getParameter("storyActName"));		
		//storydetailmodel.setStory_detail_content(request.getParameter("editor1"));
		storydetailmodel.setStory_detail_content(request.getParameter("editor1"));
		
		storydetailmodel.setStory_header_id(Integer.parseInt((String)session.getAttribute("storyHeaderId")));
		//storyDetailId
		storydetailmodel.setStory_detail_id(Integer.parseInt((String)request.getParameter("storyDetailId")));
		
		if(storydetailmodel.getStory_detail_id() > 0) {
			if (StoryDao.UpdateStoryDetail(storydetailmodel)) {
				// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
				// rd.forward(request, response);

				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/storychapter");
				return;
			} else {
				out.print("<p style=\"color:red\">Sorry your information is not correct</p>");

				// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
				// out = response.getWriter();
				// response.setContentType("text/html");
				// out.println("<script type=\"text/javascript\">");
				// out.println("alert('Sorry username or password error');");
				// out.println("</script>");
				// rd.include(request, response);
			}
			
		}else {
			if (StoryDao.InsertStoryDetail(storydetailmodel)) {
				// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
				// rd.forward(request, response);

				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/storychapter");
				return;
			} else {
				out.print("<p style=\"color:red\">Sorry your information is not correct</p>");

				// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
				// out = response.getWriter();
				// response.setContentType("text/html");
				// out.println("<script type=\"text/javascript\">");
				// out.println("alert('Sorry username or password error');");
				// out.println("</script>");
				// rd.include(request, response);
			}
		}

		out.close();
	}
}