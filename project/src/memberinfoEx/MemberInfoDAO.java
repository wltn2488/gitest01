package memberinfoEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class MemberInfoDAO {
	// 싱글톤
		private static MemberInfoDAO instance = new MemberInfoDAO();
		private MemberInfoDAO(){}
		public static MemberInfoDAO getInstance(){
			return instance;
		}
		
		// 데이터베이스 insert 로직
		public void insert(MemberInfoDTO data){
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = null;
			PreparedStatement ppst = null;
			try {
				// JDBC Driver 로딩
				Class.forName(driver);
				// Connection 객체 생성 / DB 연결(접속)
				conn = DriverManager.getConnection(url, "hr", "hr");
				// 수행할 쿼리 정의 / no 컬럼의 데이터는 시퀀스로 입력하고, reg_date는 오라클의 sysdate로 입력
				ppst = conn.prepareStatement("insert into memberinfo values(seq_memberinfo.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
				// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
				ppst.setString(1, data.getName());
				ppst.setString(2, data.getId());
				ppst.setString(3, data.getPw());
				ppst.setString(4, data.getPhone());
				ppst.setString(5, data.getEmail());
				ppst.setString(6, data.getAddr());
				// 쿼리 수행
				ppst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
		}
		//데이터베이스 select 로직 / List import 필요!
		public List<MemberInfoDTO> getList(){
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = null;
			PreparedStatement ppst = null;
			ResultSet rs = null; // ResultSet import!
			List<MemberInfoDTO> list = null;
			try {
				// JDBC Driver 로딩
				Class.forName(driver);
				// Connection 객체 생성 / DB 연결(접속)
				conn = DriverManager.getConnection(url, "hr", "hr");
				// 수행할 쿼리 정의 / 특정 데이터만 검색하고자 한다면 where 조건절과 매개변수 추가 필요
				ppst = conn.prepareStatement("select * from memberinfo");
				// 쿼리 수행
				rs = ppst.executeQuery();
				// 수행된 결과를 List<MemberInfoDTO)에 저장
				if(rs.next()){
					list = new ArrayList<>(); // List 객체 생성
					do {
						// 반복문이 수행될 때 마다 MemberInfoDTO 생성(참조값이 다름)
						MemberInfoDTO data = new MemberInfoDTO();
						// 생성된 객체(data)에 수행된 쿼리의 값(해당 컬럼)을 순서대로 저장
						data.setNo(rs.getInt("no"));
						data.setName(rs.getString("name"));
						data.setId(rs.getString("id"));
						data.setPw(rs.getString("pw"));
						data.setPhone(rs.getString("phone"));
						data.setEmail(rs.getString("email"));
						data.setAddr(rs.getString("addr"));
						data.setReg_date(rs.getTimestamp("reg_date"));
						// list에 0번 index부터 순서대로 data 객체의 참조값을 저장
						list.add(data);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
			return list; // list 리턴
		}
		// update 시 특정 조건을 보여주기 위한 로직
		public MemberInfoDTO getMember(int no) {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = null;
			PreparedStatement ppst = null;
			ResultSet rs = null;
			MemberInfoDTO mem = null;
			try {
				// JDBC Driver 로딩
				Class.forName(driver);
				// Connection 객체 생성 / DB 연결(접속)
				conn = DriverManager.getConnection(url, "hr", "hr");
				// 수행할 쿼리 정의
				ppst = conn.prepareStatement("select * from memberinfo where no = ?");
				ppst.setInt(1, no); // 매개변수로 받은 no값을 물음표에 매핑
				// 쿼리 수행
				rs = ppst.executeQuery();
				// no에 해당하는 데이터베이스의 데이터를 mem에 할당
				if (rs.next()) {
					mem = new MemberInfoDTO();
					mem.setNo(rs.getInt("no"));
					mem.setName(rs.getString("name"));
					mem.setId(rs.getString("id"));
					mem.setPw(rs.getString("pw"));
					mem.setPhone(rs.getString("phone"));
					mem.setEmail(rs.getString("email"));
					mem.setAddr(rs.getString("addr"));
					mem.setReg_date(rs.getTimestamp("reg_date"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (ppst != null)
						ppst.close();
					if (conn != null)
						conn.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
			return mem; // mem 리턴
		}
		// 데이터베이스 update 로직
		public void update(MemberInfoDTO data) {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = null;
			PreparedStatement ppst = null;
			try {
				// JDBC Driver 로딩
				Class.forName(driver);
				// Connection 객체 생성 / DB 연결(접속)
				conn = DriverManager.getConnection(url, "hr", "hr");
				// 수행할 쿼리 정의 / no에 해당하는 데이터를 수정
				ppst = conn.prepareStatement("update memberinfo set name = ?, id = ?, pw = ?, phone = ?, email = ?, addr = ? where no = ?");
				// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
				ppst.setString(1, data.getName());
				ppst.setString(2, data.getId());
				ppst.setString(3, data.getPw());
				ppst.setString(4, data.getPhone());
				ppst.setString(5, data.getEmail());
				ppst.setString(6, data.getAddr());
				ppst.setInt(7, data.getNo());
				// 쿼리 수행
				ppst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (ppst != null)
						ppst.close();
					if (conn != null)
						conn.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
		}
		// 데이터베이스 delete 로직
		public void delete(int no){
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = null;
			PreparedStatement ppst = null;
			try {
				// JDBC Driver 로딩
				Class.forName(driver);
				// Connection 객체 생성 / DB 연결(접속)
				conn = DriverManager.getConnection(url, "hr", "hr");
				// 수행할 쿼리 정의 / no에 해당하는 데이터를 삭제
				ppst = conn.prepareStatement("delete from memberinfo where no = ?");
				// 매개변수로 전달된 no를 쿼리문의 물음표에 값 매핑
				ppst.setInt(1, no);
				// 쿼리 수행
				ppst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (ppst != null)
						ppst.close();
					if (conn != null)
						conn.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
		}
	}



	
	
