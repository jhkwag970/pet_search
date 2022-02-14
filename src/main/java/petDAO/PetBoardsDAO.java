package petDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import petDBConn.PetDBConn;
import petVO.PetBoardVO;
import petVO.PetMainBoardVO;

public class PetBoardsDAO {
	private Connection con;
	PreparedStatement ppst = null;
	ResultSet rs = null;
	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public PetBoardsDAO() throws ClassNotFoundException, SQLException {
		con = new PetDBConn().getConnection();
	}
	
	public ArrayList<PetMainBoardVO> getMainBoards(String cType) throws SQLException{
		ArrayList<PetMainBoardVO> board = new ArrayList<PetMainBoardVO>();
		String sql = "select board_id, board_title, mem_id, board_write_date, board_region"
				+ " From boards"
				+ " where board_content_type=?"
				+ " ORDER BY board_id desc";
		
		ppst = con.prepareStatement(sql);
		ppst.setString(1, cType);
		rs = ppst.executeQuery();
		while(rs.next()) {
			int boardId = rs.getInt("board_id");
			String title = rs.getString("board_title");
			String memId = rs.getString("mem_id");
			String boardRegion = rs.getString("board_region");
			Timestamp writeDate = rs.getTimestamp("board_write_date");
			
			PetMainBoardVO tmp = new PetMainBoardVO(boardId, title,memId, boardRegion, writeDate);
			board.add(tmp);
		}
		
		return board;
	}
	
	public ArrayList<PetMainBoardVO> searchBoards(String cType, String search, String sInput, String sel_area) throws SQLException{
	      ArrayList<PetMainBoardVO> board = new ArrayList<PetMainBoardVO>();
	      
	      String sql;
	      if(sel_area == null || sel_area == "") {
	         sql = "select board_id, board_title, mem_id, board_write_date, board_region"
	               + " From boards"
	               + " where board_content_type=?"
	               + " and "+search+" like ?"
	               + " ORDER BY board_id desc";
	      }else {
	         sql = "select board_id, board_title, mem_id, board_write_date, board_region"
	               + " From boards"
	               + " where board_content_type=?"
	               + " and "+search+" like ?"
	               + " AND board_region = '"+sel_area+"'"
	               + " ORDER BY board_id desc";
	      }
	      ppst = con.prepareStatement(sql);
	      ppst.setString(1, cType);
	      ppst.setString(2, '%' +sInput + '%');
	      rs = ppst.executeQuery();
	      while(rs.next()) {
	         int boardId = rs.getInt("board_id");
	         String title = rs.getString("board_title");
	         String memId = rs.getString("mem_id");
	         String boardRegion = rs.getString("board_region");
	         Timestamp writeDate = rs.getTimestamp("board_write_date");
	         
	         PetMainBoardVO tmp = new PetMainBoardVO(boardId, title,memId,boardRegion, writeDate);
	         board.add(tmp);
	      }
	      
	      return board;
	   }
	   
	   
	   
	
	
	public PetBoardVO getBoard(int board_id) throws SQLException {
		PetBoardVO pet = null;
		String sql = "select * From boards"
				+ " where board_id =?";
		ppst = con.prepareStatement(sql);
		ppst.setInt(1, board_id);
		rs = ppst.executeQuery();
		if (rs.next()) {
			int bViews = rs.getInt("board_views");
			String bTitle = rs.getString("board_title");
			String bContent = rs.getString("board_content");
			String mId = rs.getString("mem_id");
			String bRegion = rs.getString("board_region");
			String bCType = rs.getString("board_content_type");
			Timestamp bWDate = rs.getTimestamp("board_write_date");
			bViews++;
			countUpdate(bViews, board_id);
			pet = new PetBoardVO(board_id, bViews, bTitle, bContent, mId, bRegion, bCType, bWDate);
		}
		return pet;
	}
	
	public boolean countUpdate (int bViews, int board_id) {
		String sql = "update boards set board_views = ? where board_id = ?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setInt(1, bViews);//물음표의 순서
			ppst.setInt(2, board_id);
			ppst.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean insertBoard(String title, String content, String mId, String region, String cType) {
		String sql = "insert into boards values"
				+ "((SELECT NVL(MAX(board_id)+1,1) FROM boards),"
				+ "?,?,?,sysdate,?,0,?)";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, title);
			ppst.setString(2, content);
			ppst.setString(3, mId);
			ppst.setString(4, region);
			ppst.setString(5, cType);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean deleteBoard(int bId) {
		String sql = "delete from boards"
				+ " where board_id = ?";
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
	
	public boolean updateBoard(int bId, String title, String content, String region) {
		String sql = "update boards" + 
				" set board_title=?, board_content=?, board_region=?" + 
				" where board_id = ?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, title);
			ppst.setString(2, content);
			ppst.setString(3, region);
			ppst.setInt(4, bId);
			ppst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public void ppstClose() throws SQLException {
		if(ppst != null) { ppst.close();}
	}
	
	public void allClose() throws SQLException {
		if (con != null) {con.close();}
		if (ppst != null) {ppst.close();}
		if (rs != null) {rs.close();}
	}
	
	

}
