package edu.bc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.PaymentModel;
import edu.bc.model.StoryChapterModel;
import edu.bc.model.StoryDetailModel;

public class PaymentDao {

	public static boolean InsertPayment(PaymentModel paymentModel) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "insert into payment(story_header_id, story_detail_id, member_id) values("
					+ paymentModel.getStory_header_id() + ", " + paymentModel.getStory_detail_id() + ", "
					+ paymentModel.getMember_id() + ")";
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

	// SELECT * FROM payment WHERE slip IS NULL AND truemoney IS NULL AND
	// payment_confirm= 0
	public static List<PaymentModel> QueryPaymentByMemberId(int member_id) {

		List<PaymentModel> paymentModel = new ArrayList<PaymentModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement(
					" SELECT * FROM payment WHERE slip IS NULL AND truemoney IS NULL AND payment_confirm= 0 AND member_id=? ");
			pst.setInt(1, member_id);

			rs = pst.executeQuery();
			while (rs.next()) {
				PaymentModel tmp = new PaymentModel();
				tmp.setPayment_id(rs.getInt("payment_id"));
				tmp.setStory_header_id(rs.getInt("story_header_id"));
				tmp.setStory_detail_id(rs.getInt("story_detail_id"));
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setSlip(rs.getString("slip"));
				tmp.setPayment_confirm(rs.getInt("payment_confirm"));

				paymentModel.add(tmp);
			}
			// return paymentModel;

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
		return paymentModel;
	}

	public static List<StoryChapterModel> QueryStoryChapter(int memberId) {

		List<StoryChapterModel> storyChapterModel = new ArrayList<StoryChapterModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement("SELECT d.story_header_id, " + "h.story_header_name, "
					+ "h.story_header_content, " + "h.story_header_img, " + "h.story_header_price, "
					+ "d.story_detail_act, " + "d.story_detail_id, " + "d.story_detail_content, " + "h.member_id, "
					+ "(select count(*) from payment where story_detail_id = d.story_detail_id and  member_id = "
					+ memberId + ") as payment, "
					+ "(select count(*) from payment where story_detail_id = d.story_detail_id and  member_id = "
					+ memberId + " and payment_confirm = 1) as payment_confirm "
					+ "FROM story_detail d left outer join story_header h on d.story_header_id = h.story_header_id "
					+ "left outer join payment p on d.story_detail_id = p.story_detail_id "
					+ "WHERE p.member_id = ? AND p.payment_confirm = 0 AND p.slip IS NULL AND p.truemoney IS NULL "
					+ "order by d.story_detail_id");
			pst.setInt(1, memberId);

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
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setPayment(rs.getInt("payment"));
				tmp.setPayment_confirm(rs.getInt("payment_confirm"));

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

	public static List<StoryChapterModel> QueryConfirmPayment() {

		List<StoryChapterModel> storyChapterModel = new ArrayList<StoryChapterModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement("SELECT d.story_header_id, " + "h.story_header_name, "
					+ "h.story_header_content, " + "h.story_header_img, " + "h.story_header_price, "
					+ "d.story_detail_act, " + "d.story_detail_id, " + "d.story_detail_content, " + "h.member_id, "
					+ "p.slip, " + "p.truemoney, " + "p.payment_id, " + "p.timestamp, " + "0 as payment, "
					+ "0 as payment_confirm "
					+ "FROM story_detail d left outer join story_header h on d.story_header_id = h.story_header_id "
					+ "left outer join payment p on d.story_detail_id = p.story_detail_id "
					+ "WHERE p.payment_confirm = 0 AND (p.slip IS NOT NULL OR p.truemoney IS NOT NULL) "
					+ "order by d.timestamp desc");

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
				tmp.setMember_id(rs.getInt("member_id"));
				tmp.setPayment(rs.getInt("payment"));
				tmp.setPayment_confirm(rs.getInt("payment_confirm"));
				tmp.setSlip(rs.getString("slip"));
				tmp.setTruemoney(rs.getString("truemoney"));
				tmp.setTimestamp(rs.getString("timestamp"));
				tmp.setPayment_id(rs.getInt("payment_id"));

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

	public static boolean DeletePayment(int memberId, int storyDetailId) {
		boolean ret = false;
		Connection conn = null;
		String strSHSQL = "";
		String strSDSQL = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();

			strSHSQL = "delete from payment where member_id = " + memberId + " and story_detail_id = " + storyDetailId
					+ " ";
			stmt.executeUpdate(strSHSQL, Statement.RETURN_GENERATED_KEYS);

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

	public static boolean UpdatePayment(String slip, String truemoney, int memberId) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;
		if ("".equals(slip.trim())) {
			slip = "NULL";
		} else {
			slip = "'" + slip + "'";
		}
		if ("".equals(truemoney.trim())) {
			truemoney = "NULL";
		} else {
			truemoney = "'" + truemoney + "'";
		}
		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "update payment set slip = " + slip + ", truemoney = " + truemoney + " where member_id = "
					+ memberId + " and payment_confirm = 0 and slip IS NULL and truemoney IS NULL";
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

	public static boolean UpdateConfirmPayment(int paymentId) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "update payment set payment_confirm = 1 "
					+ " where payment_id = "+ paymentId;
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