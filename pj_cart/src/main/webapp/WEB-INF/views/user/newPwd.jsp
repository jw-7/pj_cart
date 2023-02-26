<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PJ_CART 새 비밀번호 설정</title>
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
	<section class="ftco-section" id="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">PJ_CART 새 비밀번호 설정</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-6 col-xl-5">
					<div class="login-wrap p-4 p-md-5">
						<form action="/user/newPwdProc2" class="signup-form" method="post" id="newPwdCheck">
						<input type="hidden" name="id" id="id" value="${userInfo.id}">
						<input type="hidden" name="email" id="email" value="${userInfo.email}">
							<div class="form-group mb-3" id="findId">
								<label class="label" for="pwd">새 비밀번호 </label><br> <input
									type="password" class="form-control" name="pwd" id="pwd"
									maxlength="15" required="required">
							</div>
							
							<div class="form-group mb-3" id="findId">
								<label class="label" for="pwdCheck">새 비밀번호 확인 </label><br> <input
									type="password" class="form-control" name="pwdCheck" id="pwdCheck"
									maxlength="15" required="required">
							</div>
							
							<div class="form-group">
								<input type="button"
									class="form-control btn btn-primary rounded submit px-3"
									value="변경" onclick="newPwdSuccess()" id="btn_newPwd">
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

<script src="../resources/findPwd/js/jquery-3.3.1.min.js"></script>
<script src="../resources/findPwd/js/popper.min.js"></script>
<script src="../resources/findPwd/js/bootstrap.min.js"></script>
<script src="../resources/findPwd/js/main.js"></script>		

<script type="text/javascript">
	var id = document.getElementById("id").value;
	var email = document.getElementById("email").value;
	
	if((id == "" || id == null) && (email == "" || email == null)) {
		alert("잘못된 접근입니다.");
		document.getElementById("ftco-section").style.display ='none';
		location.href = "/user/findPwd";
	}
	
	function newPwdSuccess() {
		var pwd = $("#pwd").val();
		var pwdCheck = $("#pwdCheck").val();
		var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
		
		if(pwd == "" || pwd == null){
			alert("비밀번호를 입력하세요.");
			document.getElementById("pwd").focus();
			return false;
		}
		
		if(!pwPattern.test(pwd)){
			alert("영문,숫자,특수문자를 포함해서 8~15자리로 입력해주세요.");
			document.getElementById("pwd").focus();
			return false;
		}
		
		if(pwd != pwdCheck){
			alert("비밀번호를 확인하세요.");
			document.getElementById("pwdCheck").focus();
			return false;
		}
		
		updatePwd();
		
	}
	
	function updatePwd(){
		$.ajax({
			url: "/user/newPwdProc",
			type: "POST",
			dataType: "JSON",
			data: {
				"id": $("#id").val(),
				"email": $("#email").val(),
				"pwd": $("#pwd").val()
			},
			success: function(data){
				if(data == 1){
					alert("비밀번호가 변경되었습니다.");
					location.href = "/user/login";
				} else {
					alert("기존 비밀번호와 동일합니다. 다른 비밀번호를 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
			}
		})
	}
	
</script>
</body>
</html>