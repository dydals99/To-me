<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>login</title>
<style>
    p{font-weight: bold; font-size: 18px; }
    body{font-family: dotum,sans-serif;}
    input{width: 450px;height: 60px;}
    .login_btn{
   		border: none;
   	    background-color: black;
	    color: #fff;
	    box-shadow: inset 0 -2px 0 rgb(0 0 0 / 38%);
	    padding: 16px 17px;
	    font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
	    font-size: 17px;
	    line-height: 20px;
	    display: block;
	    padding-left: 0;
	    padding-right: 0;
	    width: 100%;}
   	.regist_btn{
	   	border: 1px solid #ccc; 
	    background-color: #fff;
	    color: #0073e9;
	    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 15%);
	    padding: 16px 17px;
	    font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
	    font-size: 17px;
	    line-height: 20px;
	    display: block;
	    padding-left: 0;
	    padding-right: 0;
	    margin: 18px 0 0;
	    width: 49%;}
    .btn_text{font-weight: bold; font-size: 17px;} 
    hr{
	    width: 100%;
	    margin: 18px 0 0;
	    border-top: 1px solid gray;}
	a{
		text-decoration: none;
		float: right;
	}
</style>
</head>
<body style="width: 100%; overflow: hidden;">
<!-- 아이디, 패스워드 입력여보를 확인하기 위한 스크립트 -->
<script type="text/javascript">
function loginValidate(f)
{
	if(f.my_id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.my_pass.value==""){
		alert("패스워드를 입력하세요"); 
		f.pass.focus();
		return false;
	} 
}
</script>
<div class="container"> 
			<form name="loginForm" method="post" action="login_act" onsubmit="return loginValidate(this);">
			 	<div class="container d-flex justify-content-center">
			 		<h1>Login</h1>
    			</div>
				 <div class="container">
						<div class="row">
							<div class="col-3"></div>
							<div class="col-6">
								<!-- 정보 입력 -->
								<div class="input-group mb-4">
									<span class="input-group-text"><i class="bi bi-envelope"></i></span>
									<input type="text" name="email" class="form-control"
										placeholder="아이디(이메일)">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text"><i
										class="bi bi-shield-lock"></i></span> 
										<input type="password" name="password" class="form-control" placeholder="비밀번호">
								</div>
								<button class="login_btn mt-3">
									<span class="btn_text" style="color: white;">로그인</span>
								</button>
								<hr>
							</div>
							<div class="col-3"></div>
						</div>
					</div>
			</form>
</div>
</body>
</html>
