<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Font Icon -->
    <link rel="stylesheet" href="login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="login/css/style.css">
    
    
</head>
<body>
    <div class="main">
       <!-- Sign up form -->
        <section class="signup">
            <div class="form-container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">회원가입 완료!</h2>
                        <a>
                        	음식 선호도 조사를 통해 개인맞춤형 추천을 받을 수 있습니다!
                        </a>

						<div class="form-group form-button">
						<!-- 로그인 안되어있으면 로그인페이지로 이동  -->
						<!-- 로그인 되어있으면 선호도 조사페이지로 이동  -->
						<c:choose>
							<c:when test="${sessionScope.id == null }">
								<a href="login_ingre"><input type="submit" name="prev" id="prev" class="form-submit" value="로그인 후 선호도 조사하기" /></a>
							</c:when>
							<c:otherwise>
								<a href="myPreferList"><input type="submit" name="prev" id="prev" class="form-submit" value="선호도 조사하기" /></a>
							</c:otherwise>
						</c:choose>
						<a href="index"><input type="submit" name="Next" id="Next" class="form-submit" value="다음에 하기" /></a>
						</div>
					</div>
                    <div class="signup-image">
                        <figure><img src="login/images/signup-image_old.jpg" alt="sing up image"></figure>
                        
                    </div>
                </div>
            </div>
        </section>

       

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>