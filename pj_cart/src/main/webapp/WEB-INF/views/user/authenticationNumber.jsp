<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PJ_CART 비밀번호 인증코드</title>
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
					<h2 class="heading-section">PJ_CART 비밀번호 인증코드</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-6 col-xl-5">
					<div class="login-wrap p-4 p-md-5">
						<form action="/user/authenticationNumberCheck" class="signup-form" method="post" id="authenticationNumberCheck">
							<input type="hidden" value="${userInfo.id}" name="id" id="id">
							<input type="hidden" value="${userInfo.email}" name="email" id="email">
							<input type="hidden" value="" name="antNumber" id="antNumber">
							<div class="form-group mb-3" id="findId">
								<label class="label" for="antNumber">인증코드 </label><br> <input
									type="text" class="form-control" name="inputAntNumber" id="inputAntNumber"
									maxlength="15" required="required">
							</div>
							
							<div class="form-group">
								<input type="button"
									class="form-control btn btn-primary rounded submit px-3"
									value="인증코드 전송" onclick="antNumberCheck()" id="btn_antNumber">
							</div>
							
							<div class="form-group">
								<input type="button"
									class="form-control btn btn-primary rounded submit px-3"
									value="확인" onclick="antNumberSuccess()" id="btn_submit">
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
	
	<div id="loading" style="margin-left: 0px; display: none;">
	    <img src="../resources/signUp/images/signUp_loading.gif">
	    <p>인증번호를 보내는 중 입니다.</p>
	</div>

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
	
	var antNumber;
	
	function antNumberCheck(){
		document.querySelector("#btn_antNumber").setAttribute("disabled", "true");
		document.getElementById('loading').style.display = '';
		setTimeout(function(){
			$.ajax({
				url: "/user/authenticationNumberProc",
				type: "POST",
				data: {
					"id": id,
					"email": email,
				},
				success: function(data){
					antNumber = data;
					document.querySelector('#btn_antNumber').disabled = false;
					document.getElementById('loading').style.display = 'none';
				}
			})
		}, 0);
		
	}
	
	function antNumberSuccess(){
		var inputAntNumber = $("#inputAntNumber").val();
		
		if(inputAntNumber == antNumber){
			alert("인증되었습니다.");
			document.getElementById('authenticationNumberCheck').submit();
		} else {
			alert("인증코드가 다릅니다. 다시 입력해주세요.");
			document.getElementById('inputAntNumber').focus();
		}
	}
</script>
</body>
</html>