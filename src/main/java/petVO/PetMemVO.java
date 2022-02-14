package petVO;

import java.util.Date;

public class PetMemVO {
	private String mem_name, mem_id, mem_pw, mem_tel, mem_email, mem_profile;
	private int donation;
	private Date mem_donation_date;
	
	/**
	 * default constructor
	 */
	public PetMemVO() {}
	/**
	 * @param mem_name
	 * @param mem_id
	 * @param mem_pw
	 * @param mem_tel
	 * @param mem_email
	 * @param mem_profile
	 * @param donation
	 * @param mem_donation_date
	 */
	public PetMemVO(String mem_name, String mem_id, String mem_pw, String mem_tel, String mem_email,
			String mem_profile, int donation, Date mem_donation_date) {
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_tel = mem_tel;
		this.mem_email = mem_email;
		this.mem_profile = mem_profile;
		this.donation = donation;
		this.mem_donation_date = mem_donation_date;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	public int getDonation() {
		return donation;
	}
	public void setDonation(int donation) {
		this.donation = donation;
	}
	public Date getMem_donation_date() {
		return mem_donation_date;
	}
	public void setMem_donation_date(Date mem_donation_date) {
		this.mem_donation_date = mem_donation_date;
	}
	
	
}
