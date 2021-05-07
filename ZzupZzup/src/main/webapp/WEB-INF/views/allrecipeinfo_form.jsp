<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.onlythree.vo.Theme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".sel").click(function() {
		var RECIPE_ID = $(this).parent().parent().children().first().text();
		$("#RECIPE_ID").val(RECIPE_ID);
		$('#recipe_info').submit();
	});
});
</script>
<link href='http://www.openhiun.com/hangul/nanumbarungothic.css'
	rel='stylesheet' type='text/css'>
<style>
* {
	font-family: 'Nanum Barun Gothic', sans-serif;
}

#recipe_info {
	margin: 30px 10px;
}

img {
	width: 100px;
	height: 100px;
}

.title {
	text-overflow: ellipsis;
	width: 600px;
	text-align: left !important;
}

table {
	text-align: center;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 레시피 조회 ]</h2>
<form action="./getRecipeContent" method="post" id="recipe_info">
	<input type="hidden" name="RECIPE_ID" id="RECIPE_ID" />
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 전체 레시피 목록
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>아이디</th>
							<th>메인사진</th>
							<th>제목</th>
							<th>작성자</th>
							<th>카테고리</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>바로가기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recipe" items="${recipes }">
							<tr>
								<td>${recipe.RECIPE_ID }</td>
								<td><c:if test="${recipe.MAINPIC1_URL!=null }">
										<img class="img-fluid rounded" src="${recipe.MAINPIC1_URL}"
											alt="">
									</c:if></td>
								<td class="title">${recipe.TITLE }</td>
								<td>${recipe.NICKNAME }</td>
								<td class="category">${recipe.INGREDIENT_CATEGORY }<br>
									${recipe.METHOD_TITLE }<br> ${recipe.THEME_TITLE }<br>
									${recipe.LEVEL_TITLE }
								</td>
								<td>${recipe.CREATED_DATE }</td>
								<td>${recipe.RECIPE_HITS }</td>
								<td><input type="button" class="sel" value="조회" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>