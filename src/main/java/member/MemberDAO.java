package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.MemberDBConn;

public class MemberDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDAO() throws ClassNotFoundException, SQLException {
		con = new MemberDBConn().getConnection();
	}
	public void pstmtClose() throws SQLException {
		if(pstmt !=null) {pstmt.close();}
	}
	
	public MemberDTO login(String mem_id, String mem_pw) throws SQLException {
		MemberDTO mem = null;
		String sql =  "SELECT * FROM MEMBERS WHERE mem_id =? and mem_pw =?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_pw);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String mem_id1 = rs.getString("mem_id");
			String mem_pw1 = rs.getString("mem_pw");
			String mem_name = rs.getString(3);
			String mem_tel = rs.getString(4);
			String mem_email = rs.getString(5);
			String mem_profile = rs.getString(6);
			
			mem = new MemberDTO(mem_id1, mem_pw1, mem_name, mem_tel, mem_email, mem_profile);
		}
		return mem;
	}

	
	
	public int joinCheck(String mem_id) throws SQLException {
		int num = 0;
		String SQL="select count(*)" + 
				" from members" + 
				" where mem_id = ?";
		pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			num = rs.getInt(1);
		}
		return num;
		
	}
	
	public int join(String mem_id, String mem_pw, String mem_name,
			String mem_tel, String mem_email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL="INSERT INTO MEMBERS(mem_id, mem_pw, mem_name, mem_tel, mem_email) VALUES(?,?,?,?,?)";
		
		try {
			pstmt= con.prepareStatement(SQL);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_pw);
			pstmt.setString(3, mem_name);
			pstmt.setString(4, mem_tel);
			pstmt.setString(5, mem_email);
			
			return pstmt.executeUpdate();	// ������Ʈ�ϱ�~
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;

	}	
}
