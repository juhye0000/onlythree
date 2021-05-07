<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

#make_category {
	width: 600px;
	margin : 50px 10px;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 카테고리 입력 ]</h2>
<br />
<ul class="c_ul">
	<li><a id = "t" href="/maketheme"> 테마 카테고리</a></li>
	<li><a id = "m" href="/makemethod"> 방법 카테고리</a></li>
	<li><a id = "l" href="/makelevel"> 요리레벨 카테고리</a></li>
	<li><a id = "i" href="/makeingredient"> 재료 카테고리</a></li>
</ul>
<form action="./makeingredient" method="post" id="make_category">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 재료 카테고리 입력
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td>카테고리 아이디</td>
							<td><input type="text" name="ingredient_id" /></td>
						</tr>
						<tr>
							<td>재료 소분류</td>
							<td><select name="ingredient_category" class="in">
									<option value="곡류">곡류</option>
									<option value="식량작물">식량작물</option>
									<option value="채소류">채소류</option>
									<option value="육류">육류</option>
									<option value="난류">난류</option>
									<option value="유제품">유제품</option>
									<option value="해산물">해산물</option>
									<option value="해조류">해조류</option>
									<option value="과일류">과일류</option>
									<option value="견과류">견과류</option>
									<option value="버섯류">버섯류</option>
									<option value="가공식품류">가공식품류</option>
									<option value="기타">기타</option>
							</select></td>
						</tr>
						<tr>
							<td>카테고리 이름</td>
							<td><input type="text" name="ingredient_name" /></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2"><input type="submit" value="입력" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>