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

.card-text {
	font-size: 18px;
}

a {
	font-size: 15px;
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
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 style="font-weight: bold;" class="mt-4 mb-3">
			기가지니 사용법 <small style="font-weight: bold;">레시피 읽어주기</small>
		</h1>

		<!-- <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html">Home</a></li>
			<li class="breadcrumb-item active">Blog Home 1</li>
		</ol> -->

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-top" src="image/step1.png"
						alt="Card image cap">
					<div class="card-body">
						<hr>
						<h3 class="card-title" style="font-weight: bold;">STEP1 : 로그인
							하기</h3>
						<p class="card-text">스크랩을 하기 위해서는 로그인이 필요합니다. 로그인 후 스크랩할 레시피를
							클릭해주세요.</p>
					</div>
					<div class="card-footer text-muted"></div>
				</div>

				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-top" src="image/step2.png"
						alt="Card image cap">
					<div class="card-body">
						<hr>
						<h3 class="card-title" style="font-weight: bold;">STEP 2 :
							스크랩</h3>
						<p class="card-text">레시피 페이지의 최하단에 스크랩 버튼이 있습니다. 나만의 스크랩명을 적어
							스크랩을 해주세요.</p>
					</div>
					<div class="card-footer text-muted"></div>
				</div>

				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-top" src="image/step3.png"
						alt="Card image cap">
					<div class="card-body">
						<hr>
						<h3 class="card-title" style="font-weight: bold;">STEP 3 :
							기가지니 호출</h3>
						<p class="card-text">
							기가지니를 호출하고 스크랩명을 알려주세요. 이전/다음/다시/종료 명령어를 통해 기가지니가 레시피를 읽어줍니다.<br>
							오늘도 건강하고 맛있는 한 끼 하세요 &#128523;
						</p>
					</div>
					<div class="card-footer text-muted"></div>
				</div>

				<!-- Pagination -->
				<!-- <ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer
							&rarr;</a></li>
				</ul> -->

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card mb-4">
					<h5 class="card-header" style="font-weight: bold;">레시피 검색</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="검색어를 입력해주세요."> <span
								class="input-group-append">
								<button class="btn btn-secondary" type="button">검색</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header" style="font-weight: bold;">레시피 한눈에 보기</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="./newRecipeList">최신 레시피</a></li>
									<li><a href="./ingredientRecipeList">재료별 레시피</a></li>
									<li><a href="./themeRecipeList">테마별 레시피</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="./hitsRecipeList">BEST 레시피</a></li>
									<li><a href="./methodRecipeList">방법별 레시피</a></li>
									<li><a href="./levelRecipeList">난이도별 레시피</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<!-- <div class="card my-4">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the new
						Bootstrap 4 card containers!</div>
				</div> -->

			</div>

		</div>
		<!-- /.row -->

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
