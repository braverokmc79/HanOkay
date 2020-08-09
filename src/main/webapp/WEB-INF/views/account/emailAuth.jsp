<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@include file="../includes/header1.jspf"%>
<title>Han:Ok - 비밀번호 찾기 인증코드 확인</title>
<style>
#sendAgainBtn:hover{
	cursor:pointer;
}
</style>
<%@include file="../includes/header2.jspf"%>
<%@include file="../includes/header3.jspf"%>

<!-- Register CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/register.css" >


<div class="container">

	<section class="contents">

			<div class="contents_out">
				 <h1>비밀번호 찾기 인증코드</h1>
			</div>
	
		<div class="container2_SR">

			
			<div class= "contents_img">
			<i class="fa fa-envelope fa-5x"></i>
			</div>
		
			<div class="contents_txt">
				<h2>이메일 발송 완료!</h2>
				<p>입력하신 이메일 주소로 인증 코드를 발송했습니다. </p>
			</div>
						
			<form method="post" class="Emailform">
				<span id="msg"><c:out value="${msg}" /></span><br>
				<input id="enteredAuthCode" name="enteredAuthCode" placeholder="인증코드를 입력하세요">
				<br>
				<button type="button" id="registerBtn" class="btn btn-sumbit">인증코드 제출</button>
			<br>
			<div style="margin-top: 18px;">
				<span>인증코드가 도착하지 않았나요? </span>
				<a style="color:#007bff;" id="sendAgainBtn">인증코드 재발송</a>
				<br>
			</div>
				<input type="hidden" name="email" id= "email" value="${email }"><br>
				<input type="hidden" id="msgAboutEmail"name="msgAboutEmail" value="${msgAboutEmail }" >
			</form>
			
			
		</div>
	</section>

</div>

		
	<script> 
	//가입하기 버튼
	$('#registerBtn').on("click", function(){
		
		let email= $("#email").val();
		let enteredAuthCode= $("#enteredAuthCode").val();
		
		$.ajax({
	            type: "POST",
	            url: "/account/submitAuth",
	            dataType: "json",
	            data: {
	              email: email,
	              enteredAuthCode: enteredAuthCode
	            },
	            
	            success: function (data) {
	              console.log("data: "+ data);
	              console.log("data.msg: "+ data.msg);
	             
	       
	              if(data.msg ==='success'){
	            	  alert("이메일 인증에 성공하였습니다. 보안을 위해 비밀번호를 바로 변경해주세요!");
	            	  window.location.href="/account/myAccount";
	            } 
	              else if (data.msg === 'fail'){
	            	alert("인증코드가 틀렸습니다! 인증코드를 다시 입력하세요. 인증코드를 재발급 받고싶다면 인증코드 재발급 버튼을 누르세요.");
	            }
	           },
	          error: function (data) {
	              window.location.href = "../error/404error";
	            }, 
		});
	 });
	
	//인증번호 재발송 버튼 
	$('#sendAgainBtn').on("click", function(){
		let email= $("#email").val();
		alert(email+ "로 인증코드가 재발송 됩니다.");
		
		$.ajax({
            type: "POST",
            url: "/account/sendAgain",
            dataType: "json",
            data: {
              email: email,
            },
            
            success: function (data) {
              console.log("data: "+ data);
              console.log("data.msg: "+ data.msg);
             
       
              if(data.msg ==='success'){
            	  alert("인증코드가 재발송되었습니다!현재페이지에서 다시 인증코드를 입력하세요.");
            	 
              }
              else if (data.msg === 'fail'){
            	alert("오류로 인하여 인증코드 재발송에 실패했습니다! 다시 시도해주세요.");
            }
           },
          error: function (data) {
              window.location.href = "../error/404error";
            }, 
		});
		
	});
	</script>

<%@include file="../includes/footer.jsp"%>