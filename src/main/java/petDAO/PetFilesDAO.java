package petDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import petDBConn.PetDBConn;
import petVO.PetFileVO;

public class PetFilesDAO {
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetFilesDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	
	public boolean insertFile(String file) {
		String sql = "insert into files"
				+ " values((SELECT NVL(MAX(file_id)+1,1) FROM files),"
				+ "(SELECT MAX(board_id) FROM boards),"
				+ "?)";
		
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, file);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		
		return true;
	}
	
	public boolean deleteFile(int bId) {
		String sql = "delete" + 
				" from files" + 
				" where board_id = ?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setInt(1, bId);
			ppst.executeUpdate(); 	
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public int getFileNum(String file) throws SQLException {
		int num = 0;
		String sql = "select count(*)"
				+ " from files"
				+ " where file_path like ?";
		ppst = con.prepareStatement(sql);
		ppst.setString(1, '%' +file + '%');
		rs = ppst.executeQuery();
		if(rs.next()) {
			num = rs.getInt("count(*)");
		}
		return num;
	}
	
	public ArrayList<PetFileVO> getFile(int bId) throws SQLException{
		String sql = "select * from files"
				+ "	where board_id = ?";
		
		ArrayList<PetFileVO> arr = new ArrayList<PetFileVO>();
		
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, bId);
		rs = ppst.executeQuery();
		
		while(rs.next()) {
			int fId = rs.getInt("file_id");
			String files = rs.getString("file_path");
			
			PetFileVO tmp = new PetFileVO(fId, bId, files);
			arr.add(tmp);
		}
		return arr;
		
	}
}
