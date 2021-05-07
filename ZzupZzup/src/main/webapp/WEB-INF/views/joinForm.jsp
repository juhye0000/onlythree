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

<style type="text/css">
.form-gender{
	margin-left: 10%;
    width: 90%;
    height: 36px;
    border: none;
}

/* 유효성 검사 문구 */
.final_id_ck{
    display: none;
}
.final_pw_ck{
    display: none;
}
.final_pwck_ck{
    display: none;
}
 
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : green;
        display : none;    
}
.pwck_input_re_2{
        color : red;
        display : none;    
} 

.final_name_ck{
    display: none;
}
.final_nickname_ck{
    display: none;
}
.final_mail_ck{
    display: none;
}
.final_phone_ck{
    display: none;
}
.final_birth_ck{
    display: none;
}
.final_gender_ck{
    display: none;
}
</style>

<script>

		/* 유효성 검사 통과 유무 변수 */
		 var idCheck = false;            	// 아이디
		 var pwCheck = false;            	// 비번
		 var pwckCheck = false;            	// 비번 확인
		 var pwckcorCheck = false;        	// 비번 확인 일치 확인
		 var nameCheck = false;        		// 닉네임
		 var nicknameCheck = false;         // 닉네임
		 var emailCheck = false;            // 이메일
		 var phoneCheck = false;            // 폰번호
		 var birthCheck = false;            // 출생년도
		 var genderCheck = false;           // 성별
     
