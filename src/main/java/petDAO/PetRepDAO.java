package petDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import petDBConn.PetDBConn;
import petVO.PetRepVO;

public class PetRepDAO {
	
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetRepDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	
	public ArrayList<PetRepVO> getBoardRep(int board_id) throws SQLException {
		ArrayList<PetRepVO> rep = new ArrayList<PetRepVO>();
		String sql = "select * from replys"
				+ " where board_id =? order by reply_date asc";
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, board_id);
		rs = ppst.executeQuery();
		while(rs.next()) {
			int rId = rs.getInt("reply_id");
			int bId = rs.getInt("board_id");
			String memId = rs.getString("mem_id");
			String content = rs.getString("reply_content");
			Timestamp time = rs.getTimestamp("reply_date");
			
			PetRepVO tmp = new PetRepVO(rId, bId, memId, content, time);
			rep.add(tmp);
		}
		return rep;
	}
	public int getAll() throws SQLException {
		int size = 0;
		String sql = "select count(*) from replys";
		
		ppst = con.prepareStatement(sql);
		rs = ppst.executeQuery();
		if(rs.next()) {
			size = rs.getInt("count(*)");
		}
		return size;
	}
	
	public int getRepNum(int bId) throws SQLException {
		int size = 0;
		String sql = "select count(*) from replys"
				+ " where board_id=?";
		
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, bId);
		rs = ppst.executeQuery();
		if(rs.next()) {
			size = rs.getInt("count(*)");
		}
		return size;
	}
	public boolean insertReply(int board_id, String mem_id, String reply_content){
		String sql = "insert into replys values"
				+ "((SELECT NVL(MAX(reply_id)+1,1) FROM replys)"
				+ ",?,?,?,sysdate)";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setInt(1, board_id);
			ppst.setString(2, mem_id);
			ppst.setString(3, reply_content);
			ppst.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public String getUpdateRep(int rpk) throws SQLException {
		String sql = "select reply_content"
				+ " from replys"
				+ " where reply_id = ?";
		String content = "";
		
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, rpk);
		rs = ppst.executeQuery();
		if(rs.next()) {
			content = rs.getString(1);
		}
		return content;
		
	}
	
	public boolean updateReply(int rpk, String rContent){
		String sql = "update replys"
				+ " set reply_content = ?"
				+ " where reply_id = ?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, rContent);
			ppst.setInt(2, rpk);
			ppst.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean deleteRepy(int rId) {
		String sql = "delete from replys"
				+ " where reply_id = ?";
		try {
			ppst = con.prepareStatement(sql);
			ppst.setInt(1, rId);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	

}
