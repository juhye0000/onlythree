<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.onlythree.vo.Recipe"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  Bootstrap core CSS
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  Custom styles for this template
  <link href="index/css/modern-business.css" rel="stylesheet"> -->

<script>
$(function(){
	$(".del").click(function() {
		var RECIPE_ID = $(this).parent().parent().parent().children('.RECIPE_ID').text();
		$("#RECIPE_ID").val(RECIPE_ID);
		if(confirm('삭제할까요?')) {
			$('#del_recipe').submit();
		}
	});
});
</script>

<style type="text/css">
#button-outer{
	text-align:center;
	margin-top: 0.75em;
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
    background-color: #94bbe9;
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
.bottom-text-outter{
	position: relative;
}
.bottom-text-inner{
    position: absolute;
    bottom: 0;
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
	  	 <div class="col-lg-8 ">
	  	 	<p class="mypage-banner-text">내가 작성한 레시피 ${searchCount}개</br>
	  	 		<input type="button" value="레시피 작성하기" class="btn btn-light" style="margin-top: 0.5em" onclick="#"> 
	  	 	</p>
	  	 </div>
		<div class="col-lg-4">
	  	 	<img class="mypage-banner-img" src="image/recipelist.png" alt="preferlist" >
	  	 </div>
	</div>
		<form action="./deleteMyRecipe" method="post" id="del_recipe">
		<input type="hidden" name="RECIPE_ID" id="RECIPE_ID" />
			<div class="row">
				<c:forEach items="${recipeList}" var="val">
					<div class="col-lg-4 col-sm-6 portfolio-item">
						<div class="card h-100">
							<a href="/getRecipeContent?RECIPE_ID=${val.RECIPE_ID}"> <img class="card-img-top" src="${val.MAINPIC1_URL}" alt="" style="height:230px;"></a>
							<div class="card-body bottom-text-outter ">
								<div class="card-title">
									<a href="/getRecipeContent?RECIPE_ID=${val.RECIPE_ID}">${val.TITLE}</a>
								</div>
									<c:if test="${val.UPDATED_DATE == null}"><p class="card-text bottom-text-inner"> 작성일 : ${val.CREATED_DATE} </p> </c:if>
									<c:if test="${val.UPDATED_DATE != null}"><p class="card-text bottom-text-inner"> 작성일 : ${val.UPDATED_DATE} </p> </c:if>
							</div>
							<div class="RECIPE_ID" style="display:none">
		          				${val.RECIPE_ID}
		          			</div>
							<div id="button-outer">
								<div id="button-center">
									<input type="button" value="수정" class="btn btn-light modify">
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
