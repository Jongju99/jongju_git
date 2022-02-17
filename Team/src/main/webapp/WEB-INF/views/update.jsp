<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link rel="icon" type="image/x-icon" href="resources/assets1/favicon.ico" />
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css"/>
</head>
<style>
table {
    margin-left: auto;
    margin-right: auto;
    border-collapse:collapse;
}
.notice, .notice th, .notice td {
	padding:10px;
	 border:1px solid white;
	--bs-text-opacity: 1;
	color: rgba(255, 255, 255, 0.5) !important;
}
.contact-section {
  padding-top: 5rem;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
  
}
#title,#name{
width : 443px;
}
</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
<br>
<input type=hidden id=notice_id name=notice_id value="${notice.bno}">
<table style='border-collapse:collapse;'>
<tr><td style="color: gray;">제목</td><td><input type=text value="${notice.title}" id=title name=title ></td></tr>
<tr><td style="color: gray;">작성자</td><td><input type=text value="${notice.name}" id=name name=name></td></tr>
<tr><td style="color: gray;">내용</td><td><textarea id=content name=content rows=10 cols=50 >${notice.content}</textarea></td></tr>
<tr><td><input type=button id=btnList name=btnList value='목록보기'></td>
	<td align=right><input type=button id=btnFinish name=btnFinish value='수정'>
					<input type=button id=Reset name=Reset value='지우기'></td></tr>
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
.on('click','#btnList',function(){
	document.location='/team/notice';
	return false;
})
.on('click','#btnFinish',function(){
	$('#notice_id').val($.trim($('#notice_id').val()));
	if($('#notice_id').val()==''){
		alert('게시물 번호가 없습니다.');
		return false;
	}
	$('#title').val($.trim($('#title').val()));
	$('#name').val($.trim($('#name').val()));
	$('#content').val($.trim($('#content').val()));
	if($('#title').val()=='' || $('#name').val()=='' || $('#content').val()==''){
		alert('비어있는 입력란이 있습니다.');
		return false;
	}
 	$.ajax({url:'/team/modify',
 			data:{id:$('#notice_id').val(), title:$('#title').val(),
       			  name:$('#name').val(), content:$('#content').val()},
       		datatype:'text',
       		method:'post',
       		success:function(txt){
       			alert("수정되었습니다.");	
       			document.location='/team/notice';
       		}
 	})
	return true;
  })
.on('click','#btnDelete',function(){
	$('#title,#name,#content').val("");
	})


//update mvc_voard set title='', name='', content='' where id=''
</script>
</html>