<%@page import="petDAO.PetRepDAO"%>
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
	int rId = Integer.parseInt(request.getParameter("rId"));

	PetRepDAO rDAO = new PetRepDAO();
	
	boolean rDelete = rDAO.deleteRepy(rId);
	
%>

</body>
</html>