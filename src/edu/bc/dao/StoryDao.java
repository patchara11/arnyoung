package edu.bc.dao;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;

//import edu.bc.bean.Member;					
import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.StoryChapterModel;
import edu.bc.model.StoryDetailModel;
import edu.bc.model.StoryHeaderModel;

public class StoryDao {

	public static List<StoryHeaderModel> QueryStoryHeader(int member_id) {

		List<StoryHeaderModel> storyheadermodel = new ArrayList<StoryHeaderModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement(
					"select c.categories_name, h.member_id, h.story_header_content, h.story_header_id, h.story_header_img, h.story_header_name, h.story_header_price, h.categories_id  from story_header h inner join categories c on h.categories_id = c.categories_id "
							+ "where h.member_id= ? order by h.story_header_name ");
			pst.setInt(1, member_id);

			rs = pst.executeQuery();
			while (rs.next()) {
				StoryHeaderModel tmp = new StoryHeaderModel();
				tmp.setCategories_name(rs.getString(("categories_name")));
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setStory_header_content(rs.getString("story_header_content"));
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_header_img(rs.getString("story_header_img"));
				tmp.setStory_header_name(rs.getString("story_header_name"));
				tmp.setStory_header_price(rs.getDouble("story_header_price"));
				tmp.setCategories_id(rs.getInt("categories_id"));

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

	public static List<StoryHeaderModel> QueryStoryHeaderByCategories(int categories_id) {

		List<StoryHeaderModel> storyheadermodel = new ArrayList<StoryHeaderModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement(
					"select c.categories_name, h.member_id, h.story_header_content, h.story_header_id, h.story_header_img, h.story_header_name, h.story_header_price, h.categories_id  from story_header h inner join categories c on h.categories_id = c.categories_id "
							+ "where h.categories_id= ? order by h.story_header_name LIMIT 5 ");
			pst.setInt(1, categories_id);

			rs = pst.executeQuery();
			while (rs.next()) {
				StoryHeaderModel tmp = new StoryHeaderModel();
				tmp.setCategories_name(rs.getString(("categories_name")));
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setStory_header_content(rs.getString("story_header_content"));
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_header_img(rs.getString("story_header_img"));
				tmp.setStory_header_name(rs.getString("story_header_name"));
				tmp.setStory_header_price(rs.getDouble("story_header_price"));
				tmp.setCategories_id(rs.getInt("categories_id"));

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
	
	public static List<StoryHeaderModel> QueryStoryHeaderTop() {

		List<StoryHeaderModel> storyheadermodel = new ArrayList<StoryHeaderModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement(
					"select c.categories_name, h.member_id, h.story_header_content, h.story_header_id, h.story_header_img, h.story_header_name, h.story_header_price, h.categories_id  from story_header h inner join categories c on h.categories_id = c.categories_id "
							+ "order by h.count_click desc LIMIT 1 ");

			rs = pst.executeQuery();
			while (rs.next()) {
				StoryHeaderModel tmp = new StoryHeaderModel();
				tmp.setCategories_name(rs.getString(("categories_name")));
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setStory_header_content(rs.getString("story_header_content"));
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_header_img(rs.getString("story_header_img"));
				tmp.setStory_header_name(rs.getString("story_header_name"));
				tmp.setStory_header_price(rs.getDouble("story_header_price"));
				tmp.setCategories_id(rs.getInt("categories_id"));

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
	
	public static List<StoryHeaderModel> QueryStoryHeaderByCategoriesTop(int categories_id) {

		List<StoryHeaderModel> storyheadermodel = new ArrayList<StoryHeaderModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement(
					"select c.categories_name, h.member_id, h.story_header_content, h.story_header_id, h.story_header_img, h.story_header_name, h.story_header_price, h.categories_id  from story_header h inner join categories c on h.categories_id = c.categories_id "
							+ "where h.categories_id= ? order by h.count_click desc LIMIT 1 ");
			pst.setInt(1, categories_id);

			rs = pst.executeQuery();
			while (rs.next()) {
				StoryHeaderModel tmp = new StoryHeaderModel();
				tmp.setCategories_name(rs.getString(("categories_name")));
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setStory_header_content(rs.getString("story_header_content"));
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_header_img(rs.getString("story_header_img"));
				tmp.setStory_header_name(rs.getString("story_header_name"));
				tmp.setStory_header_price(rs.getDouble("story_header_price"));
				tmp.setCategories_id(rs.getInt("categories_id"));

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
	
	public static List<StoryChapterModel> QueryStoryChapter(String storyHeaderId) {

		List<StoryChapterModel> storyChapterModel = new ArrayList<StoryChapterModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement("SELECT d.story_header_id, " + "h.story_header_name, "
					+ "h.story_header_content, " + "h.story_header_img, " + "h.story_header_price, "
					+ "d.story_detail_act, " + "d.story_detail_id, " + "d.story_detail_content "
					+ "FROM story_detail d left outer join story_header h on d.story_header_id = h.story_header_id "
					+ "WHERE d.story_header_id = ? " + "order by d.story_detail_id");
			pst.setInt(1, Integer.parseInt(storyHeaderId));

			rs = pst.executeQuery();
			while (rs.next()) {
				StoryChapterModel tmp = new StoryChapterModel();
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_header_name(rs.getString("story_header_name"));
				tmp.setStory_header_content(rs.getString("story_header_content"));
				tmp.setStory_header_img(rs.getString("story_header_img"));
				tmp.setStory_header_price(rs.getDouble("story_header_price"));
				tmp.setStory_detail_act(rs.getString("story_detail_act"));
				tmp.setStory_detail_id(rs.getInt("story_detail_id"));
				tmp.setStory_detail_content(rs.getString("story_detail_content").replaceAll("\n", ""));

				storyChapterModel.add(tmp);
			}
			return storyChapterModel;

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
		return storyChapterModel;
	}

	public static boolean InsertStoryHeader(StoryHeaderModel storyheadermodel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "insert into story_header(story_header_name, story_header_content, story_header_img, story_header_price, member_id, categories_id) values('"
					+ storyheadermodel.getStory_header_name() + "', '" + storyheadermodel.getStory_header_content()
					+ "', '" + storyheadermodel.getStory_header_img() + "', " + storyheadermodel.getStory_header_price()
					+ ", " + storyheadermodel.getMember_id() + ", " + storyheadermodel.getCategories_id() + ")";
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

	public static boolean UpdateStoryHeader(StoryHeaderModel storyheadermodel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			if (storyheadermodel.getStory_header_img() != null && !"".equals(storyheadermodel.getStory_header_img())) {
				strUser = "update story_header set story_header_name = '" + storyheadermodel.getStory_header_name()
						+ "', story_header_content = '" + storyheadermodel.getStory_header_content() + "', "
						+ "story_header_img = '" + storyheadermodel.getStory_header_img() + "' , "
						+ "story_header_price = " + storyheadermodel.getStory_header_price() + " "
						+ "where story_header_id = " + storyheadermodel.getStory_header_id();
			} else {
				strUser = "update story_header set story_header_name = '" + storyheadermodel.getStory_header_name()
						+ "', story_header_content = '" + storyheadermodel.getStory_header_content() + "' , "
						+ "story_header_price = " + storyheadermodel.getStory_header_price() + " "
						+ "where story_header_id = " + storyheadermodel.getStory_header_id();
			}
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

	// UpdateStoryDetail
	public static boolean UpdateStoryDetail(StoryDetailModel storydetailmodel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "update story_detail set story_detail_act = '" + storydetailmodel.getStory_detail_act()
					+ "', story_detail_content = '" + storydetailmodel.getStory_detail_content()
					+ "' where story_detail_id = " + storydetailmodel.getStory_detail_id() + " ";
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

	public static boolean DeleteStoryHeader(String id) {
		boolean ret = false;
		Connection conn = null;
		String strSHSQL = "";
		String strSDSQL = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();

			strSHSQL = "delete from story_header where story_header_id = " + id;
			stmt.executeUpdate(strSHSQL, Statement.RETURN_GENERATED_KEYS);

			strSDSQL = "delete from story_detail where story_header_id = " + id;
			stmt.executeUpdate(strSDSQL, Statement.RETURN_GENERATED_KEYS);

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

	public static boolean DeleteStoryDetail(String id) {
		boolean ret = false;
		Connection conn = null;
		String strSDSQL = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();

			strSDSQL = "delete from story_detail where story_detail_id = " + id;
			stmt.executeUpdate(strSDSQL, Statement.RETURN_GENERATED_KEYS);

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

	public static boolean InsertStoryDetail(StoryDetailModel storydetailmodel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "insert into story_detail(story_detail_act, story_detail_content, story_header_id) values('"
					+ storydetailmodel.getStory_detail_act() + "', '" + storydetailmodel.getStory_detail_content()
					+ "', " + storydetailmodel.getStory_header_id() + ")";
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
