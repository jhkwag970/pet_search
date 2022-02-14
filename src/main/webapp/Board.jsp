<%@page import="petVO.PetFileVO"%>
<%@page import="petDAO.PetFilesDAO"%>
<%@page import="petVO.PetDescVO"%>
<%@page import="petDAO.PetDescDAO"%>
<%@page import="petDAO.PetLikesDAO"%>
<%@page import="Manipulator.TimeConvert"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="petVO.PetRepVO"%>
<%@page import="petDAO.PetRepDAO"%>
<%@page import="petDAO.PetMemDAO"%>
<%@page import="petVO.PetBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="petDAO.PetBoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<title>Insert title here</title>

<script src="jquery-3.3.1.js"></script>


<style>

#rSubmit{
	width: 100%;
	height: 100%;
}

#floatingTextarea{
	height: 100px;
}

#regionBtn{
	height: 90%;
}

#rDate{
	font-size: small;
}

#rMem{
	font-zie: large;
}

form {
	display: inline;
}


</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
 <jsp:include page="header.jsp" />
<%
	String user = (String) session.getAttribute("user"); 
	
	if (user == null){
		user = "";
	}
	
	//Receive board_id parameter
	int bId = Integer.parseInt(request.getParameter("bId"));

	PetBoardsDAO bDao = new PetBoardsDAO();
	PetMemDAO mDAO = new PetMemDAO();
	PetRepDAO rDAO = new PetRepDAO();
	PetLikesDAO lDAO = new PetLikesDAO();
	PetDescDAO dDAO = new PetDescDAO();
	PetFilesDAO fDAO = new PetFilesDAO();
	
	int likeNum = lDAO.getLikeNum(bId);
	
	//Get board information based on the board_id
	PetBoardVO pet = bDao.getBoard(bId);
	ArrayList<PetRepVO> petR = rDAO.getBoardRep(bId);
	int repNum = petR.size();
	
	ArrayList<PetFileVO> fVO = fDAO.getFile(bId);
	
	PetDescVO dVO = dDAO.getAll(bId);
	
	//Get mem_id(writer) from board_id
	String mem_id = pet.getMem_id();
	
	
	
	//Get profile link based on mem_id
	String profile = mDAO.getMemProfile(mem_id);
	
	String date = pet.getBoard_write_date() + "";
	
	String cType = pet.getBoard_content_type();
	

