package com.lms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.lms.dto.AgreedDto;
import com.lms.dto.JoblistDto;
import com.lms.dto.LectureDto;
import com.lms.dto.MemDto;
import com.lms.dto.ProjectDto;
import com.lms.dto.ProlistDto;
import com.lms.dto.SuupDto;

public class SearchDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@203.236.209.212:1521:xe";
	private String user = "scott";
	private String password = "tiger";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public SearchDao() {
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

	// JobSearch()
	public List<JoblistDto> JobSearch(String op, String sel) throws Exception {
		// TODO Auto-generated method stub
		/*
		 * 제목 : 0 작성자 :1
		 */
		List<JoblistDto> list = new ArrayList<JoblistDto>();
		String temp = "\'%" + sel + "%\'";
		String sql = "select * from joblist";
		if (op.equals("0"))
			sql += " where jobname like " + temp;
		else
			sql += " where adminid like " + temp;
		System.out.println(sql);
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
	}// jobsearch

	// adm 강의 리스트
	public List<LectureDto> selectOne(String sel, String op) throws Exception {

		List<LectureDto> list = new ArrayList<LectureDto>();
		String temp = "\'%" + sel + "%\'";
		if (op.equals("0")) {
			op = "\'%%\'";
		} else if (op.equals("3"))
			op = "\'0\'";
		System.out.println(temp);
		System.out.println(op);

		String sql = "select * from class where cname like " + temp
				+ " and statu like " + op;
		System.out.println(sql);
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
	}// adm 강의 리스트

	// 수강생 검색 리스트
	public List<SuupDto> attendListOne(String sel, String lectid)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("lectid : " + lectid);
		System.out.println("sel : " + sel);
		String lectidString = lectid.trim();
		String selString = "%" + sel.trim() + "%";

		List<SuupDto> list = new ArrayList<SuupDto>();
		String sql = "select userlist.id, classid, attday,pw,lv,name,phone,address,mail from student inner join userlist on student.id = userlist.id where student.classid =\'"
				+ lectidString + "\'";
		try {
			String sqlSearch = "select * from (" + sql + ") where name like ? ";
			pstmt = conn.prepareStatement(sqlSearch);
			pstmt.setString(1, selString);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new SuupDto(rs.getString("id"), rs
						.getString("classid"), rs.getInt("attday"), rs
						.getString("name"), rs.getString("phone")));
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

	}// attendlistone

	// 출석율50이하학생찾기
	public List<SuupDto> HalfAttendList(String lectid, int totalday)
			throws Exception {
		// TODO Auto-generated method stub
		String lectidString = lectid.trim();
		int selString = totalday;
		List<SuupDto> list = new ArrayList<SuupDto>();
		String sql = "select userlist.id, classid, attday,pw,lv,name,phone,address,mail from student inner join userlist on student.id = userlist.id where student.classid =\'"
				+ lectidString + "\'";
		try {
			String sqlSearch = "select * from (" + sql + ") where attday <= ?";
			pstmt = conn.prepareStatement(sqlSearch);
			pstmt.setInt(1, selString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new SuupDto(rs.getString("id"), rs
						.getString("classid"), rs.getInt("attday"), rs
						.getString("name"), rs.getString("phone")));
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
	}// HalfAttendList

	// 수강승인내검색
	public List<AgreedDto> searAgreed(String op, String sel) throws Exception {
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
		/*
		 * 제목:0(강의이름) 구분:1(수강중/모집중/모집종료) 이름:2(신청자 이름) 수강신청:3(승인여부)
		 */

		sel = ".*" + sel.trim() + ".*";
		op = op.trim();
		List<AgreedDto> searList = new ArrayList<AgreedDto>();
		for (int i = 0; i < list.size(); i++) {
			if (op.equals("0")) {
				// 제목
				String lectid = list.get(i).getLectname();
				if (lectid.matches(sel))
					searList.add(list.get(i));
			} else if (op.equals("1")) {
				// 구분
				String lectstatu = list.get(i).getLectstatu();
				if (lectstatu.matches(sel))
					searList.add(list.get(i));
			} else if (op.equals("2")) {
				// 이름
				String stuname = list.get(i).getStuname();
				if (stuname.matches(sel))
					searList.add(list.get(i));
			} else {
				// 수강신청
				int agreed = list.get(i).getAgreed();
				String agrString = "no n 승인미완료 미완료 미승인 NO N";
				if (agrString.matches(sel)) {
					if (agreed == 0)
						searList.add(list.get(i));
				} else {
					if (agreed == 1)
						searList.add(list.get(i));
				}
			}
		}
		return searList;
	}// 수강승인내검색

	// 강사 강의 검색
	public List<LectureDto> searLectOneTea(String teacid, String op, String sel)
			throws Exception {
		// public List<LectureDto> searLectOneTea(String id,String op, String
		// sel) {
		// TODO Auto-generated method stub
		List<LectureDto> list = new ArrayList<LectureDto>();
		String selString = "\'%" + sel.trim() + "%\'";
		String sql = "select classid,cname,division from class where teacid=\'"+teacid.trim()+"\' and cname like "
				+ selString;
		/*
		 * 통합검색 :0 강의종료 :1 강의중 :2
		 */
		if (op.equals("1"))
			sql += " and division=\'수강종료\'";
		else if (op.equals("2"))
			sql += " and division=\'수강중\'";
		// sql 수정
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString("classid"));
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
	}// 강사 강의 검색

	// 강사 수강생 검색
	public List<SuupDto> searStuOneTea(String op, String sel, String classid)
			throws Exception {
		// TODO Auto-generated method stub
		List<SuupDto> teastulist = new ArrayList<SuupDto>();
		String clString = classid.trim();
		String sql = "select name, phone from (select * from userlist A, student B where A.id = B.id) where classid=\'"
				+ clString + "\' order by name";
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
		// 기존 리스트 받기
		List<SuupDto> list = new ArrayList<SuupDto>();
		/*
		 * 이름 : 0 전화번호 : 1
		 */
		String tmp = ".*" + sel.trim() + ".*";
		for (SuupDto bean : teastulist) {
			if (op.equals("0") && bean.getName().matches(tmp))
				// 이름
				list.add(bean);
			else if (op.equals("1") && bean.getPh().matches(tmp))
				// 전화번호
				list.add(bean);
		}
		return list;
	}// 강사 수강생 검색

	// 강의 내 프로젝트 검색
	public List<ProlistDto> searProjectTea(String op, String sel, String classid)
			throws Exception {
		// TODO Auto-generated method stub
		List<ProlistDto> prolist = new ArrayList<ProlistDto>();
		String clString = classid.trim();
		String sql = "select proid, proname, proday from prolist where classid=\'"
				+ clString + "\' order by proday";
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
		// 기존 리스트 받기

		List<ProlistDto> list = new ArrayList<ProlistDto>();
		/*
		 * 제목 : 0 날짜 : 1
		 */
		String temp = ".*" + sel.trim() + ".*";
		for (ProlistDto bean : prolist) {
			if (op.equals("0") && bean.getProname().matches(temp))
				// 제목
				list.add(bean);
			else if (op.equals("1")) {
				// 날짜
				Date from = new Date();
				from = bean.getProday();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
				String to = transFormat.format(from);
				System.out.println("DtoS : " + to);
				if (to.matches(temp))
					list.add(bean);
			}
		}
		return list;
	}// 강의 내 프로젝트 검색

	public List<MemDto> searMemList(String op, String sel) throws Exception {
		// TODO Auto-generated method stub
		List<MemDto> list = new ArrayList<MemDto>();
		String temp = "\'%" + sel.trim() + "%\'";
		String opString = op.trim();
		/*
		 * 아이디:0 이름:1 email:2
		 */
		String sql = "select * from userlist where ";
		if (opString.equals("0"))
			sql += "id like " + temp;
		else if (opString.equals("1"))
			sql += "name like " + temp;
		else if (opString.equals("2"))
			sql += "mail like " + temp;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new MemDto(rs.getString("id"), rs.getInt("lv"), rs.getString("name"),rs.getString("phone"),rs.getString("mail")));
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
	//프로젝트 내 프로젝트 검색
	public List<ProjectDto> searLecProTea(String op, String sel, String proid) throws Exception {
		// TODO Auto-generated method stub
		List<ProjectDto> lectprolist = new ArrayList<ProjectDto>();
		String sql = "select C.proid, C.subname, D.name, C.grade, C.id, C.testid from (select A.proid as proid, A.id as id, B.grade as grade, A.subname as subname, B.testid as testid from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid=\'"+proid+"\'";
		ProjectDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ProjectDto(rs.getString("proid"),rs.getString("subname"),
						rs.getString("id"),rs.getString("name"),rs.getString("testid"),
						rs.getInt("grade"));
				lectprolist.add(dto);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		List<ProjectDto> list = new ArrayList<ProjectDto>();
		/*
		 * 제목 : 0
		 * 이름 : 1
		 * 성적 : 3
		 * */
		String temp = ".*"+sel.trim()+".*";
		for(ProjectDto bean: lectprolist){
			if(op.equals("0")&&bean.getSubname().matches(temp))
				//제목
				list.add(bean);
			else if(op.equals("1")&&bean.getName().matches(temp))
				//이름			
				list.add(bean);	
			else if(op.equals("2")){
				String grade = bean.getGrade()+"";
				if(grade.matches(temp))
					list.add(bean);
			}
		}
		return list;
	}//프로젝트 내 프로젝트 검색
	
	//수강중인 강의 확인
		public List<ProlistDto> StuLectOne(String id, String sel, int op) throws Exception {
			
			String temp = "%"+sel+"%";
			
			String sql = "select classid,cname,statu,stuid,agreed,grade from (";
			sql += "select A.classid,A.cname,A.statu,A.stuid,A.agreed,B.grade from (";
			sql += "select classid,cname,statu,stuid,agreed from (";
			sql += "select A.classid,A.cname,A.statu,B.stuid,B.agreed from class A inner join agreed B on A.classid = B.lectid";
			sql += ") where stuid=? and agreed=1";
			sql += ") A left join test B on A.classid = B.classid and A.stuid = B.id";
			sql += ") where cname like ?";
			
			List<ProlistDto> list = new ArrayList<ProlistDto>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, temp);
				rs = pstmt.executeQuery();
