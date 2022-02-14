<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="index.css" rel="stylesheet" type="text/css">
</head>
<body>
 
<%	 
     String sid1=(String)session.getAttribute("user");
%>
 
  
 <% 
 	if (sid1 != null){
 %>
 
 <div class="c1">
	<div class="item item1" style="font-size:13px;"><%=sid1%>님 환영합니다.</div>	
    <div class="item item1"><a href="logout.jsp">로그아웃</a></div>
</div> 
 

<%
 	} else {
%>

<div class="c1">
    <div class="item item1"><a href="login.jsp">로그인</a></div>
    <div class="item item1"><a href="join.jsp">회원가입</a></div>
</div> 



<% 
 	}
%>
 
<hr>
<div class="c2"><img src="img/a1.jpg"></div>
<div class="c3">
	<div class="item item3"><a href="<%=request.getContextPath() %>/?subpage=home">HOME</a>  </div>
	<div class="item item3"><a href="BoardMain.jsp?board_type=notice&page=1"">공지 사항</a>  </div>
    <div class="item item3"><a href="BoardMain.jsp?board_type=find&page=1">찾아요!</a>  </div>
    <div class="item item3"><a href="BoardMain.jsp?board_type=protect&page=1"">보호중!</a>  </div>
    <div class="item item3"><a href="list.jsp?currentPageNo=1&sido=seoul">입양 | 임시보호</a>  </div>
    <!-- <div class="item item3_1"><a href="<%=request.getContextPath() %>/?subpage=shelter/list">입양 | 임시보호</a>  </div> -->
</div>

 
</body>
</html>