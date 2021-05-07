<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script>
$(function(){
	$(".sel").click(function() {
		var INGREDIENT_CATEGORY = $(this).attr("value");
		$("#INGREDIENT_CATEGORY").val(INGREDIENT_CATEGORY);
		$('#recipe_list').submit();
	});
});
</script> -->
<link rel='icon' type='image/png' href='image/top_logo.png'>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>DR.Zzup</title>

<!-- Bootstrap core CSS -->
<link href="index/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="index/css/modern-business.css" rel="stylesheet">
<style>
#no-recipe {
	margin: 10px;
	text-align: center;
	text-size: 2.0em;
}

.sel {
	background-color: transparent;
	width: 100px;
	height: 40px;
	font-weight: bold;
	border-radius: 20px;
	border: 0;
	outline: 0;
	margin-left: -5px;
	margin-right: 10px;
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
</style>
</head>
<body>
	<div class="breadcrumb">
		<h1 class="mt-4 mb-3">
		 	조회결과 : ${searchCount} 건
		</h1>
	</div>
	<br>
		<!-- Page Content -->
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${fn:length(recipes)==0 }">
						<div id="no-recipe">
							<span>아직 등록된 레시피가 없어요..&#x1F602;</span>
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
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="index/vendor/jquery/jquery.min.js"></script>
	<!-- <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
