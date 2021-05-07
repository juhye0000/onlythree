<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>

<html lang="en">

<head>
<link rel='icon' type='image/png' href='image/top_logo.png'>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	shrink-to-fit="no">
<meta name="description" content="">
<meta name="author" content="">

<title>DR.Zzup</title>

<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	    $(function(){
	        var responseMessage = "<c:out value="${message}" />";
	        if(responseMessage != ""){
	            alert(responseMessage)
	        }
	    }) 
	</script>
<style>
.carousel-item {
	background-size: auto;
}

#title {
	font-size: 90px;
	font-weight: bold;
	text-align: right;
	margin-right: 30px;
	text-shadow: -1px 0 #fff, 0 1px #fff, 1px 0 #fff, 0 -1px #fff;
}

#sub {
	font-size: 50px;
	font-weight: bold;
	text-align: right;
	margin-right: 30px;
	text-shadow: -1px 0 #fff, 0 1px #fff, 1px 0 #fff, 0 -1px #fff;
}

#title_back {
	background-image: url("./image/food.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

img {
	height: 230px;
}
</style>
</head>
<body>
	<!-- Navigation 각자 네비게이션 들어가는 페이지에 붙여넣기-->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<!-- 0506 홈이동 수정 -->
			<a class="navbar-brand" href="/">&#x1F374; Dr.Zzup &#x1F374;</a>
			<!-- 검색 -->
			<form class="form-inline" action="./SearchRecipeList" method="post">
				<input class="form-control" type="text" placeholder="검색어를 입력해주세요." name="searchword">
				<button class="btn btn-primary" type ="submit"> 검색</button>
			</form>

			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="./ingredientRecipeList">재료별</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./methodRecipeList">방법별</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./themeRecipeList">테마별</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./levelRecipeList">난이도별</a></li>


					<c:choose>
						<c:when test="${sessionScope.id == null }">
							<li class="nav-item"><a class="nav-link" href="login">로그인</a>
							</li>
						</c:when>

						<c:when test="${sessionScope.id == 'admin' }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 관리자페이지 </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="admin">관리자페이지</a> <a
										class="dropdown-item" href="dashboard">통계</a> <a
										class="dropdown-item" href="allmemberinfo">회원 관리</a> <a
										class="dropdown-item" href="allrecipeinfo">레시피 관리</a> <a
										class="dropdown-item" href="categorytheme">카테고리 관리</a> <a
										class="dropdown-item" href="logout">로그아웃</a>
								</div></li>
						</c:when>

						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
									${sessionScope.id}님 </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="mypage">마이페이지</a> <a
										class="dropdown-item" href="insertRecipeContent">레시피 작성</a> <a
										class="dropdown-item" href="myPreferList">음식선호조사</a> <a
										class="dropdown-item" href="mypage_scrap_list">스크랩한 레시피</a> <a
										class="dropdown-item" href="myProfile">회원정보확인</a> <a
										class="dropdown-item" href="logout">로그아웃</a>
								</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url(image/slide4.jpg)">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(image/slide1.jpg)">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(image/slide2.jpg)">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<!-- Slide Four - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(image/slide3.jpg)">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<div id="title_back">
		<p id="sub">건강하고 맛있는 한 끼&#127869;</p>
		<p id="title">쩝쩝박사</p>
	</div>
	<br>
	<!-- Page Content -->
	<div class="container">
		<!-- 최신 등록순 레시피 Section -->
		<div>
			<div style="float: left;">
				<h2 style="display: inline; font-weight: bold;">&#10024; 최신 레시피
					&#10024;</h2>
			</div>
			<div style="float: right;">
				<br> <a style="text-align: right;" href="./newRecipeList">더보기</a>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<c:forEach var="recipe" items="${newRecipes}" varStatus="i">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<img class="card-img-top" src="${recipe.MAINPIC1_URL}" alt="">
						<div class="card-body">
							<p class="card-title">
								<a href="/getRecipeContent?RECIPE_ID=${recipe.RECIPE_ID}">${recipe.TITLE}</a>
							</p>
							<p style="text-align: right;">조회수 : ${recipe.RECIPE_HITS}</p>
							<p style="text-align: right;">등록일 : ${recipe.CREATED_DATE}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 조회수 베스트 레시피 Section -->
		<div>
			<div style="float: left;">
				<h2 style="display: inline; font-weight: bold;">&#x2757; BEST
					레시피 &#x2757;</h2>
			</div>
			<div style="float: right;">
				<br> <a style="text-align: right;" href="./hitsRecipeList">더보기</a>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<c:forEach var="recipe" items="${bestRecipes}" varStatus="i">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<img class="card-img-top" src="${recipe.MAINPIC1_URL}" alt="">
						<div class="card-body">
							<p class="card-title">
								<a href="/getRecipeContent?RECIPE_ID=${recipe.RECIPE_ID}">${recipe.TITLE}</a>
							</p>
							<p style="text-align: right;">조회수 : ${recipe.RECIPE_HITS}</p>
							<p style="text-align: right;">등록일 : ${recipe.CREATED_DATE}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2 style="font-weight: bold;">기가지니 듣는 레시피 서비스</h2>
				<p>쩝쩝박사와 기가지니가 함께하는 듣는 레시피 서비스를 이용해보세요! 조금 더 쉽고 편리한 요리 시간이 더욱
					즐거운 경험으로 다가옵니다.</p>
				<h5>
					<strong>이런 분들에게 추천해요 &#x203C;</strong>
				</h5>
				<ul>
					<li>기가지니를 어떻게 활용해야 할지 고민이셨던 분 &#129300;</li>
					<li>요리 과정을 기억하기가 어려웠던 분 &#129327;</li>
					<li>글로 보는 레시피에 답답하셨던 분 &#128553;</li>
				</ul>
				<br />
				<a class="btn btn-lg btn-secondary btn-block"
					href="./aboutGigagenie">기가지니 사용법 안내</a>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="image/aboutGigagenie.jpg" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
