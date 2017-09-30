package edu.bc.dao;

	import java.io.*;
	import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;

	//import edu.bc.bean.Member;					
	import edu.bc.jdbc.ConnectionJDBC;
	import edu.bc.model.StoryHeaderModel;

	public class StoryHeaderDao {

		public static List<StoryHeaderModel> QueryStoryHeader(int member_id) {
			
			List<StoryHeaderModel> storyheadermodel = new ArrayList<StoryHeaderModel>();
			Connection conn = null;
			PreparedStatement pst = null;
			ResultSet rs = null;
			
			
			try {
				conn = ConnectionJDBC.getConnection();

				pst = conn.prepareStatement("select * from story_header "
		   				 + "where member_id= ? order by timestamp desc" );
		   		 pst.setInt(1, member_id);

				rs = pst.executeQuery();
				while( rs.next()){
					StoryHeaderModel tmp = new StoryHeaderModel();
		               	tmp.setMember_id(rs.getInt("member_id"));
		               	tmp.setStory_header_content(rs.getString("story_header_content"));
		               	tmp.setStory_header_id(rs.getInt("story_header_id"));
		               	tmp.setStory_header_img(rs.getString("story_header_img"));
		               	tmp.setStory_header_name(rs.getString("story_header_name"));
		               	
		               	storyheadermodel.add(tmp);
				}
		           return storyheadermodel;

			} catch (Exception e) {
				System.out.println(e);
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (pst != null) {
					try {
						pst.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return storyheadermodel;
		}
}
