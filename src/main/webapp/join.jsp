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
      
       <script type="text/javascript">
   function joinCheckFunction() {
      mem_id = document.getElementById('mem_id').value;
      $.ajax({
         type:'POST',
         url:'./MemberJoinCheckServlet',
         data : {mem_id:mem_id},
         success: function(result) {
            if(result == 0) {
               $('#checkMessage').html('사용할 수 있는 아이디입니다.');
               $('#checkType').attr('class','modal-content panel-success');
            }
            else {
               $('#checkMessage').html('사용할 수 없는 아이디입니다.');
               $('#checkType').attr('class','modal-content panel-warning');
            }
            $('#checkModal').modal("show");
         }//파라미터 변수명   // 값
      })
   }
   </script>


</head>
<body>
	<%
		String mem_id = null;
		if(session.getAttribute("mem_id") != null) {
			mem_id = (String) session.getAttribute("mem_id");
		}
		if (mem_id != null) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인 상태입니다.");
			return;
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
<%-- <%@ include file="/./inc/header.jsp" %> --%>

	<div class="wrapper" align="center" style="margin-top:100px; height: 500px;">

	<form action="./join" method="post">
		<div class="wrap" style="width:430px;height:380px; border: 1px solid black; padding:0px;">
			
			<div class="subjecet">
				<h2>회원가입</h2>
			</div>
			<hr>
			<!-- 아이디 -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;margin-top:20px;">
				<div class="id_name" style="margin-left:85px;margin-right:12px;">아이디</div>
				<div class="id_input_box" style="margin-left:2px;">
					<input class="id_input" id="mem_id" name="mem_id" >
					<button class="btn btn-primary" onclick="joinCheckFunction();" type="button">중복체크</button>
				</div>
			</div>
			
			<!-- 비밀번호 -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;">
				<div class="pw_name" style="margin-right:12px;">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" name="mem_pw1" >
				</div>
			</div>
			
			<!-- 비밀번호 확인 -->
			<div style="margin-left:-30px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="pwck_name" style="margin-right:9px;">비밀번호 확인</div>
				<div class="pwck_nput_box">
					<input class="pwck_input" type="password" name="mem_pw2">
				</div>
			</div>
			
			<!-- 이름 -->
			<div style="margin-right:-22px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="user_name" style="margin-right:20px;">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="mem_name">
				</div>
			</div>
			
			<!-- 전화번호 -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;">
				<div class="tel_name" style="margin-right:12px;">전화번호</div>
				<div class="tel_input_box">
					<input class="tel_input" name="mem_tel">
				</div>
			</div>
			
			<!-- 이메일 -->
			<div style="margin-right:-14px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="mail_name" style="margin-right:12px;">이메일</div>
				<div class="mail_input_box">
					<input class="mail_input" type="email" name="mem_email" >
				</div>
			</div>
				
			<!-- 가입하기 -->			
			<div>
				<input type="submit" style="margin-top:10px;" class="join_button" value="가입하기">
			</div>
		
		</div>
	</form>
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