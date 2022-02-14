<%@page import="petVO.PetMainBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="petDAO.PetBoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


</head>
<body>

<%@ include file="header.jsp" %>

<% String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
}

PetBoardsDAO bDAO = new PetBoardsDAO();

ArrayList<PetMainBoardVO> bVOf = bDAO.getMainBoards("find");
ArrayList<PetMainBoardVO> bVOp = bDAO.getMainBoards("protect");


%>

  <div class="c4">
    <div class="item item4"><img src="img/dog1.jpg">
    	<div align="center"><br>갑자기 어디론가</div>
    </div>
    <div class="item item4"><img src="img/dog2.jpg">
    	<div align="center"><br>찾아주세요..</div>
    </div>
    <div class="item item4"><img src="img/dog3.jpg">
    	<div align="center"><br>강아지가 사라졌어요</div>
    </div>
    <div class="item item4"><img src="img/dog4.jpg">
    	<div align="center"><br>서울로 가던길..</div>
    </div>
  </div>
  
  <div class="c5">
    <div class="item item5">
    <div><img src="img/bb1.png"></div>
    
    <%  for(PetMainBoardVO tmp : bVOf) {%>
    <br>  &nbsp&nbsp<a href="Board.jsp?bId=<%=tmp.getBoard_id()%>">[<%=tmp.getBoard_region() %>] <%=tmp.getBoard_title() %></a>
    <% } %>
    
    </div>
    <div class="item item5">
    <div><img src="img/bb2.png"></div>
    
    <%  for(PetMainBoardVO tmp : bVOp) {%>
    <br>  &nbsp&nbsp<a href="Board.jsp?bId=<%=tmp.getBoard_id()%>">[<%=tmp.getBoard_region() %>] <%=tmp.getBoard_title() %></a>
    <% } %>
    
  	</div>
  </div>
  
 <%@ include file="footer.jsp" %>
    
<%    
       String messageContent = null;
   if(session.getAttribute("messageContent")!=null) {
      messageContent = (String) session.getAttribute("messageContent");      
   }
   String messageType = null;
   if(session.getAttribute("messageType")!=null) {
      messageType = (String) session.getAttribute("messageType");      
   }
   if(messageContent != null) {
 %>
    
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal=dialog vertical-align-center">
            <div class="modal-content  <%if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
                  <div class="modal-header panel-heading">
                     <h4 class="modal-title">
                        <%=messageType %>
                     </h4>
                  </div>
                  <div class="modal-body">
                     <%=messageContent %>
                  </div>
            </div>
            
         </div>
      </div>
   </div>

<script>
	$('#messageModal').modal("show");
      
</script>

   <% 
      session.removeAttribute("messageContent");
      session.removeAttribute("meesageType");
   }         
   %>
   
 
</body>
</html>