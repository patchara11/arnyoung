package edu.bc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.bc.dao.PaymentDao;
import edu.bc.model.PaymentModel;
import sun.io.Converters;

@WebServlet(urlPatterns = { "/countcart"})
public class CountCartServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		int memberId = (int)session.getAttribute("member_id");
		
		List<PaymentModel> paymentModel = null;
		PaymentDao payment = new PaymentDao();
		int count = 0;
		
		paymentModel = payment.QueryPaymentByMemberId(memberId);
		if(paymentModel.size() != 0) {
			count = paymentModel.size();
		}
	    PrintWriter out = response.getWriter();
	    out.write(Integer.toString(count));      
	    out.close();
	}
}
