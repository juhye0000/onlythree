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

	<title>Modern Business - Start Bootstrap Template</title>
	<!-- 배재현 수정 -->
	<link href="login/css/style_jh.css" rel="stylesheet">
  
	<!-- Bootstrap core CSS -->
	<link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
.profileBody{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    /* background-color: #e2e8f0;   */  
}
.profile-main-body {
    padding: 15px;
}
.profile-card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.profile-card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.profile-card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.profile-gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.profile-gutters-sm>.col, .profile-gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}
.mb-0 {
	text-align: center;
}
.profile-title {
	text-align:center;
	font-weight:bold;
}

#button-outer{
	text-align:center;
}
#button-center{
	  display:inline-block;
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

	
	
<div class="container">



<form method="POST" id="myprofileupdate" action="./myProfile_update" enctype="multipart/form-data">
		<!-- Page Heading/Breadcrumbs -->
		<div class="profileBody">
			<div class="container">
				<div class="main-body">
					<!-- Breadcrumb -->
					<nav aria-label="breadcrumb" class="main-breadcrumb">
						<ol class="breadcrumb">
							<h3>
								${sessionScope.id}님 <small>의 마이페이지</small>
							</h3>
						</ol>
					</nav>
					<!-- /Breadcrumb -->
					<div class="row profile-gutters-sm">
						<div class="col-md-4 mb-3">
							<div class="profile-card">
								<div class="profile-card-body">
									<div class="d-flex flex-column align-items-center text-center">
										<img src="${MEM_IMG_URL}" alt="profile_img" class="rounded-circle" width="150">
										<div class="mt-3">
											<h4>${sessionScope.id}님</h4>
											<input type="file" class="btn btn-primary" name="profileImg" id="mem_img_url" value="프로필사진 수정" />
										</div>
									</div>
								</div>
							</div>
							<div class="profile-card mt-3">
								<ul class="list-group list-group-flush">
									<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<a href="myPreferList"> MY 선호도조사</a>
										</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<a href="myRecipeList"> MY 레시피</a>
										</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<a href="mypage_scrap_list"> 스크랩 레시피</a>
										</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<a href="#"> 최근 본 레시피 </a>
										</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<a href="myProfile"> 내 정보 확인</a>
										</h6>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-8">
							<div class="profile-card mb-3">
								<div class="profile-card-body">
										<div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">회원 아이디</h6></div>
    	<input type="text" class="col-sm-8 mt-2" name="member_id" id="member_id" value="${memberID}" />
    </div>
    <hr>
	<div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">회원 이름</h6></div>
		<input type="text" class="col-sm-8 mt-2" name="name" id="name" value="${memberName}" />
    </div>
	<hr>
    <div class="row">
    	<div class="col-sm-3"><h6 class="mt-2 profile-title">별명</h6></div>
		<input type="text" class="col-sm-8 mt-2"  name="nickname" id="nickname" value="${memberNickname}" />
	</div>
    <hr>
    <div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">이메일</h6></div>
		<input type="text" class="col-sm-8 mt-2"  name="email" id="email" value="${memberEmail}" />
    </div>
    <hr>
    <div class="row">
    	<div class="col-sm-3"><h6 class="mt-2 profile-title">휴대전화</h6></div>
    	<input type="text" class="col-sm-8 mt-2"  name="phone" id="phone" value="${memberPhone}" />
	</div>
    <hr>
    <div class="row">
		<div class="col-sm-3"><h6 class="mt-2 profile-title">출생년도</h6></div>
		<input type="text" class="col-sm-8 mt-2"  name="birthyear" id="birthyear" value="${memberBirthyear}" /> 
 	</div>
    <hr>

	
	<div id="button-outer">
		<div id ="button-center">
			<input type="submit" value="저장" class="btn btn-primary">
		</div>
	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


</form>
</div>
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
