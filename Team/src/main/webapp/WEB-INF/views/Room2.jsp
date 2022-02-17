<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Room</title>
<!-- Font Awesome icons (free version)-->
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
.sub_title{
	width:100%;
	text-align:center;
	/*margin-bottom:100px;*/
	margin-bottom:50px;
	}
.sub_title h3{
	color:#010101;
	font-size:28px;
	line-height:1em;
	margin-top:15px;
	font-weight:400;
	font-family:"Montserrat", "Noto Sans KR";
	}
.sub_title h5{
	text-transform:uppercase;
	color:#999999;
	font-size:16px;
	font-family: 'Kalinga', serif ;
	line-height:1em;
	font-weight:400;
	}

.sub_title > p {
	color: #888;
    font-size: 14px;
    font-weight: 500;
    margin-top: 20px;
}
.m20.character .service > h3 > a.pop_btn,.m20.suite .service > h3 > a.pop_btn{right:0;}
.m20_top{
	text-align:center;
	margin:60px auto 0;
	width:1400px;
	border-bottom:1px solid #494949;
	padding-bottom:20px;
	}
.m20_top > p{
	font-family: 'Noto Serif', serif;

	letter-spacing : -0.05em;
	color:#000;
	font-size:18px;
	margin-bottom:48px;
	line-height:1.8em;
	font-weight:600;
	}
.m20_top > ul{
	font-size:0;
	text-align:center;
	}
.m20_top > ul > li{
	display:inline-block;
	vertical-align:top;
	font-size:0;
	}
.m20_top > ul > li:first-child{margin-right:120px;}
.m20_top > ul > li > span{
	text-align:left;
	display:inline-block;
	vertical-align:top;
	line-height:33px;
	height:33px;;
	}
.m20_top > ul > li > span.title{
	color:rgba(0,0,0,0.7);
	font-size:15px;
	font-weight:600;
	margin-right:10px;
	}
.m20_top > ul > li > span.title img{margin-right:15px;}
.m20_top > ul > li > span.con{
	color:rgba(0,0,0,0.7);
	font-size:15px;
	}
.m20_top > ul > li > span.con.c777{color:#777}
.m20{padding-top:50px;}
.depth3{
	/*margin-top:112px;*/
	}
.depth3 > ul{
	font-size:0;
	text-align:center;

	}
.depth3 > ul > li{
	display:inline-block;
	vertical-align:top;
	min-width:180px;
	box-sizing:border-box;
	box-shadow: 1px 1px 0 0 #e5e5e5 inset, -1px -1px 0 0 #e5e5e5 inset;
	}
.depth3 > ul > li > a{
	display:block;
	height:46px;
	line-height:46px;
	text-align:center;box-sizing:border-box;
	color:#484848;padding:0 20px;
	font-size:14px;
	}
.depth3 > ul > li.on{box-shadow:none;}
.depth3 > ul > li.on > a{
	color:#f7f7e4;
	font-weight:600;
	background:#64a19d
	}
.slider_wrap{
	width:1400px;
	margin:0 auto;
	position:relative;
	}
.slider_wrap #slide-counter{
	position:relative;
	position:absolute;
	right:-37px;
	top:240px;
	width:24px;
	height:147px;
	padding-left:6px;
	background:url('/img/main/main_slider_bg.png') no-repeat left top;
	font-size:21px;
	color:#cccccc;
	text-align:center;
	font-family: 'Frank Ruhl Libre', serif;
	}
.slider_wrap #slide-counter,
.m40 .slider_wrap #slide-counter{
top: 165px;
}
.slider_wrap,
.m40 .slider_wrap{
	margin-bottom:50px;
}
.slider_wrap #slide-counter > span{
	width:30px;
	height:70px;
	display:block;
	left:0;
	z-index:10;
	position:absolute;
	cursor:pointer;
	}
.slider_wrap #slide-counter > span#slider-prev{top:0;}
.slider_wrap #slide-counter > span#slider-next{bottom:0;}
#slide-counter .current-index{display:block; width:24px;height:33px; padding-top:40px;padding-bottom:8px; color:#7d7d7d; }
.slider_wrap #slide-counter .current-index{}
.service{width:1400px; margin:160px auto 0; position:relative;}
.service > .pop{
	position:absolute;
	right:0;
	top:55px;
	width:594px;
	border:3px solid #525252;
	background:#fff;
	z-index:100;
	display:none;
	}
