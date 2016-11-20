package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lms.dto.ProjectDto;

public class InsertDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@203.236.209.212:1521:xe";
	private String user = "scott";
	private String password = "tiger";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public InsertDao() {
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

	// 회원가입
	public int UserInsert(String id, String name, String pw, int lv,
			String mail, String phone, String post, String juso) throws Exception {

		String address = post + "#" + juso;
		//int phoneInt = Integer.parseInt(phone.trim());

		String sql = "insert into userlist (id,pw,lv,name,phone,address,mail) values (?,?,?,?,?,?,?)";

		int result=0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setInt(3, lv);
			pstmt.setString(4, name);
			pstmt.setString(5, phone);
			//phone:010-1234-1111 형태
			pstmt.setString(6, address);
			pstmt.setString(7, mail);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}// 회원가입

	// 수강신청
	public int LectInser(String id, String classid) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		/*
		 * id varchar(12), stuid varchar2(12), stuname varchar2(20), lectid
		 * varchar2(20), agreed number(1)
		 */
		//
		String sql = "select name from userlist where id=\'" + id + "\'";
		// 테이블명 확인!!!!!!!(완료)

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String name = "";
			if (rs.next()) {
				name = rs.getString("name");
			}

			//
			String agreedId = id.substring(1)+"_"+classid.substring(1);

			String sqlInser = "insert into agreed values(\'"+agreedId+"\',?,?,?,0)";
			// 테이블명 확인!!!!!!!(완료)

			pstmt = conn.prepareStatement(sqlInser);
			// ④ 쿼리 실행
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, classid);

			result = pstmt.executeUpdate();
			// ⑤ 쿼리 실행의 결과값(int, ResultSet) 사용
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	
	//수강승인
	public int AgreedInser(String lectid, String stuid) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		String param1 = stuid.trim();
		String param2 = lectid.trim();
		String sql = "update agreed set agreed=1 where stuid=? and lectid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param1);
			pstmt.setString(2, param2);
			result = pstmt.executeUpdate();
			if(result > 0){
				String sqlSuup = "insert into student values (?, ?, 0)";
				pstmt = conn.prepareStatement(sqlSuup);
				pstmt.setString(1, param1);
				pstmt.setString(2, param2);
				result = pstmt.executeUpdate();				
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if(conn !=null)
				conn.close();
		}
		return result;
	}//agreedinser
	
//성적입력
	public int ScoreInser(String id, int grade, String testid) throws Exception{
		int result = 0;
		String sql = "update test set grade=? where testid=\'"+testid+"\' and id=\'"+id+"\'";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, grade);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}		
		
		return result;	
	}//성적입력	
	//프로젝트 등록
		public void ProjectInsert(ProjectDto project) {
			String sql = "insert into project (proid,classid,proname,subname,proexp,proorin,proren,id) values (?,?,?,?,?,?,?,?)";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, project.getProid());
				pstmt.setString(2, project.getLectid());
				pstmt.setString(3, project.getProname());
				pstmt.setString(4, project.getSubname());
				pstmt.setString(5, project.getProexp());
				pstmt.setString(6, project.getProorin());
				pstmt.setString(7, project.getProren());
				pstmt.setString(8, project.getId());
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("SQL오류");
			}
		}
}
