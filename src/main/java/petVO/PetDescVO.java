package petVO;

public class PetDescVO {
	private int desc_id, board_id;
	private String pet_name, pet_type, pet_location,pet_date,pet_gender,pet_tel;
	/**
	 * @param desc_id
	 * @param board_id
	 * @param pet_name
	 * @param pet_type
	 * @param pet_location
	 * @param pet_date
	 * @param pet_gender
	 * @param pet_tel
	 */
	public PetDescVO(int desc_id, int board_id, String pet_name, String pet_type, String pet_location, String pet_date,
			String pet_gender, String pet_tel) {
		this.desc_id = desc_id;
		this.board_id = board_id;
		this.pet_name = pet_name;
		this.pet_type = pet_type;
		this.pet_location = pet_location;
		this.pet_date = pet_date;
		this.pet_gender = pet_gender;
		this.pet_tel = pet_tel;
	}
	public PetDescVO() {
		// TODO Auto-generated constructor stub
	}
	public int getDesc_id() {
		return desc_id;
	}
	public void setDesc_id(int desc_id) {
		this.desc_id = desc_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_location() {
		return pet_location;
	}
	public void setPet_location(String pet_location) {
		this.pet_location = pet_location;
	}
	public String getPet_date() {
		return pet_date;
	}
	public void setPet_date(String pet_date) {
		this.pet_date = pet_date;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPet_tel() {
		return pet_tel;
	}
	public void setPet_tel(String pet_tel) {
		this.pet_tel = pet_tel;
	}
	
	

}
