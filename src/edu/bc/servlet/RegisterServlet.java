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
		register.setFirst_name(request.getParameter("first_name"));
		register.setLast_name(request.getParameter("last_name"));
		register.setEmail(request.getParameter("email"));
		register.setMobile(request.getParameter("mobile"));
		register.setPesudonym(request.getParameter("pesudonym")); 

		HttpSession session = request.getSession(false);
		if (session != null)		

		
		if (RegisterDao.validate(register)) {
			
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			out.print("<p style=\"color:red\">Sorry username or password error</p>");

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