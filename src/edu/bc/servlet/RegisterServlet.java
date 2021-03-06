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
import edu.bc.model.LoginModel;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginModel register = new LoginModel() ;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
				
		register.setUsername(request.getParameter("username"));		
		register.setPassword(request.getParameter("password"));
		
		String first_name = new String(request.getParameter("first_name").getBytes("ISO8859_1"),"UTF-8");
		register.setFirst_name(first_name);
		
		register.setLast_name(request.getParameter("last_name"));
		register.setEmail(request.getParameter("email"));
		register.setMobile(request.getParameter("mobile"));
		register.setPesudonym(request.getParameter("pesudonym")); 

		HttpSession session = request.getSession(false);
		if (session != null)		

		
		if (RegisterDao.validate(register)) {
			
			
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/home");
		} else {
			out.print("<p style=\"color:red\">Sorry username already use.</p>");

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//			out = response.getWriter();  
//			response.setContentType("text/html");  
//			out.println("<script type=\"text/javascript\">");  
//			out.println("alert('Sorry username or password error');");  
//			out.println("</script>");
			rd.include(request, response);
		}

		out.close();
	}
}