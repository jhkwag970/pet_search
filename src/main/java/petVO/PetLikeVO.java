package petVO;

public class PetLikeVO {
	private int board_id;
	private String mem_id;
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
	/**
	 * @param board_id
	 * @param mem_id
	 */
	public PetLikeVO(int board_id, String mem_id) {
		this.board_id = board_id;
		this.mem_id = mem_id;
	}

	public PetLikeVO() {}
	
	

}