$(document).ready(function(){
	$(".form-submit").click(function(){

     	/* 입력값 변수 */
     	var id = $('#member_id').val();                 // id 입력란
        var pw = $('#password').val();                	// 비밀번호 입력란
        var pwck = $('#passwordcheck').val();			// 비밀번호 확인 입력란
        var name = $('#name').val();            		// 이름 입력란
	 	var nickname = $('#nickname').val();            	// 닉네임 입력란
		var email = $('#email').val();            		// 메일 입력란
	 	var phone = $('#phone').val();            		// 폰번호 입력란
	 	var birth = $('#birthyear').val();            	// 출생년도 입력란
	 	var gender = $('#gender').val();            	// 성별 입력란
	
		/* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
		/* 비밀번호 유효성 검사 빈칸인지+비밀번호 규칙에 맞는지 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
				if(pw.length < 8 || pw.length > 20){
					alert("8자리 ~ 20자리 이내로 입력해주세요.");
				  	return false;
				}else if(pw.search(/\s/) != -1){
					alert("비밀번호는 공백 없이 입력해주세요.");
					return false;
				}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
					alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
					return false;
				}else {
					console.log("통과");	 
				}
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
		/* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 닉네임 유효성 검사 */
        if(nickname == ""){
            $('.final_nickname_ck').css('display','block');
            nicknameCheck = false;
        }else{
            $('.final_nickname_ck').css('display', 'none');
            nicknameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(email == ""){
            $('.final_mail_ck').css('display','block');
            emailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            emailCheck = true;
        }
        
        /* 폰번호 유효성 검사 */
        if(phone == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
        }  
        /* 출생년도 유효성 검사 */
        if(birth == ""){
            $('.final_birth_ck').css('display','block');
            birthCheck = false;
        }else{
            $('.final_birth_ck').css('display', 'none');
            birthCheck = true;
        } 
        /* 성별 유효성 검사 */
        if(gender == ""){
            $('.final_gender_ck').css('display','block');
            genderCheck = false;
        }else{
            $('.final_gender_ck').css('display', 'none');
            genderCheck = true;
        }
        

        
		/* 최종 유효성 검사 */
        if(idCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&nicknameCheck&&emailCheck&&phoneCheck&&birthCheck&&genderCheck ){
 			$("#register-form").attr("action", "./join");
            $("#register-form").submit();   
        }
        return false;
	
	
	});
	        /* 비밀번호 확인 일치 유효성 검사  */
		$('#passwordcheck').on("propertychange change keyup paste", function(){
			var pw = $('#password').val();
			var pwck = $('#passwordcheck').val();
			$('.final_pwck_ck').css('display', 'none');
					    
			if(pw == pwck){
				$('.pwck_input_re_1').css('display','block');
				$('.pwck_input_re_2').css('display','none');
				pwckcorCheck = true;
			}else{
				$('.pwck_input_re_1').css('display','none');
				$('.pwck_input_re_2').css('display','block');
				pwckcorCheck = false;
			} 
		}); 
	
});

/*	function chkPW(){

		var pw = $("#password").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 10 || pw.length > 20){
			alert("10자리 ~ 20자리 이내로 입력해주세요.");
		  	return false;
		}else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			return false;
		}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			return false;
		}else {
			console.log("통과");	 
		}
	}
*/ 

     
     
	/* 제출할때 빈 값 있는지 확인*/
	/*function formTest7(){
		if(!document.testForm.member_id.value){
			alert("아이디를 입력하세요");
			document.testForm.title.focus(); //문제가 발생한 객체인 'member_id'에 포커스를 설정=>쉽게 수정할 수 있도록 배려
			return false; //문제가 발생시 formTest7()함수는 여기서 끝냄. 이벤트가 발생한 곳으로 복귀
   		}
		if(!document.testForm.name.value){
			alert("이름을 입력하세요");  //메시지 표시
		    document.testForm.name.focus();  
		    return false;    
   		}
		if(!document.testForm.password.value){
			alert("비밀번호를 입력하세요");  //메시지 표시
		    document.testForm.password.focus();  
		    return false;    
   		}
		if(!document.testForm.nickname.value){
			alert("닉네임을 입력하세요");  //메시지 표시
		    document.testForm.nickname.focus();  
		    return false;    
   		}
		if(!document.testForm.email.value){
			alert("이메일을 입력하세요");  //메시지 표시
		    document.testForm.email.focus();  
		    return false;    
   		}
		if(!document.testForm.phone.value){
			alert("핸드폰번호를 입력하세요");  //메시지 표시
		    document.testForm.phone.focus();  
		    return false;    
   		}
   		if(!document.testForm.birthyear.value){
			alert("출생년도를 입력하세요");  //메시지 표시
		    document.testForm.birthyear.focus();  
		    return false;    
   		}
		if(!document.testForm.gender.value){
			alert("성별을 입력하세요");  //메시지 표시
		    document.testForm.gender.focus();  
		    return false;    
   		}
	}
*/

</script>
</head>
<body>
    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="form-container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">회원가입</h2>
                        <form method="POST" class="register-form" id="register-form">
                            <!-- ID입력 -->
                            <div class="form-group">
                            	<label for="member_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="member_id" id="member_id" placeholder="아이디 입력"/>
                                <span class="final_id_ck">아이디를 입력해주세요.</span>
                                
                            </div>
							<!-- 비밀번호 입력 -->
                            <div class="form-group join_birthday" >
								<label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="비밀번호 입력"/>
                                <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                            </div>
 							<!-- 비밀번호 확인입력 -->
                            <div class="form-group join_birthday" >
								<label for="passwordcheck"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="passwordcheck" id="passwordcheck" placeholder="비밀번호 확인"/>
                                <span class="final_pwck_ck">비밀번호 일치여부를 확인해주세요.</span>
                                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
								<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                            </div>                            
                            <!-- 이름입력 -->
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account-o"></i></label>
                                <input type="text" name="name" id="name" placeholder="이름 입력"/>
                                <span class="final_name_ck">이름을 입력해주세요.</span>
                            </div>
                           <!-- 닉네임 입력  -->
                            <div class="form-group">
                                <label for="nickname"><i class="zmdi zmdi-account-add"></i></label>
                                <input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"/> <!-- onclick="chkPW()" -->
                                <span class="final_nickname_ck">닉네임을 입력해주세요.</span>
                            </div>
                            
                            <!-- 메일입력 -->
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                                <span class="final_mail_ck">이메일을 입력해주세요.</span>
                            </div>

                           <!-- 폰 번호 입력  -->
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="Your Phone number"/>
                                <span class="final_phone_ck">핸드폰번호를 입력해주세요</span>
                            </div>
                            
                            <!-- 생년월일 입력 -->
                            <div class="form-group join_birthday" >
                             	<label for="birth"><i class="zmdi zmdi-calendar"></i></label>
                             	<input type="number" name="birthyear" id="birthyear" placeholder="출생년도(4자)" maxlength="4"/>
                             	<span class="final_birth_ck">출생년도(4자)를 입력해주세요.</span>

                            </div>
                           					
							<!-- 성별 입력 -->
                            <div class="form-group">
                           		<label for="birth"><i class="zmdi zmdi-male-female"></i></label>
                            	<select id="gender" name="gender" class="form-gender">
                                	<option value="" selected="">성별</option>
                                    <option value="M">남자</option>
                                    <option value="F">여자</option>
                                    <option value="U">선택 안함</option>
                            	</select>
                            	<span class="final_gender_ck">성별을 선택해주세요.</span>

                            </div>
							

                            <div class="form-group form-button">
                               <!--  <input type="submit" name="signup" id="signup" class="form-submit" value="회원가입"/> -->
                               <input type="button" name="signup" id="signup" class="form-submit" value="회원가입"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="login/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login" class="signup-image-link">이미 회원입니다: 로그인</a>
                    </div>
                </div>
            </div>
        </section>
		
       

    </div>

    <!-- JS -->
    <script src="login/vendor/jquery/jquery.min.js"></script>
    <script src="login/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>