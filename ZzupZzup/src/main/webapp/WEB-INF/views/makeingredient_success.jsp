<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#success_make {
	width: 600px;
	margin: 30px 10px;
}

#head {
	font-weight: bold;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 카테고리 입력 ]</h2>
<br />
<form id="success_make">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 재료 카테고리
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td id="head">${param.ingredient_id } / ${param.ingredient_category } / ${param.ingredient_name } 카테고리가 입력되었습니다.</td>
						</tr>
						<tr>
							<td><input type="button" value="추가 입력하기"
								onclick="location.href='/makeingredient'" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>