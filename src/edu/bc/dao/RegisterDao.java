package edu.bc.dao;

import java.io.*;
import java.sql.*;
import java.util.logging.*;

//import edu.bc.bean.Member;					
import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.LoginModel;

public class RegisterDao {

	public static boolean validate(LoginModel register) {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstUser = null;
		PreparedStatement pstMember = null;
		ResultSet rs = null;
		long userId = 0;

		try {
			conn = ConnectionJDBC.getConnection();

			pstUser = conn.prepareStatement("insert into user(username, password) values(?, ?)");
			pstUser.setString(1, register.getUsername());
			pstUser.setString(2, register.getPassword());

			rs = pstUser.executeQuery();
			while (rs.next()) {
				userId = rs.getLong(1);
			}
			
			pstMember = conn.prepareStatement("insert into member(first_name, last_name, email, mobile, pesudonym) values(?, ?, ?, ?, ?, ?, ?)");
			pstMember.setString(1, register.getFirst_name());
			pstMember.setString(2, register.getLast_name());
			pstMember.setString(3, register.getEmail());
			pstMember.setString(4, register.getMobile());
			pstMember.setString(5, register.getPesudonym());
			pstMember.setLong(6, userId);
			
			rs = pstMember.executeQuery();

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
			if (pstUser != null || pstMember != null) {
				try {
					pstUser.close();
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