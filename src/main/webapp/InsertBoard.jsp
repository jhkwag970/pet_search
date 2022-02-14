<%@page import="petDAO.PetDescDAO"%>
<%@page import="Manipulator.FileNameMp"%>
<%@page import="petDAO.PetFilesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="petDAO.PetBoardsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
//String bang = "c:/upbang"; 
/*  String bang = "c:/workspace/pet_project/WebContent/boardPic";  */

String bang = "C:/workspace/re_pet_2/src/main/webapp/boardPic";
					//본인 절대경로로 맞게 수정

MultipartRequest mr1 = new MultipartRequest(request, bang, 10*1024*1024, "euc-kr", new DefaultFileRenamePolicy());

String cType = mr1.getParameter("board_type");
out.print(bang);
String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}


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

PetBoardsDAO bDAO = new PetBoardsDAO();
PetFilesDAO fDAO = new PetFilesDAO();

boolean bInsertion = bDAO.insertBoard(title, content, user, region, cType);


if(!bInsertion) { %>
	<a href = "main.jsp">게시글 입력 에러입니다.</a>
<% }

if (!cType.equals("notice")){
	String name = mr1.getParameter("name");
	String type = mr1.getParameter("type");
	String date = mr1.getParameter("date");
	String gender = mr1.getParameter("gender");
	String tel = mr1.getParameter("tel");
	String location = mr1.getParameter("location");
	
	PetDescDAO dDAO = new PetDescDAO();
	boolean dInsertion = dDAO.insertDesc(name, type, location, date, gender, tel);
	
	if(!dInsertion) { %>
	<a href = "main.jsp">desc 입력 에러입니다.</a>
	<% }
	
}



for(String tmp : fArr){
	boolean fInsertion = fDAO.insertFile(tmp);
	if(!fInsertion){ %>
		<a href = "main.jsp">파일 입력 에러입니다.</a>	
<% }
}

response.sendRedirect("BoardMain.jsp?page=1&board_type="+cType);

%>




</body>
</html>