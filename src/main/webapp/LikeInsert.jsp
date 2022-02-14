<%@page import="petDAO.PetLikesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

int bId = Integer.parseInt(request.getParameter("bId"));
String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}
PetLikesDAO lDao = new PetLikesDAO();

int result = lDao.insertLike(bId, user);


%>

<%if (result == 1) {%>
	<br>
	<h3>좋아요!</h3>
	<br>
<% }else{ %>
	<br>
	<h3>이미 추천 하셨습니다..!</h3>
	<br>
	
<%} %>