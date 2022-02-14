package animal;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import paging.PagingDAO;

public class AnimalInfoDAO {
	
	private String url;
	private NodeList nList;
	
	public void init() throws ParserConfigurationException, SAXException, IOException {
		PagingDAO pDAO = new PagingDAO();
		this.url = pDAO.createUrl();
		getXML();
	}
	
	public void updateUrl(String url) throws ParserConfigurationException, SAXException, IOException {
		this.url = url;
		getXML();
		
	}
	
	public String getUrl() {
		return url;
	}


	public ArrayList<AnimalInfoVO> getAniInfo() {
		
		ArrayList<AnimalInfoVO> animalList = new ArrayList<AnimalInfoVO>();
		
		for(int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;
				
				
				String age = getTagValue("age", eElement);
				String popfile = getTagValue("popfile", eElement);
				String sexCd = getTagValue("sexCd", eElement);
				String noticeNo = getTagValue("noticeNo", eElement);
				String noticeSdt = getTagValue("noticeSdt", eElement);
				String filename = getTagValue("filename", eElement);
				String neuterYn = getTagValue("neuterYn", eElement);
				String noticeEdt = getTagValue("noticeEdt", eElement);
				String careNm = getTagValue("careNm", eElement);
				String careTel = getTagValue("careTel", eElement);
				String careAddr = getTagValue("careAddr", eElement);
				String chargeNm = getTagValue("chargeNm", eElement);
				String officetel = getTagValue("officetel", eElement);
				String specialMark = getTagValue("specialMark", eElement);
				String happenPlace = getTagValue("happenPlace", eElement);
				String kindCd = getTagValue("kindCd", eElement);
				String colorCd = getTagValue("colorCd", eElement);
				String weight = getTagValue("weight", eElement);
				String happenDt = getTagValue("happenDt", eElement);
				String orgNm = getTagValue("orgNm", eElement);
				String processState = getTagValue("processState", eElement);
			
				AnimalInfoVO aniVO = new AnimalInfoVO(age, popfile, sexCd, noticeNo, noticeSdt, filename, neuterYn, noticeEdt, careNm, careTel, careAddr, 
						chargeNm, officetel, specialMark, happenPlace, kindCd, colorCd, weight,happenDt, orgNm, processState);
				
				animalList.add(i, aniVO);
				
				//System.out.println("---------------------");
				//System.out.println("나이 : " + getTagValue("age", eElement));
				//System.out.println("프로필 : " + getTagValue("popfile", eElement));
				//System.out.println("성별 : " + getTagValue("sexCd", eElement)); //M : 수컷 F : 암컷 Q : 미상
				//System.out.println("공고종료일 : " + getTagValue("noticeEdt", eElement));
				//System.out.println("보호소이름 : " + getTagValue("careNm", eElement));
				//System.out.println("보호소전화번호 : " + getTagValue("careTel", eElement));
				//System.out.println("보호장소 : " + getTagValue("careAddr", eElement));
				//System.out.println("담당자 : " + getTagValue("chargeNm", eElement));
				//System.out.println("담당자연락처 : " + getTagValue("officetel", eElement));
				//System.out.println("특이사항 : " + getTagValue("specialMark", eElement));
				//System.out.println("발견장소 : " + getTagValue("happenPlace", eElement));
				//System.out.println("품종 : " + getTagValue("kindCd", eElement));
				//System.out.println("색상 : " + getTagValue("colorCd", eElement));
				//System.out.println("체중 : " + getTagValue("weight", eElement)); //킬로그램
				//System.out.println("공고번호 : " + getTagValue("noticeNo", eElement));
				//System.out.println("공고시작일 : " + getTagValue("noticeSdt", eElement));
				//System.out.println("썸네일 : " + getTagValue("filename", eElement));
				//System.out.println("중성화 여부 : " + getTagValue("neuterYn", eElement)); //Y : 예 N : 아니오 U : 미상
				
			}
		}
		return animalList;
	}
	
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
		//System.out.println("길이 : " + this.nList.getLength()); //검색 길이
	}
}
