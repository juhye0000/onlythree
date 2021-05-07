<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.onlythree.vo.Theme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".del").click(function() {
		var ingredient_id = $(this).parent().parent().children().first().text();
		$("#ingredient_id").val(ingredient_id);
		if(confirm('삭제할까요?')) {
			$('#del_ingredient').submit();	
		}
	});
});
</script>
<style>
.c_ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.c_ul>li {
	float: left;
}

.c_ul>li>a {
	margin: 30px 10px;
	padding: 10px 20px;
	color: white;
	border-radius: 0.25rem;
}

#t {
	background: #007bff;
}

#m {
	background: #ffc107;
}

#l {
	background: #28a745;
}

#i {
	background: #dc3545;
}

#del_ingredient {
	margin: 50px 10px;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 카테고리 조회 / 삭제 ]</h2>
<br />
<ul class="c_ul">
	<li><a id="t" href="/categorytheme"> 테마 카테고리</a></li>
	<li><a id="m" href="/categorymethod"> 방법 카테고리</a></li>
	<li><a id="l" href="/categorylevel"> 요리레벨 카테고리</a></li>
	<li><a id="i" href="/categoryingredient"> 재료 카테고리</a></li>
</ul>
<form action="./deleteingredient" method="post" id="del_ingredient">
	<input type="hidden" name="ingredient_id" id="ingredient_id" />
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 재료 카테고리
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>카테고리 아이디</th>
							<th>카테고리 소분류</th>
							<th>카테고리 이름</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ingredient" items="${ingredients }">
							<tr>
								<td>${ingredient.ingredient_id }</td>
								<td>${ingredient.ingredient_category }</td>
								<td>${ingredient.ingredient_name }</td>
								<td><input type="button" class="del" value="삭제" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>