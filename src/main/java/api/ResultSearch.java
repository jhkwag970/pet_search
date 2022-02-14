package api;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

//openAPI XML 파일에서 필요한 데이터 추출
public class ResultSearch {

	private String url;
	
	private String upr_cd; //시도코드
	private String upkind; //개 | 고양이 -> 422400
	private int pageNo; //페이지 번호
	private int numOfRows; //페이지당 보여줄 개수
	private String state; //상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
	
	private NodeList nList; 
	
	public ResultSearch() throws ParserConfigurationException, SAXException, IOException{
		
		this.url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
				+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
		
		this.upr_cd = "6110000"; //시도코드
		this.upkind = "417000"; // 기본값 : 개 | 고양이 -> 422400
		this.pageNo = 1; //페이지 번호
		this.numOfRows = 9; //페이지당 보여줄 개수
		this.state = "notice"; //상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
		
		this.url += "&upr_cd=" + this.upr_cd + "&upkind=" + 417000 + "&pageNo=" + this.pageNo + "&numOfRows=" + numOfRows
				+ "&state=" + state;
		getXML();
	}
	
	public ResultSearch(String upr_cd) throws ParserConfigurationException, SAXException, IOException {
		this.url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
				+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
		
		this.upr_cd = upr_cd; //시도코드
		this.upkind = "417000"; //개 | 고양이 -> 422400
		this.pageNo = 1; //페이지 번호
		this.numOfRows = 9; //페이지당 보여줄 개수
		this.state = "notice"; //상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
		
		this.url += "&upr_cd=" + this.upr_cd + "&upkind=" + 417000 + "&pageNo=" + this.pageNo + "&numOfRows=" + numOfRows;
		getXML();
	}
	
	public void setSidoState(String upr_cd, String state) throws ParserConfigurationException, SAXException, IOException {
		this.upr_cd = upr_cd;
		this.state = state;
		
		this.url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
				+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
		this.url +="&upr_cd=" + this.upr_cd + "&upkind=" + 417000 + "&pageNo=" + this.pageNo + "&numOfRows=" + this.numOfRows
				+ "&state=" + this.state;
		getXML();
	}
	
	public String getUrl() {
		return url;
	}
	
	public String getUpr_cd() {
		return upr_cd;
	}

	//시,도 변경시
	public void setUpr_cd(String upr_cd) throws ParserConfigurationException, SAXException, IOException {
		this.upr_cd = upr_cd;
		this.url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"
				+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
		this.url +="&upr_cd=" + this.upr_cd + "&upkind=" + 417000 + "&pageNo=" + this.pageNo + "&numOfRows=" + this.numOfRows
				+ "&state=" + this.state;
		getXML();
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

//	public ArrayList<AnimalInfoVO> animalInfoDAO() {
//		
//		ArrayList<AnimalInfoVO> animalList = new ArrayList<AnimalInfoVO>();
//		
//		for(int i = 0; i < nList.getLength(); i++) {
//			Node nNode = nList.item(i);
//			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
//
//				Element eElement = (Element) nNode;
//				
//				
//				String age = getTagValue("age", eElement);
//				String popfile = getTagValue("popfile", eElement);
//				String sexCd = getTagValue("sexCd", eElement);
//				String noticeNo = getTagValue("noticeNo", eElement);
//				String noticeSdt = getTagValue("noticeSdt", eElement);
//				String filename = getTagValue("filename", eElement);
//				String neuterYn = getTagValue("neuterYn", eElement);
//				String noticeEdt = getTagValue("noticeEdt", eElement);
//				String careNm = getTagValue("careNm", eElement);
//				String careTel = getTagValue("careTel", eElement);
//				String careAddr = getTagValue("careAddr", eElement);
//				String chargeNm = getTagValue("chargeNm", eElement);
//				String officetel = getTagValue("officetel", eElement);
//				String specialMark = getTagValue("specialMark", eElement);
//				String happenPlace = getTagValue("happenPlace", eElement);
//				String kindCd = getTagValue("kindCd", eElement);
//				String colorCd = getTagValue("colorCd", eElement);
//				String weight = getTagValue("weight", eElement);
//				String happenDt = getTagValue("happenDt", eElement);
//			
////				AnimalInfoVO aniVO = new AnimalInfoVO(age, popfile, sexCd, noticeNo, noticeSdt, filename, neuterYn, noticeEdt, careNm, careTel, careAddr, 
////						chargeNm, officetel, specialMark, happenPlace, kindCd, colorCd, weight,happenDt);
//				
//				animalList.add(i, aniVO);
//				
//				//System.out.println("---------------------");
//				//System.out.println("나이 : " + getTagValue("age", eElement));
//				//System.out.println("프로필 : " + getTagValue("popfile", eElement));
//				//System.out.println("성별 : " + getTagValue("sexCd", eElement)); //M : 수컷 F : 암컷 Q : 미상
//				//System.out.println("공고종료일 : " + getTagValue("noticeEdt", eElement));
//				//System.out.println("보호소이름 : " + getTagValue("careNm", eElement));
//				//System.out.println("보호소전화번호 : " + getTagValue("careTel", eElement));
//				//System.out.println("보호장소 : " + getTagValue("careAddr", eElement));
//				//System.out.println("담당자 : " + getTagValue("chargeNm", eElement));
//				//System.out.println("담당자연락처 : " + getTagValue("officetel", eElement));
//				//System.out.println("특이사항 : " + getTagValue("specialMark", eElement));
//				//System.out.println("발견장소 : " + getTagValue("happenPlace", eElement));
//				//System.out.println("품종 : " + getTagValue("kindCd", eElement));
//				//System.out.println("색상 : " + getTagValue("colorCd", eElement));
//				//System.out.println("체중 : " + getTagValue("weight", eElement)); //킬로그램
//				//System.out.println("공고번호 : " + getTagValue("noticeNo", eElement));
//				//System.out.println("공고시작일 : " + getTagValue("noticeSdt", eElement));
//				//System.out.println("썸네일 : " + getTagValue("filename", eElement));
//				//System.out.println("중성화 여부 : " + getTagValue("neuterYn", eElement)); //Y : 예 N : 아니오 U : 미상
//				
//			}
//		}
//		return animalList;
//	}
	
    // tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		if(eElement.getElementsByTagName(tag).item(0) == null) {
			return null;
		}
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	//XML파일 호출 메소드
	private void getXML() throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(this.url);
		
		//doc.getDocumentElement().normalize();
		//System.out.println("최상위 태그 : " + doc.getDocumentElement().getNodeName()); 최상위 태그 : response
		
		this.nList = doc.getElementsByTagName("item");
		//System.out.println("길이 : " + this.nList.getLength()); 검색 길이
	}
}
