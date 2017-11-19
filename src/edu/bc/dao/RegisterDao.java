package edu.bc.dao;

import java.io.*;
import java.sql.*;
import java.util.logging.*;

//import com.sun.javafx.binding.StringFormatter;

//import edu.bc.bean.Member;					
import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.LoginModel;

public class RegisterDao {

	public static boolean validate(LoginModel register) {
		boolean ret = false;
		Connection conn = null;
		String strUser = "";
		PreparedStatement pstMember = null;
		ResultSet rs = null;
		int userId = 0;
		

		try {
			conn = ConnectionJDBC.getConnection();
			Statement stmt = conn.createStatement();
			strUser = "insert into user(username, password) values('"+register.getUsername()+"', '"+register.getPassword()+"')";
			stmt.executeUpdate(strUser, Statement.RETURN_GENERATED_KEYS);

			rs = stmt.getGeneratedKeys();
			while (rs.next()) {
				userId = rs.getInt(1);
			}
			
			pstMember = conn.prepareStatement("insert into member(first_name, last_name, email, mobile, pesudonym, user_id) values(?, ?, ?, ?, ?, ?)");
			pstMember.setString(1, register.getFirst_name());
			pstMember.setString(2, register.getLast_name());
			pstMember.setString(3, register.getEmail());
			pstMember.setString(4, register.getMobile());
			pstMember.setString(5, register.getPesudonym());
			pstMember.setLong(6, userId);
			
			pstMember.executeUpdate();

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