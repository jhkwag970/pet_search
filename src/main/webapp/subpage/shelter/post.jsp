<%@page import="paging.PagingDAO"%>
<%@page import="animal.AnimalInfoDAO"%>
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

<style>

img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 450px;
}

</style>

<%AnimalInfoDAO aniDAO = new AnimalInfoDAO(); %>
<%PagingDAO paDAO = new PagingDAO(); %>

<%String kindCd; %>
<%String sexCd = "알수없음"; %>
<%String neuterYn = "미상"; %>

<%String url; %>
<%int index; %>

<%String sido = request.getParameter("sido"); %>
<%String currentPageNo = request.getParameter("currentPageNo"); %>
<%String strIndex = request.getParameter("index"); %>
<%index = Integer.parseInt(strIndex); %>

<% url = paDAO.updateUrl(sido, currentPageNo);%>
<% aniDAO.updateUrl(url); %>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<div id = "main">
   <div id = "title">
      <div class="container mt-5 mb-5">
         <hr>
         <div class = "row mt-3">
         
            <div class = "col-lg-1">
            공고번호
            </div>
            
            <div class = "col-lg-8">
            [<%=aniDAO.getAniInfo().get(index).getNoticeNo() %>]
            </div>
            
<!--             <div class = "col-lg-3">
            날짜
            </div> -->
         </div>
         <hr>
         <!--  <div class = "row mt-3">
         
            <div class = "col-lg-1">
            유저 아이콘
            </div>
            
            <div class = "col-lg-8">
            유저이름
            </div>
            
            <div class = "col-lg-3">
            조회수 좋아요 댓글
            </div>
         </div>
         <hr> -->
      </div>
   </div>
   
   <div id = "content">
      <div class="container mt-3 mb-4" >

      <div id="carouselExampleIndicators" class="carousel slide mb-5" data-bs-ride="carousel">
           <div class="carousel-indicators">
<!--              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
           </div>
           <div class="carousel-inner" height = "100px">
               	<img src="<%=aniDAO.getAniInfo().get(index).getPopfile()%>" style="margin-left: auto; margin-right: auto;">
             <!--  endfor --> 
           </div>
      </div>
      
	      <table class="table table-hover">
	         <thead class="table-light">
	          <tr>
	            <th scope="col" width="20%">목록</th>
	            <th scope="col" width="50%">정보</th>
				<th scope="col" width="30%"></th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>공고 시작일</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getNoticeSdt() %></td>
	          </tr>
	          <tr>
	            <td>공고 종료일</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getNoticeEdt() %></td>
	          </tr>
	          <tr>
	            <td >상태</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getProcessState() %></td>
	          </tr>
	          <tr>
	            <td >견종</td>
	            <%kindCd = aniDAO.getAniInfo().get(index).getKindCd().replace("[개] ", ""); %>
	            <td colspan="2"><%=kindCd %></td>
	          </tr>
	          <tr>
	            <td >성별</td>
            	<%switch(aniDAO.getAniInfo().get(index).getSexCd()) {
					case "M" :
						sexCd = "남자";
						break;
					case "F" :
						sexCd = "여자";
						break;
					case "Q" :
						sexCd = "미상";
						break;
				}%>
	            <td colspan="2"><%=sexCd %></td>
	          </tr>
	          <tr>
	            <td >중성화 여부</td>
	            <%switch(aniDAO.getAniInfo().get(index).getNeuterYn()) {
					case "Y" :
						neuterYn = "예";
						break;
					case "N" :
						neuterYn = "아니오";
						break;
					case "U" :
						neuterYn = "미상";
						break;
				}%>
	            <td colspan="2"><%=neuterYn %></td>
	          </tr>
	          <tr>
	            <td >특징</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getSpecialMark().replace("." , "<br>") %></td>
	          </tr>
	          <tr>
	            <td >보호장소</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareAddr() %></td>
	          </tr>
	          <tr>
	            <td >보호소 이름 </td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareNm()%></td>
	          </tr>
	          <tr>
	            <td >보호소 전화번호</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareTel()%></td>
	          </tr>
	          <tr>
	            <td >담당자</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareNm()%></td>
	          </tr>
	          <tr>
	            <td >담당자 연락처</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareTel()%></td>
	          </tr>
	        </tbody>
	      </table>

      </div>
   </div>
   <div id = "tools">
      <div class="container mt-5 mb-4" align="center">
      <hr>
      <button type="button" class="btn btn-primary">★좋아요</button>
      </div>
   </div>
<!--    <div id = "replies">
      <div class="container mt-1 mb-5" >
         <hr>
         <h3>Reply</h3><br>
          Reply for
         <div class = "row mb-1">
            <div class = "col-lg-1">
            유저 아이콘
            </div>
            <div class = "col-lg-1">
            유저 이름
            </div>
            <div class = "col-lg-9">
            댓글 날짜
            </div>
            <div class = "col-lg-1">
            수정 x 대댓
            </div>
         </div>
         댓글 내용
         <hr>
         
         <div class = "row mb-1">
            <div class = "col-lg-1">
            유저 아이콘
            </div>
            <div class = "col-lg-1">
            유저 이름
            </div>
            <div class = "col-lg-9">
            댓글 날짜
            </div>
            <div class = "col-lg-1">
            수정 x 대댓
            </div>
         </div>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         
         <hr>
         
         <div class = "row mb-1">
            <div class = "col-lg-1">
            유저 아이콘
            </div>
            <div class = "col-lg-1">
            유저 이름
            </div>
            <div class = "col-lg-9">
            댓글 날짜
            </div>
            <div class = "col-lg-1">
            수정 x 대댓
            </div>
         </div>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         댓글 내용<br>
         
         <hr>
         endfor
         
          form 
         <h4 >Comment</h4>
         <div class = "row mt-4">
            <div class = "col-lg-11">
               <div class="form-floating">
                 <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                 <label for="floatingTextarea">아름다운 말을 사용 합니다..</label>
               </div>
            </div>
            <div class = "col-lg-1">
               <button type="button" class="btn btn-secondary" id ="submit">등록</button>
            </div>
         </div>
      </div>
   
   </div> -->
</div>


</body>
</html>