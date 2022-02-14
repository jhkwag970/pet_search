package paging;

public class PagingVO {


	private String url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
			+ "?serviceKey=qLrPPCbaGOmnEb9dfFVsDGf%2F7cPVfsLowJQY8SP7lp6JW6%2Fk%2BO97uOSSLrgc%2BEKCuotecn4Tibbwd0AjBhPOXw%3D%3D";;
			//내 서비스 키 : 4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D
			//지용이 꺼 : qLrPPCbaGOmnEb9dfFVsDGf%2F7cPVfsLowJQY8SP7lp6JW6%2Fk%2BO97uOSSLrgc%2BEKCuotecn4Tibbwd0AjBhPOXw%3D%3D
	private String upr_cd; //시도코드
	private String upkind; //개 | 고양이 -> 422400
	private int pageNo; //페이지 번호
	private int numOfRows; //페이지당 보여줄 개수
	private String state; //상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
	private String resultUrl;
	private int startNo;
	private int endNo;
	
	public PagingVO() {
		this.url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
				+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
		
		this.upr_cd = "6110000"; //시도코드
		this.upkind = "417000"; // 기본값 : 개 | 고양이 -> 422400
		this.pageNo = 1; //페이지 번호
		this.numOfRows = 9; //페이지당 보여줄 개수
		this.state = "notice"; //상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
	}
	
	public PagingVO(String upr_cd, String upkind, int pageNo, int numOfRows, String state) {
		this.upr_cd = upr_cd;
		this.upkind = upkind;
		this.pageNo = pageNo;
		this.numOfRows = numOfRows;
		this.state = state;
	}
	
	
	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUpr_cd() {
		return upr_cd;
	}
	public void setUpr_cd(String upr_cd) {
		this.upr_cd = upr_cd;
	}
	public String getUpkind() {
		return upkind;
	}
	public void setUpkind(String upkind) {
		this.upkind = upkind;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getResultUrl() {
		resultUrl = url + "&upr_cd=" + this.upr_cd + "&upkind=" + 417000 + "&pageNo=" + this.pageNo + "&numOfRows=" + this.numOfRows
				+ "&state=" + this.state;
		
		return resultUrl;
	}
	
}
