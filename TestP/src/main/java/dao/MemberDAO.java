package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;

public class MemberDAO {
	public static Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "test1234";
		String dbPw = "qwer1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	public MemberDTO login(String id, String pw) throws Exception {
		Connection conn = getConnection();
		String sql ="SELECT * FROM member WHERE id=? AND pw=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		MemberDTO mDTO = null;
		while(rs.next()) {
			mDTO = new MemberDTO(rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getInt("point"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		if(mDTO == null) {
			mDTO = new MemberDTO();
			mDTO.setId("no");
		}
		return mDTO;
	}
	public void SignUp(String id, String pw, String name) throws Exception {
		Connection conn = getConnection();
		String sql ="INSERT INTO member(id, pw, name) VALUES(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public void Purchase(int point, int mypoint, String id) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE member SET point=? WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int p = mypoint-point;
		pstmt.setInt(1, p);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public void getPoint(int mypoint, String id) throws Exception {
		int num = mypoint + 1;
		Connection conn = getConnection();
		String sql = "UPDATE member SET point=? WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public int getRandomPoint(int mypoint, String id) throws Exception {
		int num = (int)(Math.random()*1000+1);
		int point = mypoint + num;
		Connection conn = getConnection();
		String sql = "UPDATE member SET point=? WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, point);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		return num;
	}
	public ArrayList<MemberDTO> getMember() throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT * FROM member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MemberDTO> member = new ArrayList<MemberDTO>();
		while(rs.next()) {
			member.add(new MemberDTO(rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getInt("point")));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return member;
	}
	public void Edit(String id, String pw, String name, int point) throws Exception {
		Connection conn = getConnection();
		String sql="UPDATE member SET pw=?, name=?, point=? WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, name);
		pstmt.setInt(3, point);
		pstmt.setString(4, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public int Count() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT count(*) count FROM member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while(rs.next()) {
			count = rs.getInt("count");
		}
		return count;
	}
}