%>
<div id = "main">
	<div id = "title">
		<div class="container mt-5 mb-5">
			<hr>
			<div class = "row mt-2">
			
				<div class = "col-lg-1" align="right">
				<button type="button" class="btn btn-warning" id = "regionBtn"><%= pet.getBoard_region() %></button>
				</div>
				
				<div class = "col-lg-8">
				<h5><b><%= pet.getBoard_title() %></b></h5>
				</div>
				
				<div class = "col-lg-3" align = "right">  
				<%= date.substring(0,16) %>
				</div>
			
			</div>
			<hr>
			<div class = "row mt-1">
			
				<div class = "col-lg-1" align="right">
					<img class="rounded-circle" src="./userPic/<%=profile%>" width="50px" height="30px">
				</div>
				
				<div class = "col-lg-8">
				<%=mem_id %>
				</div>
				
				<div class = "col-lg-3" align = "right">
				조회수 <b><%=pet.getBoard_views() %></b> 좋아요 <b><%=likeNum %></b> 댓글 <b><%=repNum %></b>
				</div>
			</div>
			<hr>
		</div>
	</div>
	
	<div id = "content">
		<div class="container mt-3 mb-4" >

		<div id="carouselExampleIndicators" class="carousel slide mb-5" data-bs-ride="carousel">
  			<div class="carousel-indicators">
  			<% 
  			
  			for(int i = 0; i < fVO.size(); i ++) {
					if(i == 0){
			%>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <%}else{ %>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i %>" aria-label="Slide <%=i+1%>"></button>
			   <%} %>
			<% } %>
  			</div>
		  	<div class="carousel-inner" height = "100px">
		  		<!--  Files for -->
			   <!--  <div class="carousel-item active">
			      <img src="./searchPic/dog0.gif" class="d-block w-100" alt="..." height = "500px">
			    </div>
			    
			    <div class="carousel-item">
			      <img src="./searchPic/dog1.gif" class="d-block w-100" alt="..." height = "500px">
			    </div>
			    
			    <div class="carousel-item">
			      <img src="./searchPic/dog3.gif" class="d-block w-100" alt="..." height = "500px">
			    </div> -->
			    
			    <% String a ="active"; 
			    for (PetFileVO fileVO : fVO) {
			    %>
				    <div class="carousel-item <%=a%>">
				      <img src="./boardPic/<%= fileVO.getFile_path() %>" class="d-block w-100" alt="..." height = "800px">
				    </div>
			    <% a = "";} %>
			    <!--  endfor -->
			    
  			</div>
  			<% if (fVO.size() > 1) {%>
		  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
		  	</button>
		  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
		    	<span class="visually-hidden">Next</span>
		  	</button>
		  	<% } %>
		</div>
		<% if(!cType.equals("notice")) {%>
		<table class="table table-striped" height="80px" align="center">
		  <tr>
		  	<td class="jb-th-1">이름</td>
		  	<td><%=dVO.getPet_name() %></td>
		  </tr>
		  
		  <tr>
		  	<td>종류</td>
		  	<td><%=dVO.getPet_type() %></td>
		  </tr>
		   <tr>
		  	<td>날짜</td>
		  	<td><%=dVO.getPet_date().substring(0, 11) %></td>
		  </tr>
		  
		   <tr>
		  	<td>성별</td>
		  	<td><%=dVO.getPet_gender() %></td>
		  </tr>
		  
		   <tr>
		  	<td>번호</td>
		  	<td><%=dVO.getPet_tel() %></td>
		  </tr>
		  <tr>
		  	<td>위치</td>
		  	<td><%=dVO.getPet_location() %></td>
		  </tr>
		</table>
		<% } %>
		<%= pet.getBoard_content() %>
		
		
		</div>
		
		
	</div>
	<div id = "tools">
		<div class="container mt-5 mb-4" align="center">
		<hr>
		<div class ="row" align="right">
			<div class ="col-lg-6" >
			
				<button type="button" class="btn btn-primary" 
				<% if (!user.equals("")) {%> onclick="lInsert(<%=bId%>)" <% } %>data-bs-toggle="modal" data-bs-target="#exampleModal">★</button>
			
			</div>
			<div class="col-lg-6">
			<!-- ///////////////////////////////////////////////// -->
			
			
			<%
				if (cType.equals("notice") && user.equals("admin")){
			%>
				<form method="post" action="EditBoardForm.jsp">
					<input type="text" style="display:none" value = "<%=mem_id%>" name="mId">
					<!--  session dVO bVO -->
					<%  session.setAttribute("bVO", pet); 
						session.setAttribute("dVO", dVO);%>
					<button class="btn btn-success">수정</button>
				</form>
				
				<form method="post" action="deleteBoard.jsp">
					<input type="text" style="display:none" value = "<%=bId%>" name="bId">
					<input type="text" style="display:none" value = "<%=mem_id%>" name="mId">
					<button class="btn btn-danger">삭제</button>
				</form>
			<% }
			%>
			
			
			<% if (!cType.equals("notice")) {
					if(user.equals(mem_id) || user.equals("admin") ) {%>
						<% if (user.equals(mem_id)) { %>
						<form method="post" action="EditBoardForm.jsp">
							<input type="text" style="display:none" value = "<%=mem_id%>" name="mId">
							<!--  session dVO bVO -->
							<%  session.setAttribute("bVO", pet); 
								session.setAttribute("dVO", dVO);%>
							<button class="btn btn-success">수정</button>
						</form>
						<%} %>
						<form method="post" action="deleteBoard.jsp">
							<input type="text" style="display:none" value = "<%=bId%>" name="bId">
							<input type="text" style="display:none" value = "<%=mem_id%>" name="mId">
							<button class="btn btn-danger">삭제</button>
						</form>
					<%} }%>
			<!-- ///////////////////////////////////////////////// -->
			
			</div>
		</div>

		</div>
	</div>
	<div id = "replies">
		<div class="container mt-1 mb-4" >
			<hr>
			<h3>Reply</h3><br> 
			<!--  Reply for -->
			<% for(int i = 0; i < petR.size(); i++) {
				
				PetRepVO reply = petR.get(i);
				String rMem = reply.getMem_id();
				String rProfile = "./userPic/"+mDAO.getMemProfile(rMem);
				String repContent = URLDecoder.decode(reply.getReply_content(), "UTF-8");
				
				Timestamp time = reply.getReply_date();
				TimeConvert tc = new TimeConvert(); 
				
				String rTime = tc.getToday();
				tc.timeConversion(time);
				rTime += " " + tc.getsHours() + ":"+tc.getsMinutes();
			
			%>	
			<div id="rep<%=i%>">
				<div class = "row mb-3" >
					<div class = "col-lg-9" id="rMem">
						<img src="<%= rProfile %>"  width="40px" height="30px" class="rounded-circle">&nbsp
						<%= rMem %>
						<span id = "rDate">
						&nbsp<%= rTime %> 
						</span>
					</div>
					<div class = "col-lg-3" align="right">
						<% if(user.equals("admin") || user.equals(rMem)){ %>
						<% if (user.equals(rMem)){ %>
							<span onclick="rUpdate(<%=i%>)">수정</span>
						<% } %>
							<span onclick="rDelete(<%=reply.getReply_id()%>, <%=i%>)">삭제</span>
						<% } %>
					</div>
				
				</div>



				<span id="repContent<%=i%>"><%= repContent%></span>




				<input id = "rId" style="display:none" value="<%=reply.getReply_id()%>">
				<hr>
<!-- 여기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->
				<!-- 수정 누르면 띄움 -->
				<div id = "eReply<%=i%>"  style="display:none">
				<div class = "row mt-3 mb-3" >
					<div class = "col-lg-9">
						<div class="form-floating">
						  <textarea  class="form-control" placeholder="Leave a comment here" id="ft<%=i %>" value= ""></textarea>
						  <label for="floatingTextarea">댓글 수정</label>
						</div>
					</div>
					<div class = "col-lg-2">
						<button type="button" class="btn btn-secondary" id ="rSubmit2" onclick="editRep(<%=i%>,<%=reply.getReply_id()%>)">등록</button>
						<span onclick="rclose(<%=i%>)">&nbsp&nbsp&nbsp닫기</span>	
					</div>
					
				</div>
				</div>
			</div>	
			<% } %>
			<!-- endfor -->
		
			<%
				String sProfile = "./userPic/"+mDAO.getMemProfile(user);
				SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String cTime = d.format(new Date());
				int num = petR.size();
			
			%> 
			 <input type="text" value="<%=num%>" id="jsReply" style="display:none">
			<div id ="mReply" style="display:none">
				<div class = "row mb-3" >
					<div class = "col-lg-9" id="rMem">
						<img src="<%= sProfile %>"  width="40px" height="30px" class="rounded-circle">&nbsp
						<%= user %>
						<span id = "rDate">
						&nbsp<%=cTime  %> 
						</span>
					</div>
					<div class = "col-lg-3" align="right">
					<!--  작업 필요 -->
							<span onclick="rUpdate(<%=user%>, <%=-1%>)">수정</span>
							<span onclick="rDelete(<%=user%>, <%=-1%>)">삭제</span>
					<!--  작업 -->
					</div>
				</div>
			</div> 
			<span id="field"></span>
			<h4 >Comment</h4>
			<% if (!user.equals("")) { %>
			<div class = "row mt-4">
				<div class = "col-lg-11">
					<div class="form-floating">
					  <textarea  class="form-control" placeholder="Leave a comment here" id="floatingTextarea" value= ""></textarea>
					  <label for="floatingTextarea">아름다운 말을 사용 합니다..</label>
					</div>
				</div>
				<div class = "col-lg-1">
					<button type="button" class="btn btn-secondary" id ="rSubmit" onclick="rInsert(<%=bId%>,'<%=user%>', <%=num%>)">등록</button>
				</div>
			</div>
			<% }else{ %>
			<br>
			로그인을 해주세요
			<% } %>
	

	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">좋아요!</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div id="modal-body" align="center">
			<br>
			<h3>로그인을 해주세요!</h3>
			<br>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
