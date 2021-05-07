<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".sel").click(function() {
		var THEME_TITLE = $(this).attr("value");
		$("#THEME_TITLE").val(THEME_TITLE);
		$('#recipe_list').submit();
	});
});
</script>
<link rel='icon' type='image/png' href='image/top_logo.png'>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>DR.Zzup</title>
<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">
<style>
.sel {
	background-color: transparent;
	width: 120px;
	height: 40px;
	font-weight: bold;
	border-radius: 20px;
	border: 0;
	outline: 0;
	margin-left: -5px;
	margin-right: 5px;
}

.sel:hover {
	background-color: #fff;
	font-weight: bold;
}

h1 {
	font-weight: bold;
}

h1>small {
	font-weight: bold;
}

img {
	height: 230px;
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

.card-title {
	text-align: left;
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
	<div id="title_back">
		<p id="sub">건강하고 맛있는 한 끼&#127869;</p>
		<p id="title">쩝쩝박사</p>
	</div>
	<!-- Page Content -->
	<h1 class="mt-4 mb-3">
		테마별 레시피 : <small>${THEME_TITLE}</small>
	</h1>

	<form action="./themeRecipeList" method="post" id="recipe_list">
		<div class="breadcrumb">
			<input type="hidden" id="THEME_TITLE" name="THEME_TITLE" />
			<table>
				<tr id="1">
					<td><input type="button" class="sel" value="전체" /></td>
					<td><input type="button" class="sel" value="일상" /></td>
					<td><input type="button" class="sel" value="초스피드" /></td>
					<td><input type="button" class="sel" value="손님접대" /></td>
					<td><input type="button" class="sel" value="술안주" /></td>
					<td><input type="button" class="sel" value="다이어트" /></td>
					<td><input type="button" class="sel" value="도시락" /></td>
					<td><input type="button" class="sel" value="영양식" /></td>
				</tr>
				<tr id="2">
					<td><input type="button" class="sel" value="간식" /></td>
					<td><input type="button" class="sel" value="야식" /></td>
					<td><input type="button" class="sel" value="푸드스타일링" /></td>
					<td><input type="button" class="sel" value="해장" /></td>
					<td><input type="button" class="sel" value="명절" /></td>
					<td><input type="button" class="sel" value="이유식" /></td>
					<td><input type="button" class="sel" value="비건" /></td>
					<td><input type="button" class="sel" value="기타" /></td>
				</tr>
			</table>
		</div>
		<br>
		<!-- Page Content -->
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${fn:length(recipes)==0 }">
						<div>
							<h5 style="font-weight: bold;">아직 등록된 레시피가 없어요..&#x1F602;</h5>
							<br />
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="recipe" items="${recipes}" varStatus="i">
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
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
	<!-- /.container -->
	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<!-- <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>