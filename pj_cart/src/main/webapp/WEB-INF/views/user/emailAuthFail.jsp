<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PJ_CART 메일인증 필요</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/signUp/fonts/icomoon/style.css">
<link rel="stylesheet" href="../resources/signUp/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../resources/signUp/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="../resources/signUp/css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

<section class="ftco-section" style="background-image: url('../resources/signUp/images/wintercom_signUp.jpg')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">PJ_CART 메일인증 확인</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-7 col-lg-6 col-xl-5">
				<div class="login-wrap p-4 p-md-5">
					<input type="hidden" value="${user.id}" id="userId">
		     		<h3 class="text-center mb-4">${user.id}님의 계정은 메일인증이 필요합니다.</h3>
						
			        <p>등록된 메일에서 메일인증을 해주세요.<br>		
					   메일전송 실패 시 다시 인증메일을 재전송하여 확인 부탁드립니다.<br><br>	
					<button onclick="fn_resendMail()" class="btn btn-primary" id="btn_resendMail">메일 재전송</button><br><br>
			        <a data-toggle="tab" href="/user/login">Login</a></p>
	       	   </div>
			</div>
		</div>
	</div>
</section>

<script src="../resources/signUp/js/jquery-3.3.1.min.js"></script>
<script src="../resources/signUp/js/popper.min.js"></script>
<script src="../resources/signUp/js/bootstrap.min.js"></script>
<script src="../resources/signUp/js/main.js"></script>
<script src="../resources/signUp/js/emailAuth/emailAuthFail.js"></script>
</body>
</html>