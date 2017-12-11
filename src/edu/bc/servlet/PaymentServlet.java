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
import javax.websocket.Session;

import edu.bc.dao.LoginDao;
import edu.bc.dao.PaymentDao;
import edu.bc.model.LoginModel;
import edu.bc.model.PaymentModel;

@WebServlet(urlPatterns = { "/payment" })

public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaymentModel paymentModel = new PaymentModel() ;
		PaymentDao payment = new PaymentDao();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		int memberId = (int)session.getAttribute("member_id");
		
		int storyHeaderId = Integer.parseInt(request.getParameter("storyHeaderId"));
		int storyDetailId = Integer.parseInt(request.getParameter("storyDetailId"));
		
		paymentModel.setMember_id(memberId);
		paymentModel.setStory_header_id(storyHeaderId);
		paymentModel.setStory_detail_id(storyDetailId);
		
		boolean status = PaymentDao.InsertPayment(paymentModel);
		if(status) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/");
		}else {
			out.print("<p style=\"color:red\">Sorry buy error</p>");
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/");			
		}
		out.close();
		
	}
}
