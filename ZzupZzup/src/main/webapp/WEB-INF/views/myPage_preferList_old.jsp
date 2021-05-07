<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="index/css/modern-business.css" rel="stylesheet">
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
	text-align:center;
}
	
	</style>
</head>

<body>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  
  
    <div class="container">
      <a class="navbar-brand" href="/index">Dr.Zzup</a>
     	<div class="search">
     		<input type="text" placeholder="검색어를 입력해주세요.">
		</div>
		<div class="button">
		     <button>검색</button>
		</div>
      
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="recipe_list">재료별</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">분류별</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">테마별</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">난이도별</a>
          </li>

          
            <c:choose>
				<c:when test="${sessionScope.id == null }">
				<li class="nav-item">
					<a class="nav-link" href="login">로그인</a>
				</li>
				</c:when>
				
				<c:when test="${sessionScope.id == 'admin' }">
				<li class="nav-item dropdown">
			            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			              관리자페이지
			            </a>
			            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
			              <a class="dropdown-item" href="admin">관리자페이지</a>
			              <a class="dropdown-item" href="#">통계</a>
			              <a class="dropdown-item" href="#">회원관리</a>
			              <a class="dropdown-item" href="#">게시글관리</a>
			              <a class="dropdown-item" href="#">카테고리관리</a>
			              <a class="dropdown-item" href="logout">로그아웃</a>
			            </div>
			          </li>
				</c:when>
				
				<c:otherwise>
					 <li class="nav-item dropdown">
			            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			              ${sessionScope.id}님
			            </a>
			            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
			              <a class="dropdown-item" href="mypage">마이페이지</a>
			              <a class="dropdown-item" href="joinForm_ingre">음식선호조사</a>
			              <a class="dropdown-item" href="#">스크랩한 레시피</a>
			              <a class="dropdown-item" href="#">회원정보수정</a>
			              <a class="dropdown-item" href="logout">로그아웃</a>
			            </div>
			          </li>
				</c:otherwise>
			</c:choose>
                 
          
          
        </ul>
      </div>
    </div>
  </nav>

<!-- Page Content -->
<div class="container">

<!-- Page Heading/Breadcrumbs -->
<h1 class="mt-4 mb-3"> ${sessionScope.id}님
	<small>의 마이페이지</small>
</h1>

<div class ="profileBody">
<div class="container">
    <div class="main-body">
    	<!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
              <li class="breadcrumb-item active" aria-current="page">User Profile</li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    
          <div class="row profile-gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="profile-card">
                <div class="profile-card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <h4>${sessionScope.id}님</h4>
                      <p class="text-secondary mb-1">Full Stack Developer</p>
                      <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
                      <button class="btn btn-primary">회원정보 수정</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="profile-card mt-3">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><a href="myPreferList"> MY 선호도조사</a></h6>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><a href="myRecipeList"> MY 레시피</a></h6>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><a href="#"> 스크랩 레시피</a></h6>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                   <h6 class="mb-0"><a href="#"> 최근 본 레시피 </a></h6>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><a href="myProfile"> 내 정보 확인</a></h6>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-md-8">
              <div class="profile-card mb-3">
                <div class="profile-card-body">
                	<!-- 선호도 리스트 : 조사결과 리스트 + 수정하기 : [수정하기]버튼 누르면 모달 띄우기-->
                		  <div class="container">
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
            <p class="card-text">
			<ul class="card-ul">
				<c:forEach items="${fn:split(preferIngre, ',') }" var="item">
				   <li id="like">${item}</li>
				</c:forEach>
			</ul>
			</p>
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
	            <p class="card-text">
				<ul class="card-ul">
				   <c:forEach items="${fn:split(unpreferIngre, ',') }" var="item">
					   <li id="dislike">${item}</li>
					</c:forEach>
				</ul>
				</p>
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
	            <p class="card-text">
					<ul class="card-ul">
					   <c:forEach items="${fn:split(allergyIngre, ',') }" var="item">
						   <li id="allergy"> ${item}</li>
						</c:forEach>
					</ul>
				</p>
			</div>
        </div>
      </div>
</div>
    <!-- /.row -->
<div id="button-outer">
	<div id ="button-center">
		<input type="button"  value="수정" onclick="location.href='/joinForm_ingre'">
	</div>
</div>


  </div>
                	<!-- 다 null일때 : 빈 리스트 + 조사하기 : [조사하기]버튼 누르면 모달 띄우기-->
                	
                	<!-- 회원가입 후 [조사하기]버튼 누르면: 바로 모달 띄우기-->
                	
                	
                	
                	
                	
                
                </div>
              </div>
             
            </div>
          </div>
        </div>
    </div>
</div>
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
