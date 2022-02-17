<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    margin-left: auto;
    margin-right: auto;
    border-collapse:collapse;
}
.notice, .notice th, .notice td {
	padding:10px;
	 border:1px solid white;
/* 	--bs-text-opacity: 1;
	color: rgba(255, 255, 255, 0.5) !important; */
}
.contact-section {
  padding-top: 5rem;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
  
}
.faqbox{
	position:relative;
    padding-top: 20px;
/*     width: 1400px; */
    margin: 0 auto;
    align:right;
}
.notice {
	color: black;
}
.faqbox table {
    width: 100%;
    border-top: 2px solid #222222;
	background-color: #f6f6f6;
} 
.faqbox th {
	background-color: black;
	font-size:20px;
    color: #f6f6f6;
}
.faqbox table tr{cursor:pointer;}
.faqbox table tr th {
    padding: 20px 0;
    border-bottom: 1px solid #e9e9e9;
}
.faqbox table td{
	font-size:17px;
	color:black;
	padding: 20px 0;
	text-align:center;
     border-bottom: 1px solid #e9e9e9;
}
/* .faqbox table tr:hover{ */
/* 	background-color: rgba(33, 37, 41, 0.9); */
/* 	color: #f6f6f6; */
/* } */

.faqbox .faq-list .td_bg{display:block; width:90px; height:33px; background:url('/img/sub/faq.png') no-repeat center center;}
.faqbox .faq-list .td_inner_box{padding-left:40px;}
.faqbox .faq-list .td_content_view{display:none; padding:40px 0 60px 0; text-align:left; background:#f6f6f6;}


</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about" style="height:1000px;">
            <div class="container px-4 px-lg-5">
<!--                 <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8"> -->
<br>
<h1 class="text-white mb-4">Human Hotel</h1>
   <hr>
<div class="faqbox">
		<div class="faq-list faq_box_01">
<h1 style='color:white'>예약 조회</h1>
<table >
	<tr><td colspan='2'>아이디: <input type=text id=userid name=userid placeholder='아이디를 입력하세요'></td></tr>
	<tr><td colspan='2'><input type=button id=track value="조회하기"></td></tr>
	</table>
	<table id=tbltrack>
		<tr><th>예약번호</th><th>입실날짜</th><th>퇴실날짜</th><th>숙박인원</th><th>대표자명</th><th>전화번호</th><th>숙박비</th></tr>
	</table>
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
	<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#track',function(){
	$.ajax({
        url:"/team/trackbk1",
        data:{userid:$('#userid').val()},
        method:"GET",
        dataType:'json',
        beforeSend:function(){
        },
        success:function(data){
     				for(i=0; i<data.length; i++){
					let str="<tr><td>"+data[i]["id"]+"</td><td>"+data[i]["start_dt"]+"</td><td>"+
							data[i]["end_dt"]+"</td><td>"+data[i]["howmany"]+"</td><td>"+data[i]["guest"]+
							"</td><td>"+data[i]["mobile"]+"</td><td>"+data[i]["howmuch"]+"</td></tr>";
							$('#tbltrack').append(str);
        }
       }
     });
})
</script>
</html>