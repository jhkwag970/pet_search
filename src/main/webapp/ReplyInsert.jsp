<%@page import="petDAO.PetRepDAO"%>
<%@ page language="java" contentType="text/plain; charset=utf-8" 
     pageEncoding="utf-8"%>
<%   

String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}

String memId= request.getParameter("memId");
String rContent = request.getParameter("Content");
int bId = Integer.parseInt(request.getParameter("bId"));
PetRepDAO rDAO = new PetRepDAO(); 
int rpk = rDAO.getAll();
rpk++;
boolean suc = rDAO.insertReply(bId, memId, rContent);
 %>
 
 <%= memId%><br>
 <%= rContent%><br>
 <%= bId%><br>
 <%= rpk%><br>
 