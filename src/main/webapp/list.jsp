
<%@page import="shelterLikes.ShelterLikesDAO"%>
<%@page import="api.Sido"%>
<%@page import="paging.PagingDAO"%>
<%@page import="animal.AnimalInfoDAO"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 | 임시보호</title>

 <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">

	.dislike{
		width: 45px;
		height: 45px;
	}

	.dislike:active{
		width: 40px;
		height: 40px;
	}

	/* -----------------------------------------*/
	
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
    height: 32px;
   }
   figure {transition: opacity 0.2s; position: relative; margin: 0;}
   
   figure figcaption {color: #000;bottom: 70px; opacity: 0;position: absolute; text-align: center; width: 100%;transition: all .3s ease;}

    figure .gallery-img {opacity: 1;transition: all 0.3s ease 0s;overflow: hidden}

    figure:hover .gallery-img {background-color: #fff}

    figure:hover img {transform: scale(1.0, 1.0);transition: all .3s ease;opacity: 0.15;}

    figure:hover figcaption {opacity: 1;transition: all .3s ease; }
	
</style>
<%request.setCharacterEncoding("UTF-8"); %>
<%AnimalInfoDAO aniDAO = new AnimalInfoDAO(); %>
<%PagingDAO paDAO = new PagingDAO(); %>
<%ShelterLikesDAO slDAO = new ShelterLikesDAO(); %>

<%String careAddr; %>
<%String kindCd; %>
<%String sexCd = "알수없음"; %>
<%String noticeNo; %>
<%String likeState; %>
<%String noticeEdt; %>

<%String url; // aniDAO 결과값을 호출하기 위한 URL %>

<%String sido = request.getParameter("sido"); %>
<%String currentPageNo = request.getParameter("currentPageNo"); %>
<%String searchSido = request.getParameter("searchSido"); %>
<% String user = (String) session.getAttribute("user");%>


<%if(searchSido != null){%>
<%		sido = searchSido; %>
<% } %>

<% url = paDAO.updateUrl(sido, currentPageNo);%>
<% aniDAO.updateUrl(url); %>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div>
	<form action="list.jsp?currentPageNo=<%=currentPageNo %>" method="post">
		<select id = "searchSido" name = "searchSido" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
			<option value="seoul">서울</option>
			<option value="busan">부산</option>
			<option value="daegu">대구</option>
			<option value="incheon">인천</option>
			<option value="gwangju">광주</option>
			<option value="daejeon">대전</option>
			<option value="ulsan">울산</option>
			<option value="sejong">세종</option>
			<option value="gyeong-gido">경기도</option>
			<option value="gang-wondo">강원도</option>
		</select>
		<input type="hidden" name="currentPageNo" value="1">
		<input type="submit" value="검색">
	</form>
</div>





<div class = "container mt-5 mb-5" id="main">

   <div class = "row">
		<% for(int i = 0; i < aniDAO.getAniInfo().size(); i++){%>
	      <div class = "col-lg-4 mt-5">   
	         <div class="card" style="width: 23rem;">
	           <div class="card-header">
			    	공고번호 [ <%=aniDAO.getAniInfo().get(i).getNoticeNo() %> ]
			    	<%noticeNo = aniDAO.getAniInfo().get(i).getNoticeNo(); %>
			    	<%noticeEdt = aniDAO.getAniInfo().get(i).getNoticeEdt(); %>
			    	<%likeState = slDAO.readLikeState(user, noticeNo); %>
			  </div>
	           <figure>
	              <div class="gallery_img">
	                 <a href="post.jsp?sido=<%=sido%>&currentPageNo=<%=currentPageNo%>&index=<%=i%>">   
	                 	<img class="card-img-top" src="<%=aniDAO.getAniInfo().get(i).getPopfile()%>" alt="..." height = "350px" >
	                </a>
	              </div>
	              <figcaption>
	
	                  <h3>자세히 보기</h3>
	
	              </figcaption>
	           </figure>
	           
	           <div class="card-body">
	              <div id = "title">
	                 <div id="title_left">
	                    <h5><b>
	                     	<%=aniDAO.getAniInfo().get(i).getAge() %>                  
	                    </b></h5>
	                 </div>
	                <div id = "title_right">
	                		<%switch(aniDAO.getAniInfo().get(i).getSexCd()) {
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
                    	<p class="d-inline p-2 bg-dark text-white"><%= sexCd%></p>
                 	</div>
	              </div>
		             <p class="card-text"><br>
			               <ul class="result-group result-group-flush">
	       						<%kindCd = aniDAO.getAniInfo().get(i).getKindCd().replace("[개] ", ""); %>
							    <li class="result-group-item">견종 : <%=kindCd %></li>
							    <li class="result-group-item">체중 : <%=aniDAO.getAniInfo().get(i).getWeight() %></li>
								<%if(aniDAO.getAniInfo().get(i).getCareAddr().length() > 11){%>
								<%		careAddr = aniDAO.getAniInfo().get(i).getCareAddr().substring(0, 16) + "..."; %>
								<% }else{%>
								<%		careAddr = aniDAO.getAniInfo().get(i).getCareAddr(); %>
								<% } %>
							    <li class="result-group-item">보호장소 : <%=careAddr %></li>
						  </ul>
					</p>
	             </div>
	             <!-- https://steemit.com/steem/@koinbot/sns -->
	             <span style = "display: inline-block; height: 48px; padding-right: 80px; padding-left: 4%; padding-bottom: 1%;"> 
	               <!--  https://www.pngegg.com/ko/png-iscgt/download -->
	                <!-- <img src="./images/1814104_favorite_heart_like_love_icon.png" id = "dislike">&nbsp; -->
	                <input type="image" src="./images/1814104_favorite_heart_like_love_icon.png" id = "ajaxCall<%=i%>" class="dislike"> 
	                <%if(user != null){ %>
		                <script type="text/javascript">
		                	if('<%=likeState%>' == 'no' || '<%=likeState%>' == 'null'){
		                		document.getElementById('ajaxCall<%=i%>').src = "./images/1814104_favorite_heart_like_love_icon.png";
		                	}else if('<%=likeState%>' == 'yes'){
		                		document.getElementById('ajaxCall<%=i%>').src = "./images/5172567_heart_like_love_icon.png";
		                	}
		                </script>
		                <input type="hidden" id="noticeNo<%=i%>" value="<%=noticeNo%>">
		                <input type="hidden" id="noticeEdt<%=i%>" value="<%=noticeEdt%>">
		                <input type="hidden" id="memId<%=i%>" value="<%=user%>">
		                <script type="text/javascript">
		                var rePath = jQuery('#ajaxCall<%=i%>').attr("src");
		                if(rePath == './images/1814104_favorite_heart_like_love_icon.png'){ //좋아요 누르지 않은 상태
								$('#ajaxCall<%=i%>').click(function(){
									document.getElementById('ajaxCall<%=i%>').src = "./images/5172567_heart_like_love_icon.png";
									var reLikeState = 'yes' // 좋아요 클릭함
									var reNoticeNo = $('#noticeNo<%=i%>').val()
									var reNoticeEdt = $('#noticeEdt<%=i%>').val()
									var reMemId = $('#memId<%=i%>').val()
									var request = $.ajax({
									  url: "searchLike.jsp",
									  method: "POST",
									  data: { noticeNo : reNoticeNo,
										  noticeEdt : 	reNoticeEdt,
										  memId : reMemId,
										  likeState : reLikeState},
									  dataType: "html",
									});
									request.done(function(data) {
									  	console.log(data);
										if(data != undefined && data != ''){
											$('#ajaxResult<%=i%>').html(data);	
										}
									});
									request.fail(function( jqXHR, textStatus ) {
									  alert( "Request failed: " + textStatus );
									});
								});
		                }
		                if(rePath == "./images/5172567_heart_like_love_icon.png"){
							$('#ajaxCall<%=i%>').click(function(){
								document.getElementById('ajaxCall<%=i%>').src = "./images/1814104_favorite_heart_like_love_icon.png";
								var reLikeState = 'no' // 좋아요 취소
								var reNoticeNo = $('#noticeNo<%=i%>').val()
								var reNoticeEdt = $('#noticeEdt<%=i%>').val()
								var reMemId = $('#memId<%=i%>').val()
								var request = $.ajax({
								  url: "searchLike.jsp",
								  method: "POST",
								  data: { noticeNo : reNoticeNo,
									  noticeEdt : 	reNoticeEdt,
									  memId : reMemId,
									  likeState : reLikeState},
								  dataType: "html",
								});
								request.done(function(data) {
								  	console.log(data);
									if(data != undefined && data != ''){
										$('#ajaxResult<%=i%>').html(data);	
									}
								});
								request.fail(function( jqXHR, textStatus ) {
								  alert( "Request failed: " + textStatus );
								});
							});
		                }
					</script>
				<%} %>
	             </span>
	           </div>
	         </div>   
      		<%} %>
	      </div>
	    </div>
	<!— 전체 페이지 번호 —>
	<%int totalPageNo = 0; %>
	<%if(Integer.parseInt(paDAO.getTotalCount())%9 > 0){ %>
	<%		totalPageNo = (Integer.parseInt(paDAO.getTotalCount())/9) + 1; %>
	<%	}else {
			totalPageNo = (Integer.parseInt(paDAO.getTotalCount())/9);
	}%>
	
	<!— 페이징 기능 —>
	<%int startNo = paDAO.setStartNo(currentPageNo, totalPageNo);%>
	<%int endNo = startNo + 5; %>
			<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style="padding-left: 40%;">
				 <div class="btn-group me-2" role="group" aria-label="First group">
				<%if(!currentPageNo.equals("1")){ %>
	 					<button type="button" class="btn btn-outline-secondary" onclick="location='list.jsp?currentPageNo=<%=Integer.parseInt(currentPageNo)-1%>&sido=<%=sido%>'">이전</button>
	 			<% 	} %>
	<%for(int i = startNo ; i <= endNo; i++){ %>
	<%		if(i > totalPageNo) break; //i가 전체페이지를 넘는지 확인%>
	
	<%		if(Integer.parseInt(currentPageNo) == i){ %>
				<button type="button" class="btn btn-outline-secondary" style="background-color: #94716B;"><%=currentPageNo %></button>
	<%		}else { %>
				<button type="button" class="btn btn-outline-secondary" onclick="location='list.jsp?currentPageNo=<%=i%>&sido=<%=sido%>'"><%=i %></button>
	<%		} %>
	<% }%>
			<%	if(Integer.parseInt(currentPageNo) != totalPageNo){ %>
					<button type="button" class="btn btn-outline-secondary" onclick="location='list.jsp?currentPageNo=<%=Integer.parseInt(currentPageNo)+1%>&sido=<%=sido%>'">다음</button>
				<% 	} %>
				</div>
			</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<!— select문 동적으로 바꾸기 —>
	<script type="text/javascript">
		$('select[name="searchSido"]').find('option[value="<%=sido%>"]').attr("selected",true);
	</script>
</body>
</html>