<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">



          <link rel="stylesheet" href="css/custom.css">
<!--    <link rel="stylesheet" href="css/custom.css"> -->
   <title>회원가입</title>

       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
      
       


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<%-- <%@ include file="/./inc/header.jsp" %> --%>

	<div class="loginform" align="center" style="margin-top:100px; height: 500px;" >
	<div class="row" style="width:400px; height:210px; border:1px solid black;">
	
		<!-- FormLogin -->
		<form action="./login" method="post" id="FormLogin" name="FormLogin" autocomplete="off">
		<h2>로그인</h2>
		<hr>
		<!-- 아이디 -->
		<div class="form-group" style="margin-top:20px;">
			<label>아이디</label>
			<input type="text" id="mem_id" name="mem_id" style="margin-left:12px;" placeholder="ID">
		</div>
		
		<!-- 비밀번호 -->
		 <div class="form-group" style="margin-top:7px;">
                <label>비밀번호</label>
                <input type="password" id="mem_pw" name="mem_pw" placeholder="Password">
            </div>
            
        <!-- 아이디 기억하기 -->    
            <div class="form-check" style="margin-top:7px;">
                <input type="checkbox" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1" style="font-size:13px;">아이디 기억하기</label>
            </div>
            
        <!-- 로그인 버튼 -->    
            <input type="submit" style="margin-top:13px;" value="로그인">
		</form>
	</div>
</div>


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
   
   
   <div class="modal fade" id="checkModal" tabindex ="-1" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <div id="checkType"class= "modal-content panel-info">
               <!-- 실시간 결과에 따라서 값에 따라 디자인 출력 -->
               <div class="modal-header panel-heading">
                  <h4 class="modal-title">
                     확인 메시지
                  </h4>
               </div>
               <div class="modal-body" id="checkMessage">
               </div>
            </div>            
         </div>
      </div>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
     
</body>
</html>