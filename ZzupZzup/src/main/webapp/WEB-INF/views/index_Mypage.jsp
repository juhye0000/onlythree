<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" shrink-to-fit="no">
<meta name="description" content="">
<meta name="author" content="">

<title>DR.Zzup</title>

<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	    $(function(){
	        var responseMessage = "<c:out value="${message}" />";
	        if(responseMessage != ""){
	            alert(responseMessage)
	        }
	    }) 
</script>

<style>
/* .carousel-item {
	background-size : auto;
} */

.pt-5, .py-5 {
    padding-top: 3rem!important;
    padding-bottom: 3rem!important;
    margin-top: 40px;
        
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
		<jsp:include page="${page}.jsp" />
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
