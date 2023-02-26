<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PJ_CART 아이디/비밀번호 찾기</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

<link rel="stylesheet" href="../resources/findPwd/fonts/icomoon/style.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../resources/findPwd/css/bootstrap.min.css">
   
<!-- Style -->
<link rel="stylesheet" href="../resources/findPwd/css/style.css?after">

<!-- JQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amatic+SC&family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

</head>
<body>
	
	<!-- ID/Password 찾기 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">PJ_CART 아이디/비밀번호 찾기</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-6 col-xl-5">
					<div class="btn-group">
						<button class="button on" onclick="openCity('findId')" id="test11">아이디찾기</button>
						<button class="button"
							onclick="openCity('findPwd')" id="test22">비밀번호찾기</button>
					</div>
					<div class="login-wrap p-4 p-md-5">
						<form action="/user/pwdAuthenticationNumber" class="signup-form" method="post" id="pwdAuthenticationNumber">

							<div class="form-group mb-3" id="findId">
								<label class="label" for="name">이름 </label><br> <input
									type="text" class="form-control" name="name" id="name"
									maxlength="15" required="required"> <label
									class="label" for="email">이메일</label><br> <input
									type="email" class="form-control" name="email" id="email"
									required="required">
							</div>

							<div class="form-group mb-3" id="findPwd" style="display: none;">
								<label class="label" for="password">아이디</label><br> <input
									type="text" class="form-control" name="id" id="id"
									maxlength="15" required="required"> <label
									class="label" for="email">이메일</label><br> <input
									type="email" class="form-control" name="email2" id="email2"
									required="required">
							</div>


							<div class="form-group">
								<input type="button"
									class="form-control btn btn-primary rounded submit px-3"
									value="아이디 찾기" onclick="findIdOrPwd()" id="btn_submit">
							</div>
						</form>
						<p>
							I'm already a member! <a href="/user/login">Login</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">아이디 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><span class="icon-close2"></span></span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						<span style="margin-left: 40px;">아이디</span> <input value="" id="userId" style="border: none; outline: none; margin-left: 230px; width: 134px;">
					</p>
				</div>
			</div>
		</div>
	</div>

<script src="../resources/findPwd/js/jquery-3.3.1.min.js"></script>
<script src="../resources/findPwd/js/popper.min.js"></script>
<script src="../resources/findPwd/js/bootstrap.min.js"></script>
<script src="../resources/findPwd/js/main.js"></script>	
<script src="../resources/findPwd/js/findPwd/findPwd.js"></script>	
</body>
</html>