</div>
		
</div>
<jsp:include page="footer.jsp" />
<script>


function rUpdate(i){
	
	document.getElementById("eReply"+i).style.display="block";
}

function rclose(i){
	document.getElementById("eReply"+i).style.display="none";
}

function rDelete(rId, i){
	var num = i;
	if (num == -1){
		num = document.getElementById('jsReply');
	}
	var dId = 'rep'+num;
	document.getElementById(dId).remove();

 	$.ajax({ // $.ajax() $.get $.post
		url:"deleteReply.jsp",
		data: { // json
			rId : rId
		}, // kaja.jsp?irum=hong&na2=35
		dataType:"text",
		type:"get",
		success: function(result1){
		}, 
		error: function(xhr1,status){
			alert("에러상태: " + "\t" + xhr1.status);
		}
	}); 
}

function lInsert(bId){
	$.ajax({ // $.ajax() $.get $.post
		url:"LikeInsert.jsp",
		data: { // json
			bId : bId
		}, // kaja.jsp?irum=hong&na2=35
		dataType:"text",
		type:"get",
		success: function(result1){ 
			document.getElementById("modal-body").innerHTML = "";
			document.getElementById("modal-body").innerHTML = result1;
			//alert(result1);
/* 			if(result1.equals(0)){
				alert("이미 좋아요를 눌렀습니다.")
			} */
		}, 
		error: function(xhr1,status){
			alert("에러상태: " + "\t" + xhr1.status);
		}
	}); 
}

