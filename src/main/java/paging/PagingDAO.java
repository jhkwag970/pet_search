package paging;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class PagingDAO {
	
	private String url;
	private String totalCount;
	private int startNo;
	private NodeList pageList;
	
	public String updateUrl(String sido, String pageNo) {
		PagingVO pVO = new PagingVO();
		String sidoCd;
			switch(sido) {
			case "seoul" : 
					sidoCd = "6110000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();
				break;
			case "busan" : 
					sidoCd = "6260000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "daegu" : 
					sidoCd = "6270000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "incheon" : 
					sidoCd = "6280000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "gwangju" :
					sidoCd = "6290000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "daejeon" : 
					sidoCd = "6300000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "ulsan" : 
					sidoCd = "6310000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "sejong" : 
					sidoCd = "5690000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "gyeong-gido" : 
					sidoCd = "6410000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
			case "gang-wondo" : 
					sidoCd = "6420000";
					pVO.setUpr_cd(sidoCd);
					pVO.setPageNo(Integer.parseInt(pageNo));
					this.url = pVO.getResultUrl();	
				break;
		}
			return this.url;
	}
	public String getUrl() {
		return url;
	}
	
	public int setStartNo(String strPageNo, int totalpageNo) {
		int pageNo = Integer.parseInt(strPageNo);
		
		if(pageNo >= 4 && totalpageNo >= 7) {
			this.startNo = 1 + (pageNo - 3);
		}else {
			this.startNo = 1;
		}
		return startNo;
	}
	
	public String createUrl() {
		PagingVO pVO = new PagingVO();
		this.url = pVO.getResultUrl();
		
		return url;
	}
	
	public String getTotalCount() throws ParserConfigurationException, SAXException, IOException {
		
		getXML();
		
		for(int i = 0; i < pageList.getLength(); i++) {
			Node nNode = pageList.item(i);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	
				Element eElement = (Element) nNode;
				
				this.totalCount = getTagValue("totalCount", eElement);
			}
		}
		return this.totalCount;
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
		
		this.pageList = doc.getElementsByTagName("body");
		//System.out.println("길이 : " + this.pageList.getLength()); //검색 길이
	}
}