.service > .pop > h3{
	position:relative;
	background:#525252;
	height:50px;
	line-height:50px;
	padding-left:10px;
	color:#fff;
	font-size:15px;

	}
.service > .pop > h3 > a{
	position:absolute;
	right:10px;
	top:0;
}
.service > .pop div.pop_con{
	padding:30px 12px;
	}
.service > .pop div.pop_con > ul{
	width:100%;
	font-size:0;
	padding:30px 0;
	border-top:1px solid #b2b2b2;
	border-bottom:1px solid #b2b2b2;
	}
.service > .pop div.pop_con > ul > li{
	display:inline-block;
	vertical-align:top;
	padding-left:20px;
	border-left:1px solid #e5e5e5;
	height:313px;
	width:169px;
	}
.service > .pop div.pop_con > ul > li:first-child{border-left:none;}
.service > .pop div.pop_con > ul > li > h3{
	color:rgba(0,0,0,0.8);
	font-weight:600;
	font-size:15px;
	line-height:1em;
	}
.service > .pop div.pop_con > ul > li > ul{}
.service > .pop div.pop_con > ul > li > ul > li{
	margin-top:14px;
	line-height:1em;
	padding-left:10px;
	color:rgba(0,0,0,0.7);
	font-size:15px;
	position:relative;

	}
.service > .pop div.pop_con > ul > li > ul > li.dot:before{
	content:"";
	width:2px;
	height:2px;
	display:block;
	background:#737373;
	position:absolute;
	left:0;
	top:5px;
	}
.service > h3{
	margin-bottom:10px;
	display:block;
	position:relative;
	font-size:24px;
	font-weight:600;
	color:#000;
	height:45px;
	line-height:45px;
	}
.service > h3 > a{
	display:block;
	position:absolute;
	right:0;
	top:0;
	width:160px;
	height:45px;
	line-height:45px;
	text-align:center;
	color:#fff;
	font-size:15px;
	font-weight:600;
	background:#525252;
	}
.service > h3 > a.pop_btn {right:170px;}
.table{
	border-top:2px solid #061e47;
	width:100%;
	}
.table th, .table td{
	padding:50px 0;
	border-top:1px solid #ededed;
	vertical-align:top;
	}
.table th{
	width:170px;
	text-align:center;
	color:#000000;
	font-size:17px;
	line-height:1em;
	}
.table td{
	text-align:left;
	}

.table .left_bor {
	border-top: 2px solid #f2e325; 
    border-bottom: 2px solid #f2e325;
	border-left: 2px solid #f2e325;
}
.table .right_bor {
	border-top: 2px solid #f2e325;
    border-bottom: 2px solid #f2e325;
	border-right: 2px solid #f2e325;
}
.table td > p{
	padding-left:10px;
	margin-top:15px;
	color:rgba(0,0,0,0.7);
	font-size:15px;
	line-height:1em;
	position:relative;
	}
.table td > p > span{
	display:inline-block;
	vertical-align:top;
	line-height:1em;
	color:rgba(0,0,0,0.7);
	font-size:15px;
	}
.table td > p > span.title{
	width:80px;
	color:rgba(0,0,0,0.7);
	font-size:15px;
	font-weight:500;
	}
.table td > p > span.con{}
.table td > p.dot2{
	color:rgba(75,75,75,0.7);
	font-size:13px;
		}
.table td > p.dot{
	display:inline-block;
	vertical-align:top;
	width:200px;
	}
.table td > p.top,
.table td > p:first-child{
	margin-top:0;
}
.table td > p.dot:before{
	content:"";
	width:2px;
	height:2px;
	display:block;
	background:#737373;
	position:absolute;
	left:0;
	top:5px;
	}
.table td > p.dot.solo{
	display:block;
	width:300px;
	}

.th_w {width:172px !important;}
.td_w {width:384px !important;}
.m00 > p:before {
	content:"";
	width:36px;
	height:3px;
	margin-bottom:15px !important;
	display:block;
	background:#313131
	}
