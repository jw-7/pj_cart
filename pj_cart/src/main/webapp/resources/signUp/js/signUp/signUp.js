function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("addr").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            $('#detailAddr').attr("readonly", false);
	            document.getElementById("detailAddr").focus();
	        }
	    }).open();
	}
	
	var idCheckResult = 0; // id 중복검사 체크를 했는지 유무
	
	// 중복아이디 체크
	function fn_idCk() {
		var idVal = $("[name=id]").val();
		var idPattern = /^[A-za-z0-9]{5,15}/g;
		
		if(idVal != "" && idVal != null){
			if(idPattern.test(idVal)){
				$.ajax({
					url : "/user/dupIdCk",
					type : "POST",
					dataType : "JSON",
					data :{"id" : idVal},
					success : function(data) {
						if(data == 1) {
							alert("이미 사용중인 아이디입니다.")
							$("[name=id]").focus()
							return false;
						} else if(data == 0){
							alert("사용가능한 아이디입니다.")
							idCheckResult = 1;
							$("[name=id]").attr("readonly",true);
						}
					}
				})
			} else {
				alert("아이디는 5 ~ 15길이의 영문자 또는 숫자로 시작하는 ID이어야 됩니다.");
				$("[name=id]").focus();
			}
			
		} else {
			alert("아이디를 입력해주세요.");
			$("[name=id]").focus();
		}
		
	}
	
	$(document).ready(function(){
		// 비밀번호 알림
		$('#pwd2').keyup(function(){			
			var pwd1 = $('[name=pwd]').val();
			var pwd2 = $('[name=pwd2]').val();
			var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;			
						
			if(pwd1 != "" || pwd2 != ""){				
				if(!pwPattern.test(pwd1)) {
					$('#pwdCk').html("영문,숫자,특수문자를 포함해서 8~15자리로 입력해주세요.");
					$('#pwdCk').attr("color","red");
				} else if(pwd1 == pwd2){
					$('#pwdCk').html("일치");
					$('#pwdCk').attr("color","green");
				} else {
					$('#pwdCk').html("불일치");
					$('#pwdCk').attr("color","red");
				}
			}			
		})
		
		// 이메일 알림
		$('[name=email]').focusout(function(){
			var emailValue = $('[name=email]').val(); 
			var emailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			if(emailValue != "" && emailValue != null){
				if(emailPattern.test(emailValue)){
					$.ajax({
						url : "/user/dupEmailCk",
						type : "POST",
						dataType : "JSON",
						data :{"email" : emailValue},
						success : function(data) {
							if(data == 1){
								$('#emailCk').html("이미 존재하는 이메일입니다.");
								$('#emailCk').attr("color","red");
							} else {
								$('#emailCk').html("사용 가능한 이메일입니다.");
								$('#emailCk').attr("color","green");
							}			
						}
					})
				} else {
					$('#emailCk').html("이메일형식이 아닙니다.");
					$('#emailCk').attr("color","red");
				}
				
			}			
		})	
	});	
	function signUpProc(){
		var id = document.getElementsByName("id")[0];
		var pw1 = document.getElementsByName("pwd")[0];
		var pw2 = document.getElementsByName("pwd2")[0];
		var name = document.getElementsByName("name")[0];
		var email = document.getElementsByName("email")[0];
		var tel = document.getElementsByName("tel")[0];
		var postcode = document.getElementsByName("postcode")[0];
		var addr = document.getElementsByName("addr")[0];
		var detailAddr = document.getElementsByName("detailAddr")[0];
		
		// 아이디,비밀번호,이메일 정규식
		var idPattern = /^[A-za-z0-9]{5,15}/g;
		var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
		var emailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var telPattern = /^\d{3}\d{3,4}\d{4}$/;
		
		// submit전 유효성체크(아이디)
		if(id.value == "" || id.value == null){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		
		if(!idPattern.test(id.value)){
			alert("아이디는 5 ~ 15길이의 영문자 또는 숫자로 시작하는 ID이어야 됩니다.");
			id.focus();
			return false;
		}
		 
		if(idCheckResult == 0){
			alert("아이디 중복확인을 확인해주세요.");
			id.focus();
			return false;
		}
		
		// submit전 유효성체크(비밀번호)
		if(pw1.value == "" || pw1.value == null){
			alert("비밀번호를 입력하세요.");
			pw1.focus();
			return false;
		}
		
		if(!pwPattern.test(pw1.value)){
			alert("영문,숫자,특수문자를 포함해서 8~15자리로 입력해주세요.");
			pw1.focus();
			return false;
		}
		
		if(pw1.value != pw2.value){
			alert("비밀번호를 확인하세요.");
			pw2.focus();
			return false;
		}
		
		// submit전 유효성체크(이름)
		if(name.value == "" || name.value == null){
			alert("이름을 입력하세요.");
			name.focus();
			return false;
		}
		
		// submit전 유효성체크(이메일)
		if(email.value == "" || email.value == null){
			alert("이메일을 입력하세요.");
			email.focus();
			return false;
		}
		
		if(!emailPattern.test(email.value)){
			alert("이메일형식이 아닙니다.");
			email.focus();
			return false;
		}
		
		if(document.getElementById("emailCk").color == "red"){
			alert("이미 가입된 이메일입니다.");
			email.focus();
			return false;
		}
		
		if(tel.value == "" || tel.value == null){
			alert("전화번호를 입력하세요.");
			tel.focus();
			return false;
		}
		
		if(!telPattern.test(tel.value)){
			alert("전화번호 형식이 아닙니다.");
			tel.focus();
			return false;
		}
		
		if(postcode.value == "" || postcode.value == null){
			alert("우편번호를 입력하세요.");
			return false;
		}	
			
		document.signUpForm.submit();
		document.querySelector("#btn_submit").setAttribute("disabled", "true");
		
	}