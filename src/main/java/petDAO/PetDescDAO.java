package petDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import petDBConn.PetDBConn;
import petVO.PetDescVO;

public class PetDescDAO {
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetDescDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	
	public boolean insertDesc(String pet_name, String pet_type, String pet_location, String pet_date, String pet_gender, String pet_tel) {
		String sql = "insert into descriptions values"
				+ "((SELECT NVL(MAX(board_id)+1,1) FROM descriptions),"
				+ "(SELECT MAX(board_id) FROM boards),"
				+ "?,?,?,?,?,?)";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, pet_name);
			ppst.setString(2, pet_type);
			ppst.setString(3, pet_location);
			ppst.setString(4, pet_date);
			ppst.setString(5, pet_gender);
			ppst.setString(6, pet_tel);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public PetDescVO getAll(int bId) throws SQLException {
		String sql = "select * from descriptions"
				+ " where board_id=?";
		
		PetDescVO dVO = null;
		
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, bId);
		rs = ppst.executeQuery();
		
		if(rs.next()) {
			int dId = rs.getInt(1);
			String name = rs.getString(3);
			String type = rs.getString(4);
			String location = rs.getString(5);
			String date = rs.getString(6);
			String gender = rs.getString(7);
			String tel = rs.getString(8);
			dVO = new PetDescVO(dId, bId, name, type, location, date, gender, tel);
		}
		
		return dVO;
	}
	
	public boolean updateDesc(int bId, String pet_name, String pet_type, String pet_location, String pet_date, String pet_gender, String pet_tel ) {
		String sql = "update descriptions" + 
				" set pet_name=?, pet_type=?, pet_location=?, pet_date=?, pet_gender=?, pet_tel=?" + 
				"where board_id=?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, pet_name);
			ppst.setString(2, pet_type);
			ppst.setString(3, pet_location);
			ppst.setString(4, pet_date);
			ppst.setString(5, pet_gender);
			ppst.setString(6, pet_tel);
			ppst.setInt(7, bId);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

}
