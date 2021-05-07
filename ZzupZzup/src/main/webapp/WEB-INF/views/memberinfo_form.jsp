<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.onlythree.vo.Theme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#member_info {
	margin: 30px 10px;
}

#head {
	font-weight: bold;
	vertical-align: bottom;
	border-top: 2px solid #dee2e6;
	border-bottom: 2px solid #dee2e6;
}

#join_date {
	margin: 0 20px 20px 20px;
	float: right;
}

#back {
	text-align: center;
	margin: 0 auto;
	margin-bottom: 30px;
}

.ingr {
	width: 30% !important;
	float: left;
}

.prefer {
	margin-left: 20px;
}

.unprefer {
	margin-left: 50px;
	margin-right: 50px
}

.allergy {
	margin-right: 20px;
}
</style>
<h2 style="font-weight: bold;" class="mt-4">[ 회원 조회 ]</h2>
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 회원 ${member.member_id } 상세 정보
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<!-- <table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0"> -->
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>나이</th>
						<th>성별</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${member.name }</td>
						<td>${member.nickname }</td>
						<td>${member.email }</td>
						<td>${member.phone }</td>
						<td>${member.birthyear }</td>
						<td>${member.gender }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 재료 선호도 정보
	</div>
	<div class="card-body">
		<table class="table table-bordered ingr prefer">
			<thead>
				<tr>
					<th colspan="2">선호재료</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(member.preferred_ingr)==0 }">
						<tr>
							<td colspan="2">아직 등록된 선호재료가 없어요..&#x1F602;</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="prefer"
							value="${fn:split(member.preferred_ingr, ',') }" />
						<c:forEach var="item" items="${prefer }" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${item}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<table class="table table-bordered ingr unprefer">
			<thead>
				<tr>
					<th colspan="2">비선호재료</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(member.unpreferred_ingr)==0 }">
						<tr>
							<td colspan="2">아직 등록된 비선호재료가 없어요..&#x1F602;</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="unprefer"
							value="${fn:split(member.unpreferred_ingr, ',') }" />
						<c:forEach var="item" items="${unprefer }" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${item}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<table class="table table-bordered ingr allergy">
			<thead>
				<tr>
					<th colspan="2">알러지 재료</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(member.allergy_ingr)==0 }">
						<tr>
							<td colspan="2">아직 등록된 알러지재료가 없어요..&#x1F602;</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="allergy"
							value="${fn:split(member.allergy_ingr, ',') }" />
						<c:forEach var="item" items="${allergy }" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${item}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<div id="join_date">
	회원가입일 : ${member.join_date }<br> 정보수정일 : ${member.change_date }<br>
</div>
<br />
<br />
<br />
<div id="back">
	<input type="button" value="뒤로가기"
		onclick="location.href='/allmemberinfo'" />
</div>