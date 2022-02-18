<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<form method=post action="/team/signCheck">
<br><br>
<h1 class="text-white mb-4">Join</h1>
<br>
<table align=center>
<tr>
	<td class=td>이름</td><td><input class=sub type=text name=name id=name></td>
	<td class=td>성별</td>
	<td>
		<input type="radio" name="gender" value="Male">남성&nbsp;&nbsp;
		<input type="radio" name="gender" value="Female">여성
	</td>
</tr>
<tr>
	<td class=td>아이디</td><td><input class=sub type=text name=userid id=userid></td>
	<td colspan=2><input type=button id=btnCheck value='중복확인'></td>
</tr>
<tr>
	<td class=td>비밀번호</td><td><input class=sub type="password" name=passcode id=passcode></td>
	<td class=td>비밀번호 확인</td><td><input class=sub type="password" name=passcode1 id=passcode1></td>
</tr>
<tr>
	<td class=td>모바일번호</td><td><input class=sub type=text name=mobile id=mobile></td>
	<td class=td>고객/직원</td>
	<td>
		<input type="radio" name="type" value="1">고객&nbsp;&nbsp;
		<input type="radio" name="type" value="0">직원
	</td>
</tr>
<tr>
	<td colspan=4 align=center>
		<input class="btnsmall btn-primary" type=submit value='가입완료'>&nbsp;&nbsp;
		<input class="btnsmall btn-primary" type=button id=btnback value='취소' onclick='document.location="/team/home"'>
	</td>
</tr>
</table><br><br>
</form>
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

<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCheck',function(){
	   let userid=$('#userid').val();
	   let flag=true;
	   $.ajax({
		   url:'/team/idCheck',
		   data:{},
		   dataType:'json',
		   method:'get',
		   success:function(txt){
	         for(i=0; i<txt.length; i++){
	            console.log(txt[i].userid+","+userid);
	            if(txt[i].userid==userid){
	               alert('중복된 아이디입니다.')
	               flag=false;
	            }
	         }
	      },
	      complete:function(){
	         if(flag==false) return false;
	         else alert('사용할수있는 아이디입니다.')
	      }
	   });
})
.on('submit',function(){
	if($('input[name=name]').val()==""){
		alert('이름을 확인해주세요');
		return false;
	}  
	if ($('input:radio[name=gender]').is(":checked")==false){
		alert('성별을 확인해주세요');
		return false;
	}
	if($('input[name=userid]').val()==""){
		alert('아이디를 확인해주세요');
		return false;
	}
	if($('input[name=passcode]').val()!=$('input[name=passcode1]').val()){
		alert('비밀번호를 다시 확인해주세요');
		return false;
	}
	if($('input[name=mobile]').val()==""){
		alert('전화번호를 확인해주세요');
		return false;
	} 
	if ($('input:radio[name=type]').is(":checked")==false){
		alert('다시 확인해주세요');
		return false;
	} 
})

</script>
</html>