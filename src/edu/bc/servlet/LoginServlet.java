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

import edu.bc.dao.LoginDao;
import edu.bc.model.LoginModel;

@WebServlet(urlPatterns = { "/login"})
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginModel login = new LoginModel() ;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String n = request.getParameter("username");
		String p = request.getParameter("userpass");

		HttpSession session = request.getSession(false);
		if (session != null)
//			login.setUser_id(rs.getInt("user_id"));
//       	login.setMember_id(rs.getInt("member_id"));
//       	login.setUsername(rs.getString("username"));
//       	login.setPassword(rs.getString("password"));
//       	login.setFirst_name(rs.getString("first_name"));
//       	login.setLast_name(rs.getString("last_name"));
//       	login.setEmail(rs.getString("email"));
//       	login.setMobile(rs.getString("mobile"));
//       	login.setPesudonym(rs.getString("pesudonym"));
       	
		

		login = LoginDao.validate(n, p);
		if (login.getUsername() != null) {
			
			session.setAttribute("user_id", login.getUser_id());
			session.setAttribute("member_id", login.getMember_id());
			session.setAttribute("username", login.getUsername());
			session.setAttribute("password", login.getPassword());
			session.setAttribute("first_name", login.getFirst_name());
			session.setAttribute("last_name", login.getLast_name());
			session.setAttribute("email", login.getEmail());
			session.setAttribute("mobile", login.getMobile());
			session.setAttribute("pesudonym", login.getPesudonym());
			
//			RequestDispatcher rd = request.getRequestDispatcher("home");
//			rd.forward(request, response);
			
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/");
			} 
		else {
			out.print("<p style=\"color:red\">Sorry username or password error</p>");
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/");			
		}
		out.close();
	}
}