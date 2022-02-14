<%@page import="Manipulator.FileNameMp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="petDAO.PetDescDAO"%>
<%@page import="petDAO.PetFilesDAO"%>
<%@page import="petDAO.PetBoardsDAO"%>
<%@page import="petVO.PetDescVO"%>
<%@page import="petVO.PetBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String cType = (String) session.getAttribute("cType");

String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}
String bang = "C:/workspace/re_pet_2/src/main/webapp/boardPic";
//String bang = "c:/upbang";
MultipartRequest mr1 = new MultipartRequest(request, bang, 10*1024*1024, "euc-kr", new DefaultFileRenamePolicy());

String region = mr1.getParameter("region");
String title = mr1.getParameter("title");
String content = mr1.getParameter("content");

String fileName = mr1.getParameter("fileName");

StringTokenizer str = new StringTokenizer(fileName, "/" );
ArrayList<String> arr = new ArrayList<String>();
ArrayList<String> fArr = new ArrayList<String>();

while(str.hasMoreTokens()){
	arr.add(str.nextToken());
} 

FileNameMp fnp = new FileNameMp();
fArr = fnp.nameMp(arr);

PetBoardVO bVO = (PetBoardVO) session.getAttribute("bVO");


PetBoardsDAO bDAO = new PetBoardsDAO();
PetFilesDAO fDAO = new PetFilesDAO();

boolean bUpdate = bDAO.updateBoard(bVO.getBoard_id(), title, content, region);

boolean fUpdate1 = fDAO.deleteFile(bVO.getBoard_id());

if(!bUpdate) { %>
<a href = "main.jsp">게시글 수정 에러입니다.</a>
<% }

if (!cType.equals("notice")){
	String name = mr1.getParameter("name");
	String type = mr1.getParameter("type");
	String date = mr1.getParameter("date");
	String gender = mr1.getParameter("gender");
	String tel = mr1.getParameter("tel");
	String location = mr1.getParameter("location");
	
	PetDescDAO dDAO = new PetDescDAO();
	boolean dUpdate = dDAO.updateDesc(bVO.getBoard_id(), name, type, location, date, gender, tel);
	
	if(!dUpdate) { %>
	<a href = "main.jsp">desc 수정 에러입니다.</a>
	<% }
	
}




for(String tmp : fArr){
boolean fUpdate2 = fDAO.insertFile(tmp);
if(!fUpdate2){ %>
	<a href = "main.jsp">파일 수정 에러입니다.</a>	
<% }
}

session.removeAttribute("bVO");
session.removeAttribute("dVO");
response.sendRedirect("BoardMain.jsp?page=1&board_type="+cType);

%>

</body>
</html>