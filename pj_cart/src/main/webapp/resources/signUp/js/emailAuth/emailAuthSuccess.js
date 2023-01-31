	var result = document.getElementById('result').value;
	if(result == 1){
		alert("이메일 인증이 완료되었습니다.");
		location.href="/user/login";		
	} else {
		alert("이메일 인증이 실패하였습니다. 다시 메일인증을 해주세요.");
		location.href="/user/login";
	}
	