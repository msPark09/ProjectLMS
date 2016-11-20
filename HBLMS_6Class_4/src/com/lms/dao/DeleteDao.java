package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	/*@203.236.209.212*/
	private String user = "scott";
	private String password = "tiger";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DeleteDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//수강신청승인삭제
	public int AgreedDelete(String stuid, String lectid) throws Exception {
		// TODO Auto-generated method stub
		int result =0;

		String param1 = stuid.trim();
		String param2 = lectid.trim();
		String sql = "delete from agreed where stuid=? and lectid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param1);
			pstmt.setString(2, param2);
			result = pstmt.executeUpdate();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if(conn !=null)
				conn.close();
		}		
		return result;
	}//수강신청승인삭제

}