//				System.out.println(rs);
				while(rs.next()){
					list.add(new ProlistDto(rs.getString("cname"),rs.getInt("grade"),rs.getString("classid"),rs.getString("stuid"),rs.getString("statu")));
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
			
			return list;
		}
		
		//프로젝트 검색
		public List<ProlistDto> ProListOne(String lectid, String id, String sel, int op) {
			
			String temp = "%"+sel+"%";
			
			String sql = "select proid,stuid,classid,cname,proname,procont,proday,name,id from (";
			sql += "select proid,stuid,classid,cname,proname,procont,proday,name,id from (";
			sql+="select A.proid, A.stuid, A.classid,A.proname, A.procont, A.proday, A.name, A.id,";
			sql+="B.cname from PROLIST A INNER JOIN CLASS B ON A.CLASSID = B.CLASSID";
			sql+=") where stuid=? and classid=?";
			
			if(op==0){
				sql+=") where proname like ?";
			}else if(op==1){
				sql+=") where procont like ?";
			}else if(op==2){
				sql+=") where name like ?";
			}
//			System.out.println(temp);
			List<ProlistDto> list = new ArrayList<ProlistDto>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, lectid);
				pstmt.setString(3, temp);
//				System.out.println(id);
//				System.out.println(lectid);
				rs = pstmt.executeQuery();
				while(rs.next()){
					list.add(new ProlistDto(rs.getString("proid"),rs.getString("stuid"),rs.getString("classid"),rs.getString("cname")
							,rs.getString("proname"),rs.getString("procont"),rs.getDate("proday"),rs.getString("name"),rs.getString("id")));
				}
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
			
		}

}
