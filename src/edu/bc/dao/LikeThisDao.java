package edu.bc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.LikeThisModel;
import edu.bc.model.StoryHeaderModel;

public class LikeThisDao {
	
	public static boolean InsertLikeThis(LikeThisModel likethismodel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "insert into like_this(story_header_id, member_id) values("
					+ likethismodel.getStory_header_id()+ ", " + likethismodel.getMember_id()+ ")";
			stmt.executeUpdate(strUser, Statement.RETURN_GENERATED_KEYS);
			ret = true;
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
			if (pstMember != null) {
				try {
					pstMember.close();
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
		return ret;
	}

	public static boolean DeleteLikeThis(LikeThisModel likethismodel) {
		// TODO Auto-generated method stub
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "delete from like_this where member_id = "+ likethismodel.getMember_id()+ " ";
			stmt.executeUpdate(strUser, Statement.RETURN_GENERATED_KEYS);
			ret = true;
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
			if (pstMember != null) {
				try {
					pstMember.close();
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
		return ret;
	}


}
