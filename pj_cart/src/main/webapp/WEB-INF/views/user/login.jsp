<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pj_cart login</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/login/fonts/icomoon/style.css">
<link rel="stylesheet" href="../resources/login/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../resources/login/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="../resources/login/css/style.css">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amatic+SC&family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<style type="text/css">
	* {
		font-family: 'Amatic SC', cursive;
		font-family: 'Gowun Batang', serif;
	}
</style>
</head>
<body>

	<div class="d-lg-flex half">
		<div class="bg order-1 order-md-2"
			style="background-image: url('../resources/login/images/pj_cart_login.jpg');"></div>
		<div class="contents order-2 order-md-1">

			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-7">
						<div class="mb-4">
							<h3>Welcome PJ_CART!</h3>
							<p class="mb-4">PJ_CART 쇼핑몰 사이트에 오신것을 환영합니다. 사이트를 이용하기
							위해서는 로그인이 필요합니다.</p>
						</div>
						<form action="/user/loginProc" method="post">
							<div class="form-group first">
								<label for="id">ID</label> <input type="text"
									class="form-control" id="id" name="id">

							</div>
							<div class="form-group last mb-3">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="pwd" name="pwd">

							</div>

							<div class="d-flex mb-5 align-items-center">
								<label class="control control--checkbox mb-0"><span
									class="caption">Remember me</span> <input type="checkbox"
									checked="checked" />
									<div class="control__indicator"></div> </label>
									<span class="ml-auto">
									<a href="/user/signUp" class="forgot-pass">회원가입</a>
									/
									<a href="/user/findPwd" class="forgot-pass">비밀번호 찾기</a>
									</span>
							</div>

							<input type="submit" value="Log In"
								class="btn btn-block btn-primary"> <span
								class="d-block text-center my-4 text-muted">&mdash; or
								&mdash;</span>

							<div class="social-login">
								<a href="#"
									class="google btn d-flex justify-content-center align-items-center">
									<span class="icon-google mr-3"></span> Login with Google
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="../resources/login/js/jquery-3.3.1.min.js"></script>
<script src="../resources/login/js/popper.min.js"></script>
<script src="../resources/login/js/bootstrap.min.js"></script>
<script src="../resources/login/js/main.js"></script>	
</body>
</html>