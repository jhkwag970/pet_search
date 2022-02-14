package petVO;

import java.sql.Timestamp;

public class PetRepVO {
	
	int reply_id, board_id;
	String mem_id, reply_content;
	Timestamp reply_date;
	/**
	 * @param reply_id
	 * @param board_id
	 * @param mem_id
	 * @param reply_content
	 * @param reply_date
	 */
	public PetRepVO(int reply_id, int board_id, String mem_id, String reply_content, Timestamp reply_date) {
		this.reply_id = reply_id;
		this.board_id = board_id;
		this.mem_id = mem_id;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}
	
	public PetRepVO() {}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Timestamp getReply_date() {
		return reply_date;
	}

	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}

}
