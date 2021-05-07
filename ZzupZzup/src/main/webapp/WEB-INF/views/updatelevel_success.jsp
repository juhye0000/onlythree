<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#success_up {
	width: 600px;
	margin: 30px 10px;
}

#head {
	font-weight: bold;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 카테고리 수정 ]</h2>
<br />
<form id="success_up">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 요리레벨 카테고리
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td id="head">${param.level_id } / ${param.level_title } 카테고리가 수정되었습니다.</td>
						</tr>
						<tr>
							<td><input type="button" value="추가 수정하기"
								onclick="location.href='/updatelevel'" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>