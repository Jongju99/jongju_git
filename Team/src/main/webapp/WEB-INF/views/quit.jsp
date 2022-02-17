<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
<h1 class="text-white mb-4">회원 탈퇴</h1><br>
<table align=center>
<tr><td class=td>이름</td>
	<td><input class=sub type=text name=name id=name></td></tr>
<tr><td class=td>아이디</td>
	<td><input class=sub type=text name=userid id=userid></td></tr>
<tr><td class=td>비밀번호</td>
	<td><input class=sub type="password" name=passcode id=passcode></td></tr>
<tr><td class=td>모바일번호</td>
	<td><input class=sub type=text name=mobile id=mobile></td></tr>
<tr><td colspan=2 align=center>
		<input class="btnsmall btn-primary" type=button id=btnquit value='탈퇴'>&nbsp;&nbsp;
		<input class="btnsmall btn-primary" type=button id=btnback value='취소' onclick='document.location="/team/home"'>
	</td></tr>
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

<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnquit',function(){
	let userid=$('#userid').val();
	let flag=true;
	
	$.ajax({
		url:'/team/quit',
		data:{},
		dataType:'json',
		method:'post',
		success:function(txt){
			console.log(txt);
			for(let i=0; i<txt.length; i++){
				if($('#userid').val()==txt[i]['id'] && $('#passcode').val()==txt[i]['pw']
					&& $('#name').val()==txt[i]['name'] && $('#mobile').val()==txt[i]['mobile']){
						flag="true";
						break;
				} else {
					console.log(txt);
		            flag="false";   
				}
			}
		},
		complete:function(){
			if(flag=="true"){
				alert("탈퇴되었습니다");
				$.ajax({
					url:'/team/quitMember',
					data:{id:$('#userid').val()},
					dataType:'text',
					method:'post',
					success:function(txt){
						console.log(txt);
						if(txt=="ok"){
							document.location='/team/home';
						} else {
							document.location='/team/viewquit';
						}
					}
				})
			} else {
				alert("존재하지 않는 회원입니다");   
			}
      }
});
})
</script>
</html>