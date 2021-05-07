<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#success_del {
	width: 600px;
	margin: 30px 10px;
}

#head {
	font-weight: bold;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 회원 삭제 ]</h2>
<form id="success_del">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 회원 삭제
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td id="head">${param.member_id } 회원이 삭제되었습니다.</td>
						</tr>
						<tr>
							<td><input type="button" value="추가 삭제하기"
								onclick="location.href='/deletemember'" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>