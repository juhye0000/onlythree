<%@page import="java.net.URLEncoder"%>
<%@page import="com.onlythree.vo.Recipe"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%
	Recipe recipe = (Recipe)request.getAttribute("recipe");
    String nowPage = (String)request.getAttribute("page");
%> --%>

<%-- <%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	//쿠키값 배열로 받을때 상품명 저장	
/* 	String[] recipeTitles = request.getParameterValues("RECIPE_ID");
	for (String recipe : recipeTitles){
		Cookie cookie  = new Cookie("recipe", URLEncoder.encode(recipe, "UTF-8"));
		response.addCookie(cookie);
	} */
	//쿠키값 하나만 
	String recipeId = request.getParameter("RECIPE_ID");
	Cookie cookie  = new Cookie("recipe", URLEncoder.encode(recipeId, "UTF-8"));
	cookie.setPath(request.getContextPath());
	response.addCookie(cookie);


%> --%>
<!DOCTYPE html>
<html>
<head>
<link rel='icon' type='image/png' href='image/top_logo.png'>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>DR.Zzup</title>
<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">
<script rc="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(function(){
	var responseMessage = "<c:out value="${message}" />";
	if(responseMessage != ""){
		alert(responseMessage)
	}
	        
	$(".del").click(function() {
		var RECIPE_ID = $(this).parent().parent().children().first().text();
			$("#RECIPE_ID").val(RECIPE_ID);
			if(confirm('삭제할까요?')) {
				$('#del_recipe').submit();
			}
		});
}); 

</script>
<!-- 0430 주혜 수정 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".scrap").click(function() {
		var RECIPE_ID = "<c:out value="${recipe.RECIPE_ID}"/>";
		$("#RECIPE_ID").val(RECIPE_ID);
		if(confirm('스크랩할까요?')) {
			$('#scrap_recipe').submit();
		}
	});
});
</script>
<style type="text/css">
.articleForm {
	width: 1000px;
	margin: 0 auto;
	padding-top: 56px;
	text-align: center;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	
}

.col-lg-6 {
	padding-top: 20px;
	margin: 0 auto;
	overflow: auto;
}

#articleContentArea {
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#articleinfo {
	margin: auto;
	text-align: center;
}

#speaker {
	margin: 10px 0 10px 0;
	display: block;
	width: 100%;
	height: 100px;
	padding: 10px;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	text-align: center;
	display: block;
}

#speaker>button>img {
	border-radius: .25rem;
	width: 25px;
	height: 25px;
	padding: 2px;
}

/* 0428 주혜 추가 */
#SCRAP_TITLE {
	
}
</style>

