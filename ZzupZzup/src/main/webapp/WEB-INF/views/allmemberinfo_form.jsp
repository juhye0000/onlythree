<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.onlythree.vo.Theme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$(".sel").click(function() {
		var member_id = $(this).parent().parent().children().first().text();
		$("#member_id").val(member_id);
		$('#member_info').submit();
	});
});
</script>
<style>
#member_info {
	margin: 30px 10px;
}
</style>
<h2  style="font-weight: bold;" class="mt-4">[ 회원 조회 ]</h2>
<form action="./allmemberinfo" method="post" id="member_info">
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
							<th>상세정보 조회</th>
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
									<td><input type="button" class="sel" value="조회" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>