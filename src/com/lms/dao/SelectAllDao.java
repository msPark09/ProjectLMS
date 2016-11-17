package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.dto.AgreedDto;
import com.lms.dto.JoblistDto;
import com.lms.dto.LectureDto;
import com.lms.dto.MemDto;
import com.lms.dto.ProjectDto;
import com.lms.dto.ProlistDto;
import com.lms.dto.SuupDto;

public class SelectAllDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@203.236.209.212:1521:xe";
	private String user = "scott";
	private String password = "tiger";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public SelectAllDao() {
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

	// joblist
	public List<JoblistDto> JobList() throws Exception {
		// TODO Auto-generated method stub
		List<JoblistDto> list = new ArrayList<JoblistDto>();
		String sql = "select * from joblist";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new JoblistDto(rs.getString("id"), rs
						.getString("adminid"), rs.getString("jobname")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}// joblist

	public int IdCheck(String id) {

		String sql = "Select count(*) As imsi From ex_table Where db_id=?";
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			count = rs.getInt("imsi");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}// idcheck

	public MemDto Login(String id, String pw) throws Exception {

		String sql = "select * from userlist where id = ?";

		MemDto dto = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					dto = new MemDto();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setLv(rs.getInt("lv"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));
					dto.setMail(rs.getString("mail"));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return dto;
	}// login

	// 메인의강의리스트Selectall
	public List<LectureDto> LectList() throws SQLException {
		//
		String sql = "select * from class where statu=0 order by priority";
		// 테이블명 변경 확인!!!!!
		// 모집중인 강의만 노출!!!!
		//
		List<LectureDto> list = null;
		list = new ArrayList<LectureDto>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				// 가장 간략한 코딩.
				// list.add(new
				// TodoDto(rs.getString("cname"),rs.getInt("priority")));

				// 두번째로 간략한 코딩
				// TodoDto dto = new
				// TodoDto(rs.getString("cname"),rs.getInt("priority"));
				// list.add( dto );

				// 가장 라인수는 많지만, 이해하기 쉬운 코딩.
				String cname = rs.getString("cname");
				int priority = rs.getInt("priority");
				String classid = rs.getString("classid");
				String division = rs.getString("division");

				LectureDto dto = new LectureDto();
				dto.setCname(cname);
				dto.setPriority(priority);
				dto.setClassid(classid);
				dto.setDivision(division);
				list.add(dto);
			}
		} finally {

			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;

	}// 메인의강의리스트Selectall
		// 수강중 리스트

	public List<LectureDto> selectAll() throws Exception {

		String sql = "select * from class where statu=1";// 수강중 우선 노출

		List<LectureDto> list = new ArrayList<LectureDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new LectureDto(rs.getString("classid"), rs
						.getString("cname"), rs.getString("division")));
			}
			for (LectureDto bean : list) {
				String sqlCnt = "select count(*) as cnt from student where classid=?";
				pstmt = conn.prepareStatement(sqlCnt);
				pstmt.setString(1, bean.getClassid());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setCnt(rs.getInt("cnt"));
				}
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return list;
	}// 행정팀selectAll
		// 수강생리스트

	public List<SuupDto> attendList(String lectid) throws Exception {
		// TODO Auto-generated method stub

		List<SuupDto> list = new ArrayList<SuupDto>();
		System.out.println(lectid);

		String sql = "select * from student inner join userlist on student.id = userlist.id where student.classid = \'"
				+ lectid + "\' order by attday";
		try {
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, lectid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new SuupDto(rs.getString("id"), rs
						.getString("classid"), rs.getInt("attday"), rs
						.getString("name"), rs.getString("phone")));
			}
			String sqlTotalDay = "select * from class where classid =\'"
					+ lectid + "\'";
			// pstmt.setString(1, lectid);
			int totalDay = 0;
			if (list.size() > 0) {
				pstmt = conn.prepareStatement(sqlTotalDay);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					totalDay = rs.getInt("lectday");
					list.get(0).setTotalDay(totalDay);
				}
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}// attendlist
		// 수강생리스트

	// 수강 승인 리스트
	public List<AgreedDto> AgreedSelectAll() throws Exception {
		// TODO Auto-generated method stub
		List<AgreedDto> list = new ArrayList<AgreedDto>();

		String sql = "select * from agreed order by id";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new AgreedDto(rs.getString("lectid"), rs
						.getString("stuid"), rs.getString("stuname"), rs
						.getInt("agreed")));
			}
			if (list.size() > 0) {
				for (AgreedDto bean : list) {
					String sqlLect = "select * from class where classid=?";
					pstmt = conn.prepareStatement(sqlLect);
					pstmt.setString(1, bean.getLectid());
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bean.setLectname(rs.getString("cname"));
						bean.setLectstatu(rs.getString("division"));
					}
				}
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}// agreedselectall

	// 강의중 강의리스트
	public List<LectureDto> TeaLecList(String id) throws Exception {
		// TODO Auto-generated method stub
		List<LectureDto> list = new ArrayList<LectureDto>();

		String sql = "select classid,cname,division from class where teacid=\'"
				+ id.trim() + "\'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new LectureDto(rs.getString("classid"), rs
						.getString("cname"), rs.getString("division")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	// 강의수강생리스트
	public List<SuupDto> TeaStuList(String classid) throws Exception {
		// TODO Auto-generated method stub
		List<SuupDto> teastulist = new ArrayList<SuupDto>();

		String sql = "select name, phone from (select * from userlist A, student B where A.id = B.id) where classid=\'"
				+ classid + "\' order by name";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				teastulist.add(new SuupDto(rs.getString("name"), rs
						.getString("phone")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return teastulist;
	}// 강의수강생리스트

	// 강의프로젝트리스트
	public List<ProlistDto> TeaProjectList(String classid) throws Exception {
		List<ProlistDto> prolist = new ArrayList<ProlistDto>();

		String sql = "select proid, proname, proday from prolist where classid=\'"
				+ classid + "\' order by proday";
		ProlistDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ProlistDto(rs.getString("proid"),
						rs.getString("proname"), rs.getDate("proday"));

				prolist.add(dto);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		ArrayList<ProlistDto> classname = new ArrayList<ProlistDto>();
		if (prolist.size() > 0) {
			String name = prolist.get(0).getProname();
			classname.add(prolist.get(0));
			for (int i = 0; i < prolist.size(); i++) {
				String name2 = prolist.get(i).getProname();
				if (!name.equals(name2)) {
					classname.add(prolist.get(i));
					name = name2;
				}
			}
		}
		return classname;
	}// 강의프로젝트리스트

	// 강의선택 후 제출한 프로젝트 목록
	public List<ProjectDto> LectproList(String proname) throws Exception {
		List<ProjectDto> lectprolist = new ArrayList<ProjectDto>();

		String sql = "select c.proid, c.subname, d.name ,c.id, c.testid, "
				+ "c.grade from (select a.proid, a.classid, a.proname, "
				+ "a.subname, a.proexp, a.proorin, a.proren, a.id, b.testid, "
				+ "b.grade from PROJECT A, test B where a.PROID = b.proid) c "
				+ "inner join userlist d on c.id=d.id where c.proname=\'"+proname+"\'";
		ProjectDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ProjectDto(rs.getString("proid"),
						rs.getString("subname"), rs.getString("id"),
						rs.getString("name"), rs.getString("testid"),
						rs.getInt("grade"));
				lectprolist.add(dto);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		
		return lectprolist;
	}// 강의선택 후 제출한 프로젝트 목록

	// 회원조회 전체검색
	public List<MemDto> MemList() throws Exception {
		// TODO Auto-generated method stub
		List<MemDto> list = new ArrayList<MemDto>();
		String sql = "select * from userlist";
		MemDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new MemDto(rs.getString("id"), rs.getInt("lv"),
						rs.getString("name"), rs.getString("phone"),
						rs.getString("mail"));
				list.add(dto);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	// 프로젝트 리스트
	public List<ProlistDto> StuProjectList(String lectid, String id) {

		String sql = "select proid,stuid,classid,cname,proname,procont,proday,name,id from (";
		sql += "select A.proid, A.stuid, A.classid,A.proname, A.procont, A.proday, A.name, A.id,";
		sql += "B.cname from PROLIST A INNER JOIN CLASS B ON A.CLASSID = B.CLASSID";
		sql += ") where stuid=? and classid=?";

		List<ProlistDto> list = new ArrayList<ProlistDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, lectid);
			System.out.println(id);
			System.out.println(lectid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ProlistDto(rs.getString("proid"), rs
						.getString("stuid"), rs.getString("classid"), rs
						.getString("cname"), rs.getString("proname"), rs
						.getString("procont"), rs.getDate("proday"), rs
						.getString("name"), rs.getString("id")));
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProlistDto> StuLectList(String id) {

//		String sql = "select A.classid,A.cname,A.statu,A.stuid,A.agreed,B.grade from (";
//		sql += "select classid,cname,statu,stuid,agreed from (";
//		sql += "select A.classid,A.cname,A.statu,B.stuid,B.agreed from class A inner join agreed B on A.classid = B.lectid";
//		sql += ") where stuid=? and agreed=1";
//		sql += ") A left join test B on A.classid = B.classid and A.stuid = B.id";
		String sql="select b.id, b.classid,  from STUDENT b inner join class a on a.classid=b.classid where id=?";

		List<ProlistDto> list = new ArrayList<ProlistDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// System.out.println(rs);
			while (rs.next()) {
//				list.add(new ProlistDto(rs.getString("cname"), rs
//						.getInt("grade"), rs.getString("classid"), rs
//						.getString("stuid"), rs.getString("statu")));
				ProlistDto dto = new ProlistDto();
				dto.setLect(rs.getString("cname"));
				dto.setLectid(rs.getString("classid"));
				dto.set
				list.add()
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// 우선순위 불러오기
	public List<LectureDto> Todo() throws SQLException {
		String sql = "select * from class order by priority";
		List<LectureDto> list = null;
		list = new ArrayList<LectureDto>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				// 가장 간략한 코딩.
				// list.add(new
				// TodoDto(rs.getString("cname"),rs.getInt("priority")));

				// 두번째로 간략한 코딩
				// TodoDto dto = new
				// TodoDto(rs.getString("cname"),rs.getInt("priority"));
				// list.add( dto );

				// 가장 라인수는 많지만, 이해하기 쉬운 코딩.
				String cname = rs.getString("cname");
				int priority = rs.getInt("priority");
				String classid = rs.getString("classid");

				LectureDto dto = new LectureDto();
				dto.setCname(cname);
				dto.setPriority(priority);
				dto.setClassid(classid);
				list.add(dto);

			}
		} finally {

			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;

	}
}
