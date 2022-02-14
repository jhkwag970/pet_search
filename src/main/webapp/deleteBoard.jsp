<%@page import="petDAO.PetBoardsDAO"%>
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

String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}

int bId = Integer.parseInt(request.getParameter("bId"));
String cType = (String) session.getAttribute("cType");

PetBoardsDAO pDAO = new PetBoardsDAO();

boolean del = pDAO.deleteBoard(bId);

if(del){
	response.sendRedirect("BoardMain.jsp?page=1&board_type="+cType);
}else{ 
	response.sendRedirect("mpError.jsp");
} 

%>
여기옴
</body>
</html>