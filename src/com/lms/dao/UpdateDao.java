package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.lms.dto.ProjectDto;

public class UpdateDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@203.236.209.212:1521:xe";
	private String user = "scott";
	private String password = "tiger";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
		
	public UpdateDao() {
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
	
	public void UserUpdate(String id, String name, String pw, int lv,
			String mail, String phone, String post, String juso) {
		
		String address = post+"#"+juso;
		
		String sql = "update userlist set pw=?,lv=?,name=?,phone=?,address=?,mail=? where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, lv);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, address);
			pstmt.setString(6, mail);
			pstmt.setString(7, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//프로젝트 수정
		public void ProinfoUp(ProjectDto project) {
			String sql = "update project set subname=?,proexp=?,proorin=?,proren=? where proid=? and id=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, project.getSubname());
				pstmt.setString(2, project.getProexp());
				pstmt.setString(3, project.getProorin());
				pstmt.setString(4, project.getProren());
				pstmt.setString(5, project.getProid());
				pstmt.setString(6, project.getId());
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("SQL오류");
			}
			
		}
		//우선순위 변경
		public void updatePriority(String classid, int priority) throws SQLException {
			String sql = "";
			sql = "update class set priority="+ priority + " where classid = '" + classid + "'";

		
			System.out.println(sql);
			Statement st = null;
			try {
				//pstmt=conn.prepareStatement(sql);
				//rs=pstmt.executeQuery();
				st = conn.createStatement();
				st.executeUpdate(sql);
				
				
			}finally{
				if(st!=null) st.close();
//				if(rs!=null)rs.close();
//				if(pstmt!=null)pstmt.close();
//				if(conn!=null)conn.close();
			}
			
			
			
		}
	

}
