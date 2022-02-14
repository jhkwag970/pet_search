package petDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import petDBConn.PetDBConn;

public class PetMemDAO {
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetMemDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	
	public String getMemProfile(String mem_id) throws SQLException {
		String profile = null;
		String sql = "select mem_profile FROM members"
				+ " where mem_id=?";
		ppst = con.prepareStatement(sql);
		ppst.setString(1, mem_id);
		rs = ppst.executeQuery();
		if(rs.next()) {
			profile = rs.getString("mem_profile");
		}
		return profile;
	}
}
