<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link rel="icon" type="image/x-icon" href="resources/assets1/favicon.ico" />
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css"/>
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@300&display=swap" rel="stylesheet">
</head>
<style>
* {
	font-family: 'Bitter', serif;
}
table {
	border-collapse:collapse;
	border:solid 1px white;
	width: 80%;
	height: 300px;
}
td {
	border:2px solid white;
	padding:10px 10px;
	--bs-text-opacity: 1;
	color: rgba(255, 255, 255, 0.5) !important;
}
h1 {
	font-weight: 700;
}
.contact-section {
  padding-top: 5rem;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
  
}
</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
		<h1 class="text-white mb-4">Login</h1><br>
		<input type=hidden id=type name=type>
		<table align=center class=tbl>
			<tr><td>아이디</td><td><input type=text id=userid name=userid></td></tr>
			<tr><td>비밀번호</td><td><input type=password id=passcode name=passcode></td></tr>
			<tr><td colspan=2 align=center>
					<input type=button class="btnsmall btn-primary" id=log_chk value='로그인'>&nbsp;
					<input type=button class="btnsmall btn-primary" id=cancel value='취소' onclick="document.location='/team/home'">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/team/register">회원가입</a></td></tr>
					
		</table>
                    </div>
                </div>
            </div>
        </section>
<section class="contact-section" id=signup>
        <jsp:include page="footer.jsp"/>
</section>
         <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div></footer>
        
</body>
   <!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js' />"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#log_chk',function(){
	if($('input[name=userid]').val()==""){
		alert('아이디를 확인해주세요');
		return false;
	} else if ($('input[name=passcode]').val()==""){
		alert('비밀번호를 확인해주세요');
		return false;
	}
	$.post('/team/type_check',{},function(txt){
		for(let i=0; i<txt.length; i++){
			if($('#userid').val()==txt[i]['id']){
				$('#type').val(txt[i]['type']);
			}
		}
		$.post('/team/login_check',{},function(txt){      
			var flag="";
			for(let i=0; i<txt.length; i++){
				if($('#userid').val()==txt[i]['id'] && $('#passcode').val()==txt[i]['pw']){
					flag="true";
					break;
				} else {
					flag="false";   
				}
			}
			console.log($('#type').val());
			console.log("flag:"+flag);
			if(flag=="true"){
				alert($('#userid').val()+"님 환영합니다.");
				$.post('/team/login_update',{id:$('#userid').val(),type:$('#type').val()},function(txt){
					document.location='/team/home';
				},'text');
			} else {
				alert("아이디 또는 비밀번호가 맞지 않습니다.");   
			}
		},'json');
	},'json');
});

</script>
</html>
