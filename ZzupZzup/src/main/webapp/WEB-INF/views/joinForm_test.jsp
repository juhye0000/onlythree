<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Font Icon -->
<link rel="stylesheet" href="join/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="join/css/style.css">

<style type="text/css">
table{
	width: 100%;
}
</style>
</head>
<body>
  <!-- Navigation -->
    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="form-container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="register-form">
                            <!-- ID입력 -->
                            <div class="form-group">
                                <p class="join-title">
                                	<label for="member_id">아이디</label>
                                </p>
                                <input type="text" name="member_id" id="member_id" placeholder="Your Id"/>
                            </div>
                            
                            <!-- 이름입력 -->
                            <div class="form-group">
                                <label for="name"> <p>이름</p> </label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            
                            <!-- 비밀번호 입력 -->
                            <div class="form-group join_birthday" >
								<label for="password"> <p>비밀번호</p> </label>
                                <input type="password" name="password" id="password" placeholder="Password"/>
                            </div>
                            
                            <!-- 닉네임 입력  -->
                            <div class="form-group">
                                <label for="nickname"><p>닉네임</p></label>
                                <input type="text" name="nickname" id="nickname" placeholder="Your nickname"/>
                            </div>
                            
                            <!-- 메일입력 -->
                            <div class="form-group">
                                <label for="email"><p>이메일</p></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>

                           <!-- 폰 번호 입력  -->
                            <div class="form-group">
                                <label for="phone"><p>핸드폰번호</p></label>
                                <input type="text" name="phone" id="phone" placeholder="Your Phone number"/>
                            </div>
                            
                            <!-- 생년월일 입력 -->
                            <div class="form-group join_birthday" >
                             	<label for="birth"><p>생년월일</p></label>
                            	<div class="bir_yy">
                            		<span>
                            			<input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                            		</span>
                            	</div>
                            	<div class="bir_mm">
                            		<span class="ps_box">
										<select id="mm" class="sel" aria-label="월">
											<option value="">월</option>
											  	 			<option value="01">
	                                                            1
	                                                        </option>
											  	 			<option value="02">
	                                                            2
	                                                        </option>
											  	 			<option value="03">
	                                                            3
	                                                        </option>
											  	 			<option value="04">
	                                                            4
	                                                        </option>
											  	 			<option value="05">
	                                                            5
	                                                        </option>
											  	 			<option value="06">
	                                                            6
	                                                        </option>
											  	 			<option value="07">
	                                                            7
	                                                        </option>
											  	 			<option value="08">
	                                                            8
	                                                        </option>
											  	 			<option value="09">
	                                                            9
	                                                        </option>
											  	 			<option value="10">
	                                                            10
	                                                        </option>
											  	 			<option value="11">
	                                                            11
	                                                        </option>
											  	 			<option value="12">
	                                                            12
	                                                        </option>
										</select>
									</span>
                            	</div>
                            	<div class="bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
									<label for="dd" class="lbl"></label>
								</span>
                            	</div>
                            </div>
                            <!-- 성별 입력 -->
                            <div class="form-group">
	                            <div>
	                                <input type="radio" name="gender" id="gender" value="남">남
	                                <input type="radio" name="gender" id="gender" value="여">여
	                            </div>
                            </div>
							
							<!-- 성별 입력 test-->
                            <div class="form-group">
	                            <table>
	                            	<tr>
										<td>남성</td>
	                            		<td><input type="radio" name="gender" id="gender" value="남"></td>
	                            		<td>여성</td>
	                            		<td><input type="radio" name="gender" id="gender" value="여"></td>
									</tr> 
	                            		
	                            		
	                            </table>
                            </div>
							

                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="회원가입"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="join_login/images/signup-image_old.jpg" alt="sing up image"></figure>
                        <a href="login" class="signup-image-link">이미 회원입니다: 로그인</a>
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