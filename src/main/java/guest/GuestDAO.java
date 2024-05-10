package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	private GuestVO vo = null;
	
	public GuestDAO() {
		String url = "jdbc:mysql://localhost:3306/javaclass";
		String user = "root";
		String password = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("name"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setGuestIP(rs.getString("guestIP"));
				vos.add(vo);
			}
			System.out.println(vo.getEmail()+"dd");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rsClose();
		}
		return vos;
	}

	public int setGuestInput(GuestVO vo) {
		int res = 0;
		try {
			sql = "insert into guest values(default,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getGuestIP());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	//방명록 글의 총 분량 record 갯수를 구하는것
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) AS cnt from guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	public ArrayList<GuestVO> getMemberGuestSearch(String mid, String name, String nickName) {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest where name=? or name=? or name=? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			pstmt.setString(3, nickName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setGuestIP(rs.getString("guestIp"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
}
