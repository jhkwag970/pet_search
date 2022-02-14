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

//시,도 코드번호
public class Sido {
	String url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido"
			+ "?serviceKey=4BupojsA0fztZ56QInVBs1khDa%2B02ldmArGx3TNQlnYgz0jKcNFzPTV3mrr4NdeQVXgzwhazHepYoaETAkE6sw%3D%3D";
	
	NodeList nList; 
	
	public Sido() throws ParserConfigurationException, SAXException, IOException{
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(url);
		
		//doc.getDocumentElement().normalize();
		//System.out.println("최상위 태그 : " + doc.getDocumentElement().getNodeName()); //최상위 태그 : response
		
		this.nList = doc.getElementsByTagName("item");
		//System.out.println("길이 : " + this.nList.getLength()); //검색 길이
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	//정보확인할때 필요함(삭제X)
//	public void getInfo() {
//		for(int i = 0; i < nList.getLength(); i++) {
//			Node nNode = nList.item(i);
//			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
//
//				Element eElement = (Element) nNode;
//				
//				System.out.println("---------------------");
//				System.out.println("시도명 : " + getTagValue("orgdownNm", eElement));
//				System.out.println("시도코드 : " + getTagValue("orgCd", eElement));
//			}
//		}
//	}
//	
//    // tag값의 정보를 가져오는 메소드
//	private static String getTagValue(String tag, Element eElement) {
//	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
//	    Node nValue = (Node) nlList.item(0);
//	    if(nValue == null) 
//	        return null;
//	    return nValue.getNodeValue();
//	}
}