<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">

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
	<div class="articleForm">
		<div id="speaker">
			<p>
				마이크 버튼을 누르고 "다음"을 말하면 재료와 요리방법을 읽어드려요.<br />
			</p>
			<button id="btn-mic" class="off">
				<img src="image/speaker.png" alt="스피커"><span></span>
			</button>
		</div>
		<!-- 0428 주혜 수정 -->
		<form action=./mypagescrap method="post" id="scrap_recipe">
			<input type="hidden" name="RECIPE_ID" id="RECIPE_ID" />

			<div class="basicInfoArea">
				<hr>
				<p>
					<c:if test="${recipe.MAINPIC1_URL!=null }">
						<img class="img-fluid rounded" src="${recipe.MAINPIC1_URL}" alt="">
					</c:if>
					<c:if test="${recipe.MAINPIC2_URL!=null }">
						<a href="file_down?downFile=${recipe.MAINPIC2_URL}">
							${recipe.MAINPIC2_URL} </a>
					</c:if>
					<c:if test="${recipe.MAINPIC3_URL!=null }">
						<a href="file_down?downFile=${recipe.MAINPIC3_URL}">
							${recipe.MAINPIC3_URL} </a>
					</c:if>
				</p>
				<p>조회수 : ${recipe.RECIPE_HITS }&nbsp;&nbsp;&nbsp;&nbsp;작성자 :
					${recipe.NICKNAME }</p>
				<br>
			</div>
			<h2>${recipe.TITLE }</h2>
			<br>

			<!-- 0427 주혜 작성 -->
			<!-- <div id="speaker">
				<p>
					마이크 버튼을 누르고 "다음"을 말하면 재료와 요리방법을 읽어드려요.<br />
				</p>
				<button id="btn-mic" class="off">
					<img src="image/speaker.png" alt="스피커"><span></span>
				</button>
			</div> -->
			<!-- 0427 주혜 작성 -->

			<br>
			<hr>
			<div class="row">
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 요리 방법 ]</strong><br> ${recipe.METHOD_TITLE }
					</p>
				</div>
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 요리 상황 ]</strong><br> ${recipe.THEME_TITLE }
					</p>
				</div>
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 요리 재료 ]</strong><br> ${recipe.INGREDIENT_CATEGORY }
					</p>
				</div>
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 소요 시간 ]</strong><br> ${recipe.TIME }분
					</p>
				</div>
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 인분(양) ]</strong><br> ${recipe.MEALS_FOR }인분
					</p>
				</div>
				<div class="col-lg-4 mb-4">
					<p>
						<strong>[ 요리 난이도 ]</strong><br> ${recipe.LEVEL_TITLE }
					</p>
					<br>
				</div>
				<br>
				<div class="col-lg-6 tts">
					<p>
						<strong>[ 재료 ]</strong><br>
						<c:forEach items="${fn:split(recipe.INGREDIENT, ',') }" var="item">
						${item }<br>
						</c:forEach>
					</p>
				</div>
				<div class="col-lg-6 tts">
					<p>
						<strong>[ 양념 재료 ]</strong><br>
						<c:forEach items="${fn:split(recipe.SOURCE, ',') }" var="item">
						${item }<br />
						</c:forEach>
					</p>
				</div>
				<br>
			</div>
			<hr>

			<p class="tts">
				<strong>[요리 과정]</strong><br>
			</p>
			<div class="row">
				<c:forEach var="content" items="${recipe.CONTENT }">
					<div class="col-lg-6 tts">
						<h5>
							<strong>Step ${content.RECIPE_STEP }. </strong>
						</h5>
						<p>${content.CONTENT_CONTENT }</p>
					</div>
					<div class="col-lg-6">
						<img class="img-fluid rounded" src="${content.CONTENT_IMAGE_URL}"
							alt=""><br> <br>
					</div>
				</c:forEach>
			</div>
			<hr>
			<div class="basicInfoArea">
				<div class="row">
					<div class="col-lg-6">
						<p>작성일 : ${recipe.CREATED_DATE }&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<c:choose>
							<c:when test="${sessionScope.id == MEMBER_ID }">
								<input type="button" class="update" value="수정" />
								<input type="button" class="del" value="삭제" />
							</c:when>
						</c:choose>
					</div>
					<!-- 0428 주혜 수정 -->
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${sessionScope.id == null }">
								<a class="btn btn-lg btn-secondary btn-block" href="#">URL
									Copy</a>
								<br>
							</c:when>

							<c:when test="${sessionScope.id == 'admin' }">
							</c:when>

							<c:otherwise>
								<input type="text" name="SCRAP_TITLE" id="SCRAP_TITLE"
									style="width: 480px; height: 40px;"
									placeholder="스크랩할 이름을 입력해주세요" />
								<br />
								<br />
								<input type="button"
									class="btn btn-lg btn-secondary btn-block scrap" value="Scrap" />
								<br />
								<a class="btn btn-lg btn-secondary btn-block" href="#">URL
									Copy</a>
								<br>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- <div class="col-lg-6">
					<a class="btn btn-lg btn-secondary btn-block" href="#">Scrap</a>
					<a class="btn btn-lg btn-secondary btn-block" href="#">URL Copy</a><br>
				</div> -->
					<hr>
				</div>
			</div>

		</form>

		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2021</p>
			</div>
			<!-- /.container -->
		</footer>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="index/js/tts.js"></script>
</body>
</html>