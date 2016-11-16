package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.dto.JoblistDto;
import com.lms.dto.MemDto;
import com.lms.dto.ProjectDto;

public class DetailDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@203.236.209.212:1521:xe";
	private String user = "scott";
	private String password = "tiger";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DetailDao() {
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
	
//구인구직 디테일
	public JoblistDto JobDetail(String id) throws Exception {
		// TODO Auto-generated method stub
		JoblistDto dto = new JoblistDto();
		String sql = "select * from joblist where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new JoblistDto(rs.getString("id"),
						rs.getString("adminid"), rs.getString("jobname"),
						rs.getString("jobcont"), rs.getString("jobweb"),
						rs.getString("jobfile"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return dto;
	}
	
//아이디찾기
	public String findID(String name, String mail) throws Exception {
		// TODO Auto-generated method stub
		String findID = "";
		String nameString = name.trim();
		String mailString = mail.trim();
		String sql = "select * from userlist where name=? and mail=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nameString);
			pstmt.setString(2, mailString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findID = rs.getString("id");
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return findID;
	}
	
//비밀번호찾기
	public int findPW(String id, String pw, String name, String mail)
			throws Exception {
		// TODO Auto-generated method stub
		String findID = "";
		String nameString = name.trim();
		String mailString = mail.trim();
		String sql = "select * from userlist where name=? and mail=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nameString);
			pstmt.setString(2, mailString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findID = rs.getString("id");
			}

			String idString = id.trim();
			String pwString = pw.trim();
			System.out.println("idString"+idString+" pwString : "+pwString);
			if (idString.equals(findID)) {
				String sql2 = "update userlist set pw=? where id=?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, pwString);
				pstmt.setString(2, idString);
				result = pstmt.executeUpdate();
			}else{
				result=-1;
			}
		} finally {
			if(rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	//마이페이지 자신 info
	public MemDto MemberOne(String id) throws Exception {
		// TODO Auto-generated method stub			
			String sql = "select id,pw,lv,name,phone,address,mail from userlist where id = ?";
			
			MemDto dto = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					dto = new MemDto();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setLv(rs.getInt("lv"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));
					dto.setMail(rs.getString("mail"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				
			}
			
			return dto;
		}//마이페이지 자신 info
	
	//과제 상세페이지
	 public List<ProjectDto> TeaProDetail(String proid, String id) throws Exception {
		   List<ProjectDto> teaprodetail = new ArrayList<ProjectDto>();
		   String sql = "select C.testid, C.proid, C.subname, D.name, C.proexp, C.proorin, D.name, C.id, C.grade from "
				   +"(select A.proid as proid, A.subname as subname, A.proexp as proexp, "
				   +"A.proorin as proorin, A.id as id, B.grade as grade, B.testid as testid from project A, test B "
				   +"where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid=\'"+proid+"\' and C.id=\'"+id+"\'";
	//sql 수정 
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					teaprodetail.add( new ProjectDto(rs.getString("proid"),
							rs.getString("subname"),
							rs.getString("proexp"),rs.getString("proorin")
						  ,rs.getString("id"),rs.getString("name"),
						  rs.getString("testid"),rs.getInt("grade")));
//					System.out.println(teaprodetail.get(0).toString());
				}
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}
		   return teaprodetail;   
	   }
		
	//프로젝트 내용
		public ProjectDto StuProDetail(String proid, String stuid) throws SQLException {
			
			String sql = "select proid,classid,proname,subname,proexp,proorin,proren,id from project where proid=? and id=?";

			List<ProjectDto> list = new ArrayList<ProjectDto>();		
			ProjectDto dto = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, proid);
				pstmt.setString(2, stuid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					dto = new ProjectDto(rs.getString("proid"),rs.getString("classid"),rs.getString("proname"),rs.getString("subname")
							,rs.getString("proexp"),rs.getString("proorin"),rs.getString("proren"),rs.getString("id"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
			
			return dto;
		}
}
