function openCity(cityName) {
	  $('button').removeClass("on");
	  var i;
	  var x = document.getElementsByClassName("form-group mb-3");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  document.getElementById(cityName).style.display = "block";
	  if(cityName == "findId"){
		  $('#test11').addClass("on");
		  document.getElementById('btn_submit').value = "아이디찾기";
		  document.getElementById('id').value = null;
		  document.getElementById('email2').value = null;
	  } else {
		  $('#test22').addClass("on");
		  document.getElementById('btn_submit').value = "비밀번호찾기";
		  document.getElementById('name').value = null;
		  document.getElementById('email').value = null;
	  }
	  
	  
	}

function findIdOrPwd(){
	$.ajax({
		url: "/user/findIdOrPwd",
		type: "POST",
		dataType: "JSON",
		data: {
			"name": $("#name").val(),
			"email": $("#email").val(),
			"id": $("#id").val(),
			"email2": $("#email2").val()
		},
		success: function(data){
			if(data == 1){
			    $.ajax({
					url: "/user/findIdSearch",
					type: "POST",
					dataType: "JSON",
					data: {
						"name": $("#name").val(),
						"email": $("#email").val()
					},
					success: function(data){
						$("#exampleModalCenter").modal('show');
						$("#userId").val(data);
					}
				})
			} else if(data == 2){
				abc();
			} else {
				alert("존재하지 않는 아이디입니다.");
				return false;
			}
		}
	})
	
}

function abc(){
	$('#pwdAuthenticationNumber').submit();
}