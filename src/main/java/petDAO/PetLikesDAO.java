package petDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import petDBConn.PetDBConn;

public class PetLikesDAO {
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetLikesDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	public int insertLike(int board_id, String mem_id) {
		int work = 0;
		String sql = "insert into likes"
				+ " select ?,? from dual"
				+ " where not exists("
				+ " select mem_id from likes"
				+ " where board_id=? and mem_id = ?)";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setInt(1, board_id);//물음표의 순서
			ppst.setString(2, mem_id);
			ppst.setInt(3, board_id);//물음표의 순서
			ppst.setString(4, mem_id);
			work = ppst.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return work;
		}
		return work;
		
	}
	
	public int getLikeNum(int bId) throws SQLException {
		int numLike = 0;
		String sql = "select count(*) from likes"
				+ " where board_id=?";
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, bId);
		rs = ppst.executeQuery();
		if(rs.next()) {
			numLike = rs.getInt("count(*)");
		}
		return numLike;
	}
	
}
