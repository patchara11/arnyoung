package edu.bc.servlet;

	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.SQLException;
	import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import edu.bc.model.CategoriesModel;
import edu.bc.model.LikeThisModel;
import edu.bc.model.StoryHeaderModel;
	import edu.bc.dao.CategoriesDao;
import edu.bc.dao.LikeThisDao;
import edu.bc.dao.StoryDao;

	@WebServlet(urlPatterns = { "/likethis" })
	public class LikeThisServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		public LikeThisServlet() {
			super();
		}

		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			LikeThisModel likethismodel = new LikeThisModel();
			HttpSession session = request.getSession(true);

			int member_id = (int)session.getAttribute("member_id");
			int story_header_id =  Integer.parseInt(request.getParameter("story_header_id"));
			String type =  request.getParameter("type");
			
			likethismodel.setMember_id(member_id);
			likethismodel.setStory_header_id(story_header_id);
			
			if("LIKE".equals(type)) {
				LikeThisDao.InsertLikeThis(likethismodel);
			}else{
				LikeThisDao.DeleteLikeThis(likethismodel);
			}
		}

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}

	}

