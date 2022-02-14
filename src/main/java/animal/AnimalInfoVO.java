package animal;

public class AnimalInfoVO {
	
	private String age; //나이
	private String popfile; //프로필
	private String sexCd; //성별 M : 수컷 F : 암컷 Q : 미상
	private String noticeNo; //공고번호
	private String noticeSdt; //공고 시작일
	private String filename; //썸네일
	private String neuterYn; //중성화 여부 Y : 예 N : 아니오 U : 미상
	private String noticeEdt; //공고 종료
	private String careNm; //보호소 이름
	private String careTel; //보호소 전화번호
	private String careAddr; //보호장소
	private String chargeNm; //담당자
	private String officetel; // 담당자 연락처
	private String specialMark; //특이사항
	private String happenPlace; //발견장소
	private String kindCd; //품종
	private String colorCd; //색상
	private String weight; //몸무게
	private String happenDt;//접수일
	private String orgNm;//관할기관
	private String processState; //상태
	
	
	public AnimalInfoVO(String age, String popfile, String sexCd, String noticeNo, String noticeSdt, String filename,
			String neuterYn, String noticeEdt, String careNm, String careTel, String careAddr, String chargeNm,
			String officetel, String specialMark, String happenPlace, String kindCd, String colorCd, String weight,
			String happenDt, String orgNm, String processState) {

		this.age = age;
		this.popfile = popfile;
		this.sexCd = sexCd;
		this.noticeNo = noticeNo;
		this.noticeSdt = noticeSdt;
		this.filename = filename;
		this.neuterYn = neuterYn;
		this.noticeEdt = noticeEdt;
		this.careNm = careNm;
		this.careTel = careTel;
		this.careAddr = careAddr;
		this.chargeNm = chargeNm;
		this.officetel = officetel;
		this.specialMark = specialMark;
		this.happenPlace = happenPlace;
		this.kindCd = kindCd;
		this.colorCd = colorCd;
		this.weight = weight;
		this.happenDt = happenDt;
		this.orgNm = orgNm;
		this.processState = processState;
	}
	
	public String getProcessState() {
		return processState;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPopfile() {
		return popfile;
	}
	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}
	public String getSexCd() {
		return sexCd;
	}
	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeSdt() {
		return noticeSdt;
	}
	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getNeuterYn() {
		return neuterYn;
	}
	public void setNeuterYn(String neuterYn) {
		this.neuterYn = neuterYn;
	}
	public String getNoticeEdt() {
		return noticeEdt;
	}
	public void setNoticeEdt(String noticeEdt) {
		this.noticeEdt = noticeEdt;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getCareTel() {
		return careTel;
	}
	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}
	public String getCareAddr() {
		return careAddr;
	}
	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}
	public String getChargeNm() {
		return chargeNm;
	}
	public void setChargeNm(String chargeNm) {
		this.chargeNm = chargeNm;
	}
	public String getOfficetel() {
		return officetel;
	}
	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}
	public String getSpecialMark() {
		return specialMark;
	}
	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}
	public String getHappenPlace() {
		return happenPlace;
	}
	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}
	public String getKindCd() {
		return kindCd;
	}
	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}
	public String getColorCd() {
		return colorCd;
	}
	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public void setHappenDt(String happenDt) {
		this.happenDt = happenDt;
	}
	public String getHappenDt() {
		return happenDt;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getOrgNm() {
		return orgNm;
	}
}
