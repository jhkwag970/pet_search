<%@page import="petVO.PetFileVO"%>
<%@page import="petDAO.PetFilesDAO"%>
<%@page import="petDAO.PetLikesDAO"%>
<%@page import="petDAO.PetRepDAO"%>
<%@page import="petVO.PetRepVO"%>
<%@page import="Manipulator.TimeConvert"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="petVO.PetMainBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="petDAO.PetBoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Insert title here</title>
<link rel="stylesheet" href="buttonindex.css">
<script src="jquery-3.3.1.js"></script>
<style>


	#toBoard:link {
		color: #000; 
		text-decoration: none;
	}
 	#toBoard:visited { 
 		color: #a0a0a0; 
 		text-decoration: none;
 	}
	 #toBoard:hover {
	 	color: #a0a0a0;
	 	text-decoration: none;
	 }

	#title{
		width:100%
	}
	
	
	#title_left{
	 width:80%;
	 float:left;
	}
	#title_right{
	 width:20%;
	 float:right;
	}
	figure {transition: opacity 0.2s; position: relative; margin: 0;}
	
	figure figcaption {color: #000;bottom: 70px; opacity: 0;position: absolute; text-align: center; width: 100%;transition: all .3s ease;}

    figure .gallery-img {opacity: 1;transition: all 0.3s ease 0s;overflow: hidden}

    figure:hover .gallery-img {background-color: #fff}

    figure:hover img {transform: scale(1.0, 1.0);transition: all .3s ease;opacity: 0.15;}

    figure:hover figcaption {opacity: 1;transition: all .3s ease; }
	
</style>
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <jsp:include page="header.jsp" />

<%-- <%@ include file="./inc/header.jsp" %> --%>
<%

request.setCharacterEncoding("euc-kr");
String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
}
String cType = (String) session.getAttribute("cType");

PetBoardsDAO dao = new PetBoardsDAO();

PetRepDAO rDao = new PetRepDAO();

PetLikesDAO lDao = new PetLikesDAO();

PetFilesDAO fDAO = new PetFilesDAO();



TimeConvert tc = new TimeConvert();

ArrayList<PetMainBoardVO> board = new ArrayList<PetMainBoardVO>();

int pageNum = Integer.parseInt(request.getParameter("page")); // 현재 페이지
String search = request.getParameter("search");
String sInput = request.getParameter("sInput");
String sel_area = request.getParameter("sel_area");

board = dao.searchBoards(cType, search, sInput, sel_area);

int numOfBoards = board.size(); // 총 게시글 갯수
int num = 9; // 한 페이지에 나올 게시물 갯수

int totalP = board.size() / num; // 총 페이지 갯수
if (numOfBoards % num != 0){
	totalP++;
}

int maxB = 0;
if ((num * pageNum)> numOfBoards){
	maxB = numOfBoards;
}else{
	maxB = num * pageNum;
}

%>

<script>
   function test() {
      var a = document.getElementById('sel_area');
      alert(a.value);
      
   }
</script>

<div class = "container mt-5 mb-5" id="main">
<% if (!cType.equals("notice")) {%>
 <div class = "bt1">
      <form method="POST" action="BoardSearchMain.jsp"  >
            <!-- <input type="button" name = "sel_area" value ="서울" onclick="this.form.submit()"> -->
            <button name="sel_area" value="서울" onclick = "this.form.submit()">서울</button>
            <button name="sel_area" value="경기" onclick = "this.form.submit()">경기도</button>
            <button name="sel_area" value="강원" onclick = "this.form.submit()">강원도</button>
            <button name="sel_area" value="전라도" onclick = "this.form.submit()">전라도</button>
            <button name="sel_area" value="경상도" onclick = "this.form.submit()">경상도</button>
            <button name="sel_area" value="제주도" onclick = "this.form.submit()">제주도</button>
            <button name="sel_area" value="울릉도" onclick = "this.form.submit()">울릉도</button>
            
            <input type="hidden" name="cType" value="find">
            <input type="hidden" name="search" value="board_title">
            <input type="hidden" name="sInput" value="">
            <input type="hidden" name="page" value="<%= Integer.parseInt(request.getParameter("page")) %>">
      </form>
</div>
</div>
<%} %>
<%
if (numOfBoards == 0){ %>
<div class = "container mt-5" style="position: absolute; left: 42%;">
<h3>찾으시는 내용이 없습니다..!</h3> 
</div>
<% }%>
<div class = "container mt-5 mb-5" id="main">

	<div class = "row">
	<% for (int i = (pageNum-1) * num; i < maxB; i++){ 
		
		Timestamp date = board.get(i).getBoard_write_date();
		tc.timeConversion(date);
		int length = board.get(i).getBoard_title().length();
		
		int bId = board.get(i).getBoard_id();
		int likeNum = lDao.getLikeNum(bId);
		String title = board.get(i).getBoard_title();
		ArrayList<PetFileVO> fVO = fDAO.getFile(bId);
		
	%> 
		<div class = "col-lg-4 mt-5">	
			<div class="card" style="width: 23rem;">
			  <figure>
			  	<div class="gallery_img">
			  		<a href="Board.jsp?bId=<%=board.get(i).getBoard_id()%>">	
			  		<% if (!cType.equals("notice"))  {%>
			  		<img src="./boardPic/<%= fVO.get(0).getFile_path() %>" class="card-img-top" alt="..." height = "350px">
			  		<%}else{ %>
			  		<img src="./userPic/notice.png"  class="card-img-top" alt="..." height = "350px">
			  		<%} %>
			 		</a>
			  	</div>
			  	<figcaption>

		            <h3>반려 동물 찾아요..</h3>

        		</figcaption>
			  </figure>
			  
			  <div class="card-body">
			  	<div id = "title">
			  		<div id="title_left">
			  			<h5><b><% if (length > 13){ %>
							<a href="Board.jsp?bId=<%=bId%>" id="toBoard"><%=  title.substring(0,14)%>... </a>
							<% }else{ %>
							<a href="Board.jsp?bId=<%=bId%>" id="toBoard"><%= bId %> &nbsp <%=title %></a>
							<% } %>			  			
			  			</b></h5>
			  		</div>
			  	
			  		<div id = "title_right">
			  			<%-- <a href="#" class="btn btn-dark" ><%= board.get(i).getBoard_region() %></a> --%>
			  			<a href="#" class="btn btn-secondary" style="background-color: #94716B; border: 0"><%= board.get(i).getBoard_region() %></a>
			  		</div>
			  	</div>
			    <p class="card-text">
			        <%= board.get(i).getMem_id()%><br>
			    	<% if(tc.timeCompare(date)){ %>
			    		<%= tc.getsHours() %>:<%= tc.getsMinutes() %>
			    	<%}else{%>
			    		<%= tc.getbDate() %>
			    	<%} %>
			    </p>
			    <!-- https://steemit.com/steem/@koinbot/sns -->
			    <span style = "padding-right: 80px;"> 
			    	<!-- https://www.pngegg.com/ko/png-iscgt/download -->
			    	<img src="./searchPic/heart.png" width = 45px id = "likes"> <%=likeNum %> &nbsp
			    	<!-- https://www.pngwing.com/ko/free-png-ymthg/download -->
			    	<img src="./searchPic/reply.png" width = 45px id = "replys">&nbsp <%= rDao.getRepNum(bId) %>
			    </span>
 				<span style = "padding-left:28px;">
 				<% if (user.equals("admin")) { 
 					if(rDao.getRepNum(bId)<10) {%>
 						&nbsp&nbsp
 					<%} %>
			    <a href="#" class="btn btn-danger" stye>삭제</a>
			    <% }%>
				</span>
			  </div>
			</div>	
		</div>
		
	<% } %>
	</div>

</div>


<div style="position: absolute; left: 42%;">

<% int start = pageNum-3;
   int end = pageNum+3;
	if (start <= 0){
		start = 1;
	}
	if (end > totalP){
		end = totalP;
	}

%>
<% if  (numOfBoards > 9) {%>
<% if (pageNum != 1) {%>
	<a href="BoardMain.jsp?board_type=<%=cType %>&page=<%=1%>"class="btn btn-outline-dark" border: 0"> < </a>
	<a href="BoardMain.jsp?board_type=<%=cType %>&page=<%=pageNum-1%>"class="btn btn-outline-dark" border: 0">Prev</a> 
<% } %> 
	<% for (int i = start; i <= end; i++ ){ %>
			
		<%	if(i == pageNum){ %>  
		<a href="#" class="btn btn-secondary" style="background-color: #94716B; border: 0"><%=i %></a>
		<%}else{ %>
	    <a href="BoardMain.jsp?board_type=<%=cType %>&page=<%=i%>"class="btn btn-outline-dark" border: 0"><%= i %></a>
	<%} %>	 
<%}%>
<% if (pageNum < totalP){%>
	
	<a href="BoardMain.jsp?board_type=<%=cType %>&page=<%=pageNum+1%>"class="btn btn-outline-dark" border: 0">Next</a> 
	<a href="BoardMain.jsp?board_type=<%=cType %>&page=<%=totalP%>"class="btn btn-outline-dark" border: 0"> > </a> 
<% } } %> 
</div>
<br>
<div class= "container mt-5 mb-5">
	<div class="row" >
		<div class="col-lg-4">
		<form method="POST" action="BoardSearchMain.jsp" >
         <div class="input-group mb-2">
		<% if(!cType.equals("notice")) {%>
            <select name='sel_area'>
               <option value=''>전체</option>
               <option value='서울'>서울</option>
               <option value='경기'>경기도</option>
               <option value='강원'>강원도</option>
               <option value='경상도'>경상도</option>
               <option value='전라도'>전라도</option>
               <option value='제주도'>제주도</option>
               <option value='울릉도'>울릉도</option>
            </select> 
         <% } %>  
				  <select name = "search">
							<option value = "board_title">제목</option>
							<option value = "board_content">내용</option>
							<option value = "mem_id">글쓴이</option>
					</select>&nbsp
				<input type="text" name = "sInput"class="form-control" aria-label="Text input with dropdown button" accept-charset="utf-8">
				<input type="text" name="page" value="1" style="display:none">
				<button class="btn btn-secondary">검색</button>
			</div>
		</form>	
		</div>
		
		<div class="col-lg-8" align="right" style="padding:0px 60px 0px 0px">
			<%if (!user.equals("")) {%>
			<a href="InsertBoardForm.jsp?board_type=<%=cType %>"class="btn btn-secondary" style="background-color: #94716B; border: 0">+글작성</a>
			<%} %>
		</div>
	</div>

</div>
 <jsp:include page="footer.jsp" />
<%-- <%@ include file="./inc/footer.jsp" %> --%>

</body>
</html>