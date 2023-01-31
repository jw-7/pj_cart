	var userId = document.getElementById('userId').value;
	if(userId == "" || userId == null){
		location.href="/login";
	}
	
	function fn_resendMail(){
		document.querySelector("#btn_resendMail").setAttribute("disabled", "true");
		$.ajax({
			url : "/user/resend-mail",
			type : "POST",
			dataType : "JSON",
			data :{"id" : userId},
			success : function(data) {
				if(data == 1){
					alert("메일이 재전송되었습니다.");				
				} else {
					alert("메일 재전송이 실패하였습니다.");
					document.querySelector("#btn_resendMail").setAttribute("disabled", "false");
					return false;
				}
				
			}
		});
	}