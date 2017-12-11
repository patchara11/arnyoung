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
import edu.bc.dao.PaymentDao;
import edu.bc.dao.StoryDao;

@WebServlet(urlPatterns = { "/deletecart" })


public class DeleteCartServlet extends HttpServlet {

		private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession(false);
			int memberId = (int)session.getAttribute("member_id");

			int storyDetailId = Integer.parseInt(request.getParameter("storyDetailId"));			
			boolean status = PaymentDao.DeletePayment(memberId, storyDetailId);
			if (status) {				
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/cart");
				return;
			} else {
				out.print("<p style=\"color:red\">Delete cart error</p>");

				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				rd.include(request, response);
			}

			out.close();

		}
	}
