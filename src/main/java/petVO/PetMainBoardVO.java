package petVO;

import java.sql.Timestamp;
import java.util.Date;

public class PetMainBoardVO {
	private int board_id;
	private String board_title, mem_id, board_region;
	private Timestamp board_write_date;
	
	public PetMainBoardVO() {}
	
	/**
	 * @param board_id
	 * @param board_title
	 * @param mem_id
	 * @param board_region
	 * @param board_write_date
	 */
	public PetMainBoardVO(int board_id, String board_title, String mem_id, String board_region, Timestamp board_write_date) {
		this.board_id = board_id;
		this.board_title = board_title;
		this.mem_id = mem_id;
		this.board_region = board_region;
		this.board_write_date = board_write_date;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_region() {
		return board_region;
	}
	public void setBoard_region(String board_region) {
		this.board_region = board_region;
	}
	public Timestamp getBoard_write_date() {
		return board_write_date;
	}
	public void setBoard_write_date(Timestamp board_write_date) {
		this.board_write_date = board_write_date;
	}
	

}
