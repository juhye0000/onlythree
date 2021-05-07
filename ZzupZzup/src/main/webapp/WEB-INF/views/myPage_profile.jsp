<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.onlythree.vo.Member"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>
  <!-- 배재현 수정 -->
  <link href="join_login/css/style_jh.css" rel="stylesheet">
  
  <!-- Bootstrap core CSS -->
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="index/css/modern-business.css" rel="stylesheet">
  
  

  
<style>
.profileBody{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    /* background-color: #e2e8f0;   */  
}
.profile-main-body {
    padding: 15px;
}
.profile-card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.profile-card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.profile-card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.profile-gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.profile-gutters-sm>.col, .profile-gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}

.profile-title {
	text-align:center;
	font-weight:bold;
}

#button-outer{
	text-align:center;
}
#button-center{
	  display:inline-block;
}

</style>
</head>

<body>

<div class="container">
	<div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">회원 아이디</h6></div>
    	<div class="col-sm-6 mt-2">${memberID}</div>
    	<!-- <div class="col-sm-3"> <input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"> </div> -->
    </div>
    <hr>
	<div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">회원 이름</h6></div>
    	<div class="col-sm-6 mt-2">${memberName} </div>
    	<!-- <div class="col-sm-3"> <input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"> </div> -->
    </div>
	<hr>
    <div class="row">
    	<div class="col-sm-3"><h6 class="mt-2 profile-title">별명</h6></div>
		<div class="col-sm-6 mt-2"> ${memberNickname}</div>
		<!-- <div class="col-sm-3"><input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"></div> -->
    </div>
    <hr>
    <div class="row">
		<div class="col-sm-3"> <h6 class="mt-2 profile-title">이메일</h6></div>
        <div class="col-sm-6 mt-2"> ${memberEmail} </div>
        <!-- <div class="col-sm-3"><input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"></div> -->
    </div>
    <hr>
    <div class="row">
    	<div class="col-sm-3"><h6 class="mt-2 profile-title">휴대전화</h6></div>
		<div class="col-sm-6 mt-2">${memberPhone}</div>
		<!-- <div class="col-sm-3"><input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"></div> -->
	</div>
    <hr>
    <div class="row">
		<div class="col-sm-3"><h6 class="mt-2 profile-title">출생년도</h6></div>
        <div class="col-sm-6 mt-2"> ${memberAge}</div>
        <!-- <div class="col-sm-3"><input class="btn btn-light btn-sm" type="button" onclick="location.href='#'" value="수정"></div> -->
    </div>
    <hr>


<div id="button-outer">
	<div id ="button-center">
		<input type="button" value="회원정보 수정" onclick="location.href='/myProfile_update'" class="btn btn-primary">
	</div>
</div>


</div>



  <!-- Bootstrap core JavaScript -->
  <script src="index/vendor/jquery/jquery.min.js"></script>
<!--   <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