function editRep(i, rpk){
	if(document.getElementById('ft'+i).value == ''){
		alert('값 입력하세요');
		return;
	}
	var rContent = document.getElementById("ft"+i).value;
	
  	$.ajax({ // $.ajax() $.get $.post
		url:"EditReply.jsp",
		data: { // json
			Content :  encodeURIComponent(rContent),
			rpk : rpk
		}, // kaja.jsp?irum=hong&na2=35
		dataType:"text",
		type:"get",
		success: function(result1){ 
			document.getElementById("repContent"+i).innerHTML = result1;
		}, 
		error: function(xhr1,status){
			alert("에러상태: " + "\t" + xhr1.status);
		}
	});
  	
  	document.getElementById("eReply"+i).style.display="none";
  	document.getElementById("ft"+i).value = "";
	
}

function rInsert(bId,user, num){
	if(document.getElementById('floatingTextarea').value == ''){
		alert('값 입력하세요');
		return;
	}
 	var div = document.createElement('div');
	 
	var rContent = document.getElementById("floatingTextarea").value;
	
	div.innerHTML = document.getElementById('mReply').innerHTML;
	div.innerHTML += rContent +"<hr>";
 	document.getElementById('field').appendChild(div);
	
 	document.getElementById("floatingTextarea").value = '';
 	
  	$.ajax({ // $.ajax() $.get $.post
		url:"ReplyInsert.jsp",
		data: { // json
			memId: user,
			Content :  encodeURIComponent(rContent),
			bId : bId
		}, // kaja.jsp?irum=hong&na2=35
		dataType:"text",
		type:"get",
		success: function(result1){ 
			
		}, 
		error: function(xhr1,status){
			alert("에러상태: " + "\t" + xhr1.status);
		}
	}); 

}

</script>

</body>
</html>