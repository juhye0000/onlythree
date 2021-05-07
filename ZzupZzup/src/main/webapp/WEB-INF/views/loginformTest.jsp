<%@ page language="java" contentType="text/html; charset=UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<!-- 
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  Bootstrap core CSS
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  Custom styles for this template
  <link href="css/modern-business.css" rel="stylesheet">

</head> -->

<body>

 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">login
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item"></li>
    </ol>

    <!-- Project One -->
    <div class="row">
      <div class="col-md-7">
      	<img class="img-fluid rounded mb-3 mb-md-0" src="join_login/images/signin-image.jpg" alt="sing up image">
      </div>
      <div class="col-md-5">
				<div class="signin-form">
					<h2 class="form-title">로그인</h2>
					<form action="./login" method="post" id="login"
						class="register-form">

						<div class="form-group">
							<label for="your_name"><i
								class="zmdi zmdi-account material-icons-name"></i></label>
							<!-- <input type="text" name="your_name" id="your_name" placeholder="Your Name"/> -->
							<input type="text" name="id" id="id" placeholder="Your Name" />
						</div>
						<div class="form-group">
							<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
								type="password" name="password" id="password"
								placeholder="Password" />
						</div>
						<div class="form-group form-button">
							<input type="submit" name="login" id="login" class="form-submit"
								value="login" />
						</div>

					</form>
					<a href="join" class="signup-image-link">회원가입</a>
				</div>

				<!--         <h3>Project One</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
        <a class="btn btn-primary" href="#">View Project
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a> -->
      </div>
    </div>
  </div>
  <!-- /.container -->



  <!-- Bootstrap core JavaScript -->
  <script src="index/vendor/jquery/jquery.min.js"></script>
  <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
