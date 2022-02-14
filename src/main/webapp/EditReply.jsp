<%@page import="java.net.URLDecoder"%>
<%@page import="petDAO.PetRepDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String cType = (String) session.getAttribute("cType");

String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}

int rpk = Integer.parseInt(request.getParameter("rpk"));
String con = request.getParameter("Content");

PetRepDAO rDAO = new PetRepDAO();

boolean update = rDAO.updateReply(rpk, con);
String uCont = URLDecoder.decode(rDAO.getUpdateRep(rpk), "UTF-8");
%>
<%=uCont %>