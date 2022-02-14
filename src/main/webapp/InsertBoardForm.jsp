<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

  #title1{
		height:40px;
	}
  #content{
		height: 500px;
	}
	
  table {
    height: 300px;
  }
  .jb-th-1 {
    width: 70px;
  }

</style>

</head>
<body>
 <jsp:include page="header.jsp" />
<%
	String cType = (String) request.getParameter("board_type");

String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}
%>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<form action = "InsertBoard.jsp" method="post" enctype="multipart/form-data"> 
	<div id = "main" class= "container mt-5 mb-5">
		<div id = "top" class ="row" style="padding:10px 120px 0px 120px">
				<div class="input-group mb-3">
				<% if (!cType.equals("notice")) {%>
					<select name = "region" required>
						<option value = "서울">서울</option>
						<option value = "경기">경기</option>
						<option value = "강원">강원</option>
						<option value = "전라도">전라도</option>
						<option value = "경상도">경상도</option>
						<option value = "제주도">제주도</option>
						<option value = "울릉도">울릉도</option>
					</select>&nbsp
				<% } else{ %>
				 <a href="#"class="btn btn-outline-dark">공지&nbsp</a>
				 <input type="text" style="display:none" value="공지" name = "region">
				<% } %>	
				  <input name="title" id = "title" type="text" class="form-control" aria-label="Text input with dropdown button" required>
				</div>
		</div>
		<div id = "center" class="row" style="padding:0px 120px 0px 120px">
			<div class="form-floating">
			  <textarea name = "content" class="form-control" id="content" required></textarea>
			</div>
			<!-- <input id = "content" type="text" class="form-control" aria-label="Text input with dropdown button"> -->
		</div>
		
		<div class ="row" style="padding:10px 130px 0px 130px">
		<% if (!cType.equals("notice")) {%>
			<table class="table table-striped" height="80px" align="center">
			  <tr>
			  	<td class="jb-th-1">이름</td>
			  	<td><input name="name" type="text" class="form-control"  style="height: 33px; width:200px;" required> *반려 이름을 적어주세요</td>
			  </tr>
			  
			  <tr>
			  	<td>종류</td>
			  	<td><input name="type" type="text" class="form-control"  style="height: 33px; width:200px;" required> ex) 말티즈/러시안블루/카멜레온 etc..</td>
			  </tr>
			   <tr>
			  	<td>날짜</td>
			  	<td><input name="date" type="date" class="form-control"  style="height: 33px; width:200px;" required> *분실 날짜</td>
			  </tr>
			  
			   <tr>
			  	<td>성별</td>
			  	<td>
			  		<select name = "gender" required>
			  			<option value="남">남</option>
			  			<option value="여">여</option>
			  		</select>
			  	</td>
			  </tr>
			  
			   <tr>
			  	<td>번호</td>
			  	<td><input name="tel" type="text" class="form-control"  style="height: 33px; width:200px;" required> *항상 받으실 수 있는 번호를 적어주세요</td>
			  </tr>
			  <tr>
			  	<td>위치</td>
			  	<td><input name="location" type="text" class="form-control"  style="height: 33px; width:500px;" required> *잃어버리신 위치를 자세히 적어주세요</td>
			  </tr>
			</table>
		<% } %>
		</div>
		
		<div class="row">
			<div class="col-lg-7" >
				<div class="input-group mb-3" style="padding:10px 120px 0px 116px">
				  <input required id="fileInput" name = "f" type="file" class="form-control" id="inputGroupFile01" multiple/>
				  <input id = "files" name = "fileName" type="text" style="display:none" value="na">
				</div>
			</div>
			<div class="col-lg-5" style="padding:10px 130px 0px 0px" align="right">
				<input name="board_type" type="text" style="display:none;" value="<%=cType%>"> 
				<input type="text" style="display:none;" id="files"> 
				<!-- onClick 시 multi-file 파일명 추출 js로 이동 -->
				<!-- 이동된 js에서 파일명(s) 추출 후 결과값을  id="files" 에 초기화-->
				<button class="btn btn-success">등록</button>
			</div>
	
		</div>
				
	</div>
</form>

<script>
    window.onload = function(){
        target = document.getElementById('fileInput');
        target.addEventListener('change', function(){
            fileList = "";
            for(i = 0; i < target.files.length; i++){
                fileList += target.files[i].name + '/';
            }
            document.getElementById('files').value = fileList;
        });
    }
</script>
 <jsp:include page="footer.jsp" />
	
</body>
</html>