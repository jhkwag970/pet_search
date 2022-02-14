package shelterLikes;

public class ShelterLikesVO {

	String noticeNo;
	String memId;
	String likeState;
	
	public ShelterLikesVO(String noticeNo, String memId, String likeState) {
		super();
		this.noticeNo = noticeNo;
		this.memId = memId;
		this.likeState = likeState;
	}
	
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getLikeState() {
		return likeState;
	}
	public void setLikeState(String likeState) {
		this.likeState = likeState;
	}
}
