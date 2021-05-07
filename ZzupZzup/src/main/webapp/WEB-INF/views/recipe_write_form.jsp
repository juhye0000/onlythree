<%@page import="com.onlythree.vo.Recipe"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Dr.Zzup</title>

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

.mb-0 {
	width: 50%;
	overflow: auto;
}

.time {
	float: left;
}

.meals_for {
	float: right;
}

#articleContentArea {
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}

#articleinfo {
	margin: auto;
	text-align: center;
}

.area {
	clear: both;
	padding-top: 15px;
}

.RECIPE_STEP {
	float: left;
	margin-right: 45px;
}

.text_area {
	width: 500px;
	height: 100px;
	float: left;
	margin-right: 16px;
}

.button_cnt {
      width:40px;
      height:40px;
      float:left;
}

.photo {
	background-size: cover;
	background-color: #80808042;
	width: 100px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	float: left;
	margin-right: 16px;
}

#mic {
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

#mic>button>img {
	width: 25px;
	height: 25px;
	padding: 2px;
}
</style>

<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(function() {
		$('#addBtn').click(function() {
    	var num = $('#wrap').children().last().attr('id');	//가장 마지막 id값 가져옴
    	num = Number(num);
    	
    	if(num == 0)
    		num = 1;
    		
 		var div = $("<div></div>").attr("id",String(num+1)).attr("class","area");
		var contentdiv = $("<div></div>").attr("id", "content" + String(num+1)).attr("class","contentBox");
		var stepnum = $("<p></p>").attr("id","step").text("Step "+String(num+1));
		var text = $("<textarea></textarea>").attr("id","CONTENT_CONTENT"+String(num+1)).attr("class","text_area cook").attr("name","text_area").attr("placeholder","해당 Step 상세설명");
		
		var photodiv = $("<div></div>").attr("id","photo");
		var filebtn = $("<input></input>").attr("id","file"+String(num+1)).attr("type","file").attr("name","photofile");		
		var delbtnbiv = $("<div></div>").attr("id","delBtndiv");
		var delbtn = $("<button></button>").attr("id","delBtn"+String(num+1)).attr("type","button").text("-").attr("class","delBtnclass");
		
		contentdiv.append(stepnum);
		contentdiv.append(text);
		
		photodiv.append(filebtn);
		
		delbtnbiv.append(delbtn);
		
		div.append(contentdiv);
		div.append(photodiv);
		div.append(delbtnbiv);

		$('#wrap').append(div);
    	});
    	
		$(document).on("click", ".delBtnclass", function() {
			var selid_del = $(this).attr('id');
			alert(selid_del);
		});
})

</script>

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

	<div class="container" role="main">
		<br>
		<h2>레시피 작성</h2>

		<!-- 0427 주혜 작성 중간 class 명 cook 추가됨 -->
		<div id="mic">
			<p>
				마이크 버튼을 누르고 박스를 선택한 후 내용을 말해주세요.<br />
			</p>
			<button id="btn-mic2" class="off">
				<img src="image/mic.png" alt="마이크"><span></span>
			</button>
		</div>
		<!-- 0427 주혜 작성 -->

		<form action="./insertRecipeContent" class="recipe_insert" id="recipe_insert" method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control cook" name="TITLE" id="TITLE"
					placeholder="제목을 입력해 주세요">
			</div>
			<br>
			<div class="mb-3">
				<label for="member_id">작성자</label> <input type="text"
					class="form-control" name="MEMBER_ID" id="MEMBER_ID"
					value=${sessionScope.id } placeholder=${sessionScope.id }>
			</div>
			<br>
			<div class="row mb-3">
				<label for="METHOD_ID">요리 분류</label>&nbsp;&nbsp;&nbsp;&nbsp; <select
					name="METHOD_ID" id="methods">
					<c:forEach var="methods" items="${methods }">
						<option value=${methods.method_id }>${methods.method_title }</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<label for="THEME_ID">요리 상황</label>&nbsp;&nbsp;&nbsp;&nbsp; 
				<select name="THEME_ID" id="themes">
					<c:forEach var="themes" items="${themes }">
						<option value=${themes.theme_id }>${themes.theme_title }</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<label id="INGREDIENT_CATEGORY">요리 재료</label>&nbsp;&nbsp;&nbsp;&nbsp; 
				<select	name="INGREDIENT_CATEGORY" id="ingredients">
					<c:forEach var="ingredients" items="${ingredients}">
						<option value=${ingredients.ingredient_category }>${ingredients.ingredient_category }</option>
					</c:forEach>
				</select><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<label for="LEVEL_ID">요리 난이도</label>&nbsp;&nbsp;&nbsp;&nbsp; 
				<select name="LEVEL_ID" id="cookLevels">
					<c:forEach var="cookLevels" items="${cookLevels }">
						<option value=${cookLevels.level_id }>${cookLevels.level_title }</option>
					</c:forEach>
				</select><br>
			</div>
			<div class="mb-3">
				<label for="MAINPIC1_URL">요리 대표 사진</label> <input type="file" name="sourceFile" id="sourceFile">
				<div id="image_container"></div>
			</div>

			<div class="mb-0">
				<label for="time">소요 시간</label> 
					<input type="text" class="form-control cook" name="TIME" id="TIME" placeholder="숫자로 입력해주세요 (분)">
			</div>
			<div class="mb-0">
				<label for="meals_for">인분</label> <input type="text" class="form-control cook" name="MEALS_FOR" id="MEALS_FOR" placeholder="숫자로 입력해주세요 (인분)"><br>
			</div>
			<div class="mb-3">
				<label for="INGREDIENT">재료</label> <input type="text" class="form-control cook" name="INGREDIENT" id="INGREDIENT" placeholder="재료 이름과 양을 띄어쓰기로 구분하여 입력해주세요">
			</div>
			<div class="mb-3">
				<label for="SOURCE">양념 재료</label> <input type="text" class="form-control cook" name="SOURCE" id="SOURCE" placeholder="재료 이름과 양을 띄어쓰기로 구분하여 입력해주세요">
			</div>
			<!-- 레시피 단계별 과정 -->
			<div class="mb-3">
				<label for="CONTENT">요리 과정</label>
					<div id="wrap">
						<div id="0" class="area">
							<div id="content0" class="contentBox">
								<p id="step">Step 1</p>
									<textarea id="CONTENT_CONTENT0" name="text_area" class="text_area cook" placeholder="해당 Step 상세설명"></textarea>
							</div>
							<div id="photo">
								<input type="file" id="file0" name="photofile" class="photofile" value="+">
							</div>	
							<div id="delBtndiv">
								<button type="button" id="dleBtn0" class="delBtnClass">-</button>
							</div>
						</div>
					</div>
					<div id=addBtndiv1>
						<div id=addBntdiv2>
							<button type="button" id="addBtn" class="form-submit">+</button>
						</div>
					</div>
				</div>
			<br>
			<div class="mb-3">
				<label for="tag">TAG</label> <input type="text"
					class="form-control cook" name="TAG" id="TAG"
					placeholder="태그를 입력해 주세요">
			</div>
			<div class="form-group form-button">
				<button type="submit" name="saveBtn" id="saveBtn" value="저장">저장</button>
				<button id="frmCancel" name="frmCancel" type="button" onclick="fnGoBoardList()" value="취소">취소</button>
			</div>
		</form>
	</div>
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- 0427 주혜 작성 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="index/js/stt.js"></script>
	<!-- 0427 주혜 작성 -->

</body>
</html>