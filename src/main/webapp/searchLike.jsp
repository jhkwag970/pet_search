
<%@page import="shelterLikes.ShelterLikesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{border : 1px solid #000;}
</style>

<%request.setCharacterEncoding("UTF-8"); %>

<%ShelterLikesDAO slDAO = new ShelterLikesDAO(); %>

<%String noticeNo = request.getParameter("noticeNo"); %>
<%String noticeEdt = request.getParameter("noticeEdt"); %>
<%String memId = request.getParameter("memId"); %>
<%String likeState = request.getParameter("likeState"); %>
</head>
<body>
<%if(likeState.equals("yes")){ %>
<%		slDAO.insertAll(memId, noticeNo, noticeEdt); %>
<% 		slDAO.updateLikeState(memId, noticeNo, noticeEdt, likeState);%>
<%}else if(likeState.equals("no")){ %>
<%		slDAO.insertAll(memId, noticeNo, noticeEdt); %>
<%		slDAO.updateLikeState(memId, noticeNo, noticeEdt, likeState); %>
<%} %>
</body>
</html>