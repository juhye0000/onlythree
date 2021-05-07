<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.onlythree.vo.Member"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>myPreferList</title>
  
    <!-- 배재현 수정 -->
  <link href="join_login/css/style_jh.css" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="index/css/modern-business.css" rel="stylesheet">
<style>

.editBtn{
	text-align: center;
}

/* prefer list */
.card-title{
	text-align: center;
}

.card-img-top{
	width: 50px;
	height: 50px;
	margin-top: 20px;
}

.card-img{
	text-align: center;
}

.card-img-center{
	display:inline-block;
}

.card-ul{
   list-style:none;
   margin-right:5px;
   padding:5px 0 0 0;
}


ul li#like:before{
    content: "❤";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 5px 0px;
  }
  
ul li#dislike:before{
    content: "🖤";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 5px 0px;
  }
  
ul li#allergy:before{
    content: "💛";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 5px 0px;
  }
  
  
#button-outer{
	text-align: center;
}
#button-center{
	display:inline-block;
}

.btn-jh{
	
}

.mypage-banner-div{
	margin-bottom: 3%;
    background-color: #ffc107;
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
</style>


</head>

<body>

  
  <!-- Page Content -->
  <div class="container">
  <div class="row mypage-banner-div">
	  	 <div class="col-lg-8">
	  	 	<p class="mypage-banner-text">음식 선호조사를 통해 </br> 개인 맞춤 추천을 받을 수 있습니다!</p>
	  	 </div>
		<div class="col-lg-4">
	  	 	<img class="mypage-banner-img" src="image/preferlist.png" alt="preferlist" >
	  	 </div>
	</div>

    <div class="row">
       <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
	        <div class="card-img">
		        <div class="card-img-center">
		        	<img class="card-img-top" src="image/heart.png" alt="">
		        </div>
	        </div>
			<div class="card-body">
				<h4 class="card-title">Like </h4>
				<ul class="card-ul">
					<c:forEach items="${fn:split(memberPreferIngre, ',') }" var="item">
					   <li id="like">${item}</li>
					</c:forEach>
				</ul>
				<div class="editBtn">
					<input type="button" onclick="location.href='/survey_prefer'" value="수정" class="btn btn-light">
				</div>
			</div>
        </div>
      </div>
       <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
        <div class="card-img">
	        <div class="card-img-center">
	        	<img class="card-img-top" src="image/broken-heart.png" alt="">
	        </div>
        </div>
          <div class="card-body">
	            <h4 class="card-title">Dislike </h4>
	            <ul class="card-ul">
				   <c:forEach items="${fn:split(memberUnpreferIngre, ',') }" var="item">
					   <li id="dislike">${item}</li>
					</c:forEach>
				</ul>
				<div class="editBtn">
					<input type="button" onclick="location.href='/survey_unprefer'" value="수정" class="btn btn-light">
				</div>
			</div>
        </div>
      </div>
	<div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
        <div class="card-img">
	        <div class="card-img-center">
	        	<img class="card-img-top" src="image/Allergycaution.png" alt="">
	        </div>
        </div>

          	<div class="card-body">
	            <h4 class="card-title">Allergy </h4>
					<ul class="card-ul">
					   <c:forEach items="${fn:split(memberAllergyIngre, ',') }" var="item">
						   <li id="allergy"> ${item}</li>
						</c:forEach>
					</ul>
				<div class="editBtn">
					<input type="button" onclick="location.href='/survey_allergy'" value="수정" class="btn btn-light">
				</div>				
			</div>
        </div>
      </div>
</div>
    <!-- /.row -->

<!-- 수정버튼 
<div id="button-outer">
	<div id ="button-center">
		<input type="button" value="수정" onclick="location.href='/joinForm_ingre'">
	</div>
</div> -->


  </div>
  <!-- /.container -->


  <!-- Bootstrap core JavaScript -->
  <script src="index/vendor/jquery/jquery.min.js"></script>
<!--   <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
