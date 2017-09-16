package edu.bc.dao;

import java.io.*;
import java.sql.*;
import java.util.logging.*;

//import edu.bc.bean.Member;					
import edu.bc.jdbc.ConnectionJDBC;
import edu.bc.model.LoginModel;

public class LoginDao {

	public static LoginModel validate(String name, String pass) {
		
		LoginModel login = new LoginModel() ;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		
		try {
			conn = ConnectionJDBC.getConnection();

			pst = conn.prepareStatement("select u.user_id, "
	   				 + "u.username, "
	   				 + "u.password, "
	   				 + "m.member_id, "
	   				 + "m.first_name, "
	   				 + "m.last_name, "
	   				 + "m.email, "
	   				 + "m.mobile, "
	   				 + "m.pesudonym "
	   				 + "from user u inner join member m "
	   				 + "on u.user_id = m.user_id "
	   				 + "where u.username=? and u.password=? ");
	   		 pst.setString(1, name);
	   		 pst.setString(2, pass);




			rs = pst.executeQuery();
			while( rs.next()){
	               	login.setUser_id(rs.getInt("user_id"));
	               	login.setMember_id(rs.getInt("member_id"));
	               	login.setUsername(rs.getString("username"));
	               	login.setPassword(rs.getString("password"));
	               	login.setFirst_name(rs.getString("first_name"));
	               	login.setLast_name(rs.getString("last_name"));
	               	login.setEmail(rs.getString("email"));
	               	login.setMobile(rs.getString("mobile"));
	               	login.setPesudonym(rs.getString("pesudonym"));
			}
	           return login;

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
		return login;
	}
}