.m00 > p .s_tit{font-size: 21px;font-family:"Noto Serif KR","source-han-serif-korean",serif;line-height: 30px;color: #444;font-weight: 500;letter-spacing: -0.5px;}
.m00 .s_tit2{font-size: 45px;font-family:"Noto Serif KR","source-han-serif-korean",serif;line-height: 60px;color: #444;font-weight: 500;letter-spacing: -0.5px;}
span.charge_tit{display:block; text-align:right; font-size:17px; color:#000; margin-bottom:30px;}

.roomimg {
	width: 100%;
}
</style>


<body>
<jsp:include page="header.jsp"/>
        <section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
<div class="sub_title">
	<h1 class="text-white mb-4">Business Room</h1>
</div>

<div class="depth3">
	<ul>
		<li><a href="/team/Room1">Standard</a></li>
		<li class="on"><a href="/team/Room2">Business</a></li>
		<li><a href="/team/Room3">Suite</a></li>
		<li><a href="/team/Room4">Hollywood</a></li>
	</ul>
		<img class=roomimg src="https://cdnb.artstation.com/p/assets/images/images/014/081/609/large/berktan-hatiboglu-american-render1.jpg?1542377151" alt="" />
		<div class="slide_text"><br>
			<p class="text-white-50">편안함과 모던하고 세련된 인테리어를 동일하게 누리면서도<br>
				보다 더 여유로운 공간감과 쾌적함을 느끼실 수 있는 객실입니다.</p>
		</div>
	</div>
	                    </div>
                </div>
            </div>
         </section>
<div class="m00 m20">
	<div class="service">
		<h3>
			객실서비스 
<!-- 			<a class="pop_btn">객실 어메니티 보기</a> -->
   				<c:if test="${type ==0}"><a href="/team/admin" target="_self">예약하기</a></c:if>
				<c:if test="${type ==1}"><a href="/team/bookcheck" target="_self">예약하기</a></c:if>
				<c:if test="${type ==2}"><a href="/team/bookcheck" target="_self" id=close2>예약하기</a></c:if>
		</h3>
		<table cellpadding="0" cellspacing="0" class="table">
	<tbody><tr>
		<th>기본정보</th>
      <td>
         <p>
            <span class="title">체크인</span>
            <span class="con">15:00</span>
         </p>
         <p>
            <span class="title">체크아웃</span>
            <span class="con">주중 / 주말 11:00</span>
         </p>
         <p>
            <span class="title">객실크기</span>
            <span class="con">34㎡ / 39㎡</span>
         </p>
         <p>
            <span class="title">객실구성</span>
            <span class="con">침실1, 욕실1(욕조 포함)</span>
         </p>
         <p>
            <span class="title">객실타입</span>
            <span class="con">더블Bed 1개</span>
         </p>
         <p class="dot2">ㆍ성수기 시즌 체크 인/ 아웃 시간은 조정 될 수 있습니다.</p>
      </td>
      <th class="th_w">예약 및 문의</th>
      <td class="td_w">
         <p>02-552-7008</p>
      </td>
	</tr>
	<tr>
		<th>객실 내부</th>
		<td>
			<!-- <p class="dot solo">특급호텔 수준의 침구 및 침대</p> -->
			<p class="dot top">43인치 TV(50채널)</p>
			<p class="dot top">무료 유무선 인터넷</p><br>
			<p class="dot">무료 커피, 티백</p>
			<p class="dot">무료 생수 2병</p><br>
			<p class="dot">안전개인금고</p>
			<p class="dot">커피포트</p>
			<p class="dot">고급 어메니티</p>
		</td>
		<th>호텔 내부</th>
		<td>
			<p class="dot solo">피트니스센터 무료이용</p>
			<p class="dot solo">비즈니스센터 인터넷 무료이용</p>
			<p class="dot solo">투숙기간 내 무료주차가능</p>
		</td>
	</tr>
	<tr>
		<th>유료서비스</th>
		<td colspan="3">
			<p class="dot solo">유아용 침대 가드 11,000원</p>
			<p class="dot solo">칫솔 세트 2,000원</p>
			<p class="dot solo">와인 오프너 1,000원</p>
			<p class="dot solo">플라스틱 와인잔 1SET(2ea) 3,000원</p>
			<p class="dot solo">생수 추가(멀티룸 자판기 판매)</p>
			<p>※ 유료서비스 이용 관련하여 궁금하신 점은 체크인 후 프론트로 문의 바랍니다.</p>
		</td>
	</tr>
</tbody>
</table>	
</div>
</div>

<section class="contact-section bg-black" id=signup>
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
.on('click','#close2',function(){
   alert('로그인 후 이용이 가능 합니다.');
   return false;
})
</script>
</html>