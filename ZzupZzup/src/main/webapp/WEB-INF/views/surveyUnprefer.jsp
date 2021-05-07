<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" shrink-to-fit=no">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="">
    
    <title>DR.Zzup</title>
	
	<!-- 배재현 수정 -->
  	<link href="login/css/style_jh.css" rel="stylesheet">
	
	<!-- Bootstrap core CSS -->
  	<link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
  	<link href="index/css/modern-business.css" rel="stylesheet">
	
    <!-- Font Icon -->
    <link rel="stylesheet" href="login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="login/css/style.css">
    
<!-- <script src="/join_login/js/test.js"></script>  
<script src="/join_login/js/common.js"></script> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
    $(function(){
	    $('#addBtn').click(function() {
    	var num = $('#preferIngre').children().last().attr('id');	//가장 마지막 id값 가져옴
    	num = Number(num);
 		
 		var div = $("<div></div>").attr("id",String(num+1)).attr("class","surveyRow");
		var categorydiv = $("<div></div>").attr("id", "category" + String(num+1)).attr("class","surveyBig");
		var bigh5 = $("<p></p>").text("선호 재료 대분류");
		var select1 = $("<select></select>").attr("id","ingredients_sel"+String(num+1)).attr("class","select");
		select1.append($('#ingredients_sel0').html());
		
		var subcategorydiv = $("<div></div>").attr("id", "subcategory" + String(num+1)).attr("class","surveySmall");
		var smallh5 = $("<p></p>").text("선호 재료 소분류");
		var select2 = $("<select></select>").attr("id","sub_ingredients_sel"+String(num+1)).attr("class","surveySmall_sub").attr("name","surveySmall_sub");
		
		var delbtnbiv = $("<div></div>").attr("id","delBtndiv");
		var delbtn = $("<button></button>").attr("id","delBtn"+String(num+1)).attr("type","button").text("삭제").attr("class","delBtnclass btn btn-light");
		
		categorydiv.append(bigh5);
		categorydiv.append(select1);
		subcategorydiv.append(smallh5);
		subcategorydiv.append(select2);
		delbtnbiv.append(delbtn);
		
		div.append(categorydiv);
		div.append(subcategorydiv);
		div.append(delbtnbiv);
		$('#preferIngre').append(div);
    	});
	    
	    
	    $(document).on("change", ".select", function() {
	        var selid = $(this).attr('id');
    		var selnum = selid.charAt(15); 
			var ingredient_category = $('#'+selid+' option:selected').val();

			$.ajax({
	        	type:"get",
	        	async:false,  
	        	url:"http://localhost:8090/joinForm_ingre_sub",
	        	dataType:"text",
	        	data: {ingredient_category:ingredient_category},
	        	success:function (data,textStatus){
	        		//alert(data);
	        		$('#sub_ingredients_sel'+selnum).empty();
	        		var result = data.replace('[','');
	        	    result = result.replace(']','');
	        	    var list = result.split(',');
	        	    for(var i = 0; i < list.length; i++){
	        	    	var item = list[i].replace('"','');
	        	       	item = item.replace('"','');
	        	       	$('#sub_ingredients_sel'+selnum).append('<option>'+item+'</option>');
	        		}
				},
				error:function(data,textStatus){
	        		alert("에러가 발생했습니다.");
	        	},
	        	complete:function(data,textStatus){
	        	}
	        });  //end ajax	         	
		});	
		
		$(document).on("click", ".delBtnclass", function() {
			$(this).parent().parent().remove();
		});
		
		$(document).on("click", "#cancelBtn", function() {
			window.history.back();
		});
		
		/*
		 $(document).on("click", "#saveBtn", function() {
			var selid_test = $('#preferIngre').children().last().attr('id');
			var num_test = Number(selid_test);
			
			
			var preferIngreList = new Array();
			
			for (var i = 0; i < num_test+1; i++){
				
				//선택된 subingre value 받기
				var subingre = $('#sub_ingredients_sel'+i).val();

				//val를 list에 입력
				preferIngreList.push(subingre);

			}
			
			preferIngreList = preferIngreList.join();
			
			
			$.ajax({
	        	type:"post",
	        	async:false,  
	        	url:"http://localhost:8090/myPreferSave",
	        	dataType:"text",
	        	data: {prefersubIngre:preferIngreList},
	        	success:function (data,textStatus){
	        		alert(data);
	        		
	        	},
				error:function(data,textStatus){
	        		alert("에러가 발생했습니다.");
	        	},
	        	complete:function(data,textStatus){
	        	}
	        });  //end ajax	
		});
		*/
});

</script>
<style type="text/css">
.mypage-banner-div{
	margin-bottom: 3%;
    background-color: #778beb;
    border-radius: 2em;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    margin-right: 0.5em;
    margin-left: 0.5em;
	text-align: center;	
}

.mypage-banner-text{
	font-weight: bold;
    font-size: xx-large;
    color: white;
	display: inline-block;
	margin-top: 2.7em;

}

.mypage-banner-img{
	height: 100%;
    width: 100%;
    padding: 3%;
}
.surveybtn{
	width:100%;
}
.surveybtn-group{
	margin-top: 2em;
}

</style>
</head>
<body>
<div class="form-container">
		<div class="signup-content">
			<div id ="fullform">
				<div class="row mypage-banner-div">
					<div class="col-lg-8 mypage-banner-text">비선호 음식 재료 조사</div>
					<div class="col-lg-4">
		  	 			<img class="mypage-banner-img" src="image/unpreferSurvey.png" alt="preferlist">
		  		 	</div>
				</div>
					<form method="POST" class="register-form" id="register-form" action="./myUnpreferSave">
					<!-- 선호음식1 -->
					<div id ="preferIngre">
						<div id = "0" class="surveyRow"> 
							<div id ="category0" class="surveyBig">
								<p>비선호 재료 대분류</p>
									<select class="select" id="ingredients_sel0" >
										<option>선호음식 선택</option>
										<c:forEach var="ingredients" items="${ingredients}">
											<option><c:out value="${ingredients.ingredient_category}"/></option>
										</c:forEach>
									</select>
							</div>
							<div id ="subcategory0" class="surveySmall">
								<p>비선호 재료 소분류</p>
									<select id="sub_ingredients_sel0" class="surveySmall_sub" name="surveySmall_sub">
											<option selected>없음</option>
									</select>
							</div>
							<div id ="delBtndiv">
								<!-- <button type="button" id ="delBtn0" class ="delBtnclass btn btn-light"> 삭제</button> -->
							</div>
								
						</div>
					</div>
					<div id ="addBtndiv1">
						<div id = "addBtndiv2">
							<button type="button" class="btn btn-dark" id="addBtn"> (+) 재료 추가</button>
						</div>
					</div>
					
				<!-- 제출버튼 -->
						<div class="form-group form-button surveybtn-group">
							<div class="row">
								<div class="col-lg-4 col-sm-3"></div>
								<div class="col-lg-2 col-sm-3"> <button type="button" name="cancelBtn" id="cancelBtn" class="btn btn-light surveybtn" value="취소"> 취소</button>  </div>
								<div class="col-lg-2 col-sm-3"> <button type="submit" name="saveBtn" id="saveBtn" class="btn btn-primary surveybtn" value="저장">저장</button> </div>
								<div class="col-lg-4 col-sm-3"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>





    <!-- JS -->
    
    <!-- Bootstrap core JavaScript -->
  	<script src="index/vendor/jquery/jquery.min.js"></script>
<!--   	<script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    
    <script src="login/vendor/jquery/jquery.min.js"></script>
    <script src="login/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>