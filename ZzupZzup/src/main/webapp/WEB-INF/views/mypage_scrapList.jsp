<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.onlythree.vo.Scrap"%>
<%@ page import="com.onlythree.vo.Recipe"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".del").click(function() {
		var SCRAP_ID = $(this).parent().parent().parent().children('.SCRAP_ID').text();
		$("#SCRAP_ID").val(SCRAP_ID);
		if(confirm('삭제할까요?')) {
			$('#del_scrap_recipe').submit();
		}
	});
});
</script>
<style type="text/css">
#button-outer{
	text-align:center;
}
#button-center{
	display:inline-block;
	margin-bottom: 10px;
}
#count-title{
	text-align: center;
    margin: 10px;
}
.mypage-banner-div{
	margin-bottom: 3%;
    background-color: #38ada9;
    border-radius: 2em;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    margin-right: 0.5em;
    margin-left: 0.5em;
}

.mypage-banner-text{
	text-align: left;
 	padding-top: 2em;
    padding-left: 3%;
    font-weight: bold;
    font-size: x-large;
    color: white;
}

.mypage-banner-img{
	height: 100%;
    width: 100%;
    padding: 3%;
}
.card-title{
	margin-bottom: .75rem;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    line-height: 1.2em;
    height: 2.3em;
}
</style>
</head>

<body>
<!-- Page Content -->
<div class="container">
  <div class="row mypage-banner-div">
	  	 <div class="col-lg-8">
	  	 	<p class="mypage-banner-text">내가 스크랩한 레시피 ${searchCount}개</br>
	  	 		<input type="button" value="레시피 보러가기" class="btn btn-light" style="margin-top: 0.5em" onclick="location.href='#'"> 
	  	 	</p>
	  	 </div>
		<div class="col-lg-4">
	  	 	<img class="mypage-banner-img" src="image/scraplist.png" alt="preferlist">
	  	 </div>
	</div>
	<form action="./deleteScrapRecipe" method="post" id="del_scrap_recipe">
		<input type="hidden" name="SCRAP_ID" id="SCRAP_ID" />
		<div class="row">
		<c:forEach items="${scrapList}" var="scrap" >
			<div class="col-lg-4 col-sm-6 portfolio-item">
		        <div class="card h-100">
		        	<a href="/getRecipeContent?RECIPE_ID=${scrap.RECIPE_ID}"><img class="card-img-top" src="${scrap.MAINPIC1_URL}" alt="" style="height:230px;"></a> 
		          	<div class="card-body">
		          		<p class="card-title">
		            		<a href="/getRecipeContent?RECIPE_ID=${scrap.RECIPE_ID}">스크랩명 [ ${scrap.SCRAP_TITLE} ]</a>
		            	</p>
		          	
		            	<div class="card-title">
		            		<a href="/getRecipeContent?RECIPE_ID=${scrap.RECIPE_ID}">${scrap.TITLE}</a>
		            	</div>
		            	<p class="card-text"> 스크랩 : ${scrap.SCRAP_DATE} </p>
		          	</div>
		          	<div class="SCRAP_ID" style="display:none">
		          		${scrap.SCRAP_ID}
		          	</div>
		          	<div id="button-outer">
						<div id ="button-center">
							<input type="button" value="삭제" class="btn btn-danger del">
						</div>
					</div>
		        </div>
			</div>
		</c:forEach>
	</div>
	</form>

</div>
  <!-- /.container -->



  <!-- Bootstrap core JavaScript -->
  <script src="index/vendor/jquery/jquery.min.js"></script>
<!--   <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
