<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.onlythree.vo.Theme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".del").click(function() {
		var member_id = $(this).parent().parent().children().first().text();
		$("#member_id").val(member_id);
		if(confirm('삭제할까요?')) {
			$('#del_member').submit();
		}
	});
});
</script>
<style>
#del_member {
	margin: 30px 10px;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 회원 삭제 ]</h2>
<form action="./deletemember" method="post" id="del_member">
	<input type="hidden" name="member_id" id="member_id" />
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 전체 회원 목록
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>회원 아이디</th>
							<th>회원 닉네임</th>
							<th>회원 이메일</th>
							<th>성별</th>
							<th>나이</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${members }">
							<c:if test="${member.member_id != 'admin' }">
								<tr>
									<td>${member.member_id }</td>
									<td>${member.nickname }</td>
									<td>${member.email }</td>
									<td>${member.gender }</td>
									<td>${member.birthyear }</td>
									<td><input type="button" class="del" value="삭제" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>
