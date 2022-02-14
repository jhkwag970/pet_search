package petVO;

import java.sql.Timestamp;

public class PetFileVO {
	private int file_id, board_id;
	private String file_path;
	/**
	 * @param file_id
	 * @param board_id
	 * @param file_path
	 */
	public PetFileVO(int file_id, int board_id, String file_path) {
		this.file_id = file_id;
		this.board_id = board_id;
		this.file_path = file_path;
	}
	public PetFileVO() {}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	
	
	
}
