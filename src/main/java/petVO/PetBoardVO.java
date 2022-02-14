package petVO;

import java.sql.Timestamp;

public class PetBoardVO {
	private int board_id, board_views;
	private String board_title, board_content, mem_id, board_region, board_content_type;
	private Timestamp board_write_date;
	
	public PetBoardVO() {};
	
	/**
	 * @param board_id
	 * @param board_views
	 * @param board_title
	 * @param board_content
	 * @param mem_id
	 * @param board_region
	 * @param board_content_type
	 * @param board_write_date
	 */
	public PetBoardVO(int board_id, int board_views, String board_title, String board_content, String mem_id,
			String board_region, String board_content_type, Timestamp board_write_date) {
		this.board_id = board_id;
		this.board_views = board_views;
		this.board_title = board_title;
		this.board_content = board_content;
		this.mem_id = mem_id;
		this.board_region = board_region;
		this.board_content_type = board_content_type;
		this.board_write_date = board_write_date;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getBoard_views() {
		return board_views;
	}

	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
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

	public String getBoard_content_type() {
		return board_content_type;
	}

	public void setBoard_content_type(String board_content_type) {
		this.board_content_type = board_content_type;
	}

	public Timestamp getBoard_write_date() {
		return board_write_date;
	}

	public void setBoard_write_date(Timestamp board_write_date) {
		this.board_write_date = board_write_date;
	}
	

}
