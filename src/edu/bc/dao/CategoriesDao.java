package edu.bc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.CategoriesModel;
import edu.bc.model.StoryHeaderModel;

public class CategoriesDao {

	public static List<CategoriesModel> QueryCategories() {

		List<CategoriesModel> categoriesModel = new ArrayList<CategoriesModel>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement("select * from categories ");

			rs = pst.executeQuery();
			while (rs.next()) {
				CategoriesModel tmp = new CategoriesModel();
				tmp.setCategories_id(rs.getInt("categories_id"));
				tmp.setCategories_name(rs.getString("categories_name"));

				categoriesModel.add(tmp);
			}
			return categoriesModel;

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
		return categoriesModel;
	}

}
