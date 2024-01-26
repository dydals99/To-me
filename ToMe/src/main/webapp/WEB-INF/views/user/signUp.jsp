<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<head>
<meta charset="UTF-8">
<title>join</title>
<style>
body {
	font-family: dotum, sans-serif;
}
input {
	width: 450px;
	height: 60px;
}

.input-group {
	width: 450px;
	margin-bottom: 30px;
}
.checkbox_group {
	padding-top: 20px;
	border-top: solid 1px lightgray; 
	width: 450px;
	margin-bottom: 30px;
}
.contents{
	margin-top: 30px;
	padding-top: 20px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}
table {
font-size: 12px;


</style>
</head>

<body>
	<script>

		var isEmailDuplicated = null;

		function validateAllFields() {
			if (isEmailDuplicated != false) {
				alert("이메일 입력이 잘못되었습니다.");
				return false;
			} 

			var isEmailValid = validateEmail();
			var isPasswordValid = validatePassword();
			var isPasswordCheckValid = validatePasswordCheck();
			var isNameValid = validateName();
			var isPhoneNumberValid = validatePhoneNumber();
			var isJuminNumValid = validateJuminNum();
			var isCheckboxValid = validateCheckbox();
			var validationResults = [isEmailValid, isPasswordValid, isPasswordValid, isNameValid, isPhoneNumberValid, isJuminNumValid, isCheckboxValid];
			
			if(validationResults.includes(false)) {
				alert("정보입력이 잘못되었습니다.");
			
				return false;
			}
			alert("회원가입이 완료되었습니다.");
	
		} 
	
		$(function initialize() {
			$('#email').focusout(function() {
				checkEmailDuplication();
				validateEmail();
			});

			$('#password').bind("keyup focusout",function() {
				validatePassword();
			});

			$('#password_check').bind("keyup focusout",function() {
				validatePasswordCheck();
			});

			$('#name').focusout(function() {
				validateName();
			});

			$('#phone_number').focusout(function() {
				validatePhoneNumber();
			});

			$('#jumin_num').focusout(function() {
				validateJuminNum();
			});
			$('input:checkbox[name="must"]:checked').each(function() {
				validateCheckbox();	
			});
		
		});

		function validateEmail() {
			var email = $("#email").val();

			if(email == "") {
				$("emailgo").show();
				$('#emailgo').text('이메일을 입력하세요.').css('color', 'red');
				emailCheck = false;
				
				return false;
			}

			return true;
		}

		function checkEmailDuplication() {
			var email = $("#email").val();

			if(email == "") { 
				return false; 
		
			}
			$("#emailgo").hide(); 
			$.ajax({
				url : "/checkemail",
				type : "post",
				data : {
					email : $('#email').val()
				},
				dataType : 'json',
				success : function (result) {
					if (result == 0) {
						$("#search").hide();
						$('#emailgo1').hide();
					
						isEmailDuplicated = false;
					} else {
						$("#search").show();
						$("emailgo1").show();
						$('#emailgo1').text('이미 가입된 이메일 주소입니다. 다른 이메일을 입력하여 주세요.')
						.css('color', 'red');
						$('#input-id').css("margin-bottom","5px");
					
						isEmailDuplicated = true;
					}	
				}
			});
			
		}

		function validatePassword() {
			var pw = $("#password").val();

			var SamePass_0 = 0; 
			var SamePass_1 = 0; 
			var SamePass_2 = 0; 

			for (var i = 0; i < pw.length; i++) {
				var chr_pass_0 = pw.charAt(i);
				var chr_pass_1 = pw.charAt(i + 1);

				if (chr_pass_0 == chr_pass_1) {
					SamePass_0 = SamePass_0 + 1
				}

				var chr_pass_2 = pw.charAt(i + 2);

				if (chr_pass_0.charCodeAt(0)
					- chr_pass_1.charCodeAt(0) == 1
					&& chr_pass_1.charCodeAt(0)
					- chr_pass_2.charCodeAt(0) == 1) {
					SamePass_1 = SamePass_1 + 1
				}

				if (chr_pass_0.charCodeAt(0)
					- chr_pass_1.charCodeAt(0) == -1
					&& chr_pass_1.charCodeAt(0)
					- chr_pass_2.charCodeAt(0) == -1) {
					SamePass_2 = SamePass_2 + 1
				}
			}
		
			if ((SamePass_0 < 1)
				&& (SamePass_1 < 1 && SamePass_2 < 1)) {
				$('#password_ck3').hide();
			
			} else {
				$('#password_ck3').show();
				$('#password_ck3').text('X 3개 이상 연속되거나 동일한 문자/숫자 제외').css('color', 'red');
				
				return false;
			}

			var strUpper = false, strLower = false, strNumber = false;

		
			
			for (var i = 0; i < pw.length; i++) {
				
				if (pw[i].charCodeAt(0) >= 65 && pw[i].charCodeAt(0) <= 90) {
					strUpper = true;
				}
				
			
				if (pw[i].charCodeAt(0) >= 97 && pw[i].charCodeAt(0) <= 122) {
					strLower = true;
				}

				if (pw[i].charCodeAt(0) >= 48 && pw[i].charCodeAt(0) <= 57) {
					strNumber = true;
				}
			}
			if ((pw.length >= 8 && pw.length < 20)
				&& (strUpper == true)
				&& (strLower == true)
				&& (strNumber == true)) {
				$('#password_ck5').hide();
			} else {
				$('#password_ck5').text('X 영문/숫자/대소문자 3가지 이상 조합 (8~20자)').css('color', 'red');
				return false;
			}
			if (pw != "") {
				$("#password_ck4").hide();
			
				if (pw == $("#email").val()) {
					$('#password_ck1').html('X 아이디(이메일) 제외').css('color', 'red');
				
					return false;
				}
				else{
					$("#password_ck1").hide();
				}
			} else {
				$("#password_ck4").show();
				$('#password_ck4').text('비밀번호를 입력하세요.').css('color', 'red');
				return false;
			}
			return true;
			
		}
		function validatePasswordCheck() {
			var p1 = $('#password').val();
			var p2 = $('#password_check').val();

			if (p2 != "") {
				$("#password_checkgo").hide();
			
				if (p1 == p2) {
					$('#passConfirm').html('패스워드가 일치합니다.').css('color',
						'green');
					
				} else {
					$('#passConfirm').html('패스워드가 틀렸습니다.').css('color',
						'red');
					return false;
				}
			} else {
				$("#password_checkgo").show();
				$("#password_checkgo").text('비밀번호를 확인하세요.').css(
					'color', 'red');
		
				return false;
			}
			return true;
		}
		function validateName() {
			var name = $('#name').val();
			strNumber = false;

			for (var i = 0; i < name.length; i++) {

				if (name[i].charCodeAt(0) >= 48
					&& name[i].charCodeAt(0) <= 57) {
					strNumber = true;
				}
			}	

			if(name != ""){
				$("#name_ck").hide();

				if(strNumber == true){
					$("#name_ck1").show();
					$('#name_ck1').text('정확한 이름을 입력하세요.(숫자입력됨)').css('color', 'red');
					return false;		
					
				} else {
					$("#name_ck1").hide();
				}
			} else if(name == "") {	
				$("#name_ck").show();
				$('#name_ck').text('이름을 입력하세요.').css('color', 'red');

				return false;	
			}
			return true;
		}
	</script>
	<div class="container d-flex justify-content-center">

		<form action="signUp_act" name="registForm" method="post" onsubmit="return validateAllFields();">
			<div class="container d-flex justify-content-center">
				<h1>Sign Up</h1>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6">
						<!-- 정보 입력 -->
						<div class="input-group" id="input-id">
							<span class="input-group-text"><i class="bi bi-envelope"></i></span>
							<input type="text" name="email" id="email" class="form-control"
								placeholder="아이디(이메일)"  maxLength=50 />
						</div>
						<span style="font-size: 14px;" id="text"></span>
						<div class="mb-2 ms-4" style="display: none" id="search">
							<button class="hidden-btn" onclick="location.href='/login'">
								<span class="hidden-text">로그인</span>
							</button>
							<button class="hidden-btn">
								<span class="hidden-text">비밀번호 찾기</span>
							</button>
						</div>
						<div id="emailgo"></div>
						<div id="emailgo1"></div>
						<div style="padding-left: 20px;"></div>
	
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
							<input type="password" name="password" id="password"
								class="form-control" placeholder="비밀번호"  maxLength=20 />
						</div>
						<div style="padding-left: 20px;">
							<span id="confirm1" class="confirmChar" style="display: none">
								X 영문/숫자/특수문자 2가지 이상 조합 (8~20자)</span> 
							<div id="password_ck1"></div>
							<div id="password_ck2"></div>
							<div id="password_ck3"></div>
							<div id="password_ck4"></div>
							<div id="password_ck5"></div>
						</div>
						<div class="input-group">
							<span class="input-group-text"><i
								class="bi bi-shield-check"></i></span> <input type="password"
								name="password_check" id="password_check" class="form-control"
								placeholder="비밀번호 확인"  maxLength=20 /> <br />
						</div>
						<div id="password_checkgo"></div>
						<div id="passConfirm"></div>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<input type="text" name="name" id="name" class="form-control"
								placeholder="이름"  maxLength=20 />
						</div>
						<div id="name_ck"></div>
						<div id="name_ck1"></div>
						<button type="submit" class="btn btn-dark"
							style="width: 470px; height: 60px;">
							<span style="font-weight: bold; font-size: 20px;">동의하고 가입하기</span>
						</button>
						<!-- </form>-->
					</div>
					<div class="input-group"></div>
				</div>
	
				<div class="col-3"></div>
			</div>
		</form>
	</div>
</body>

</html>