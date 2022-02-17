<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
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
/**
 * BxSlider v4.1.2 - Fully loaded, responsive content slider
 * http://bxslider.com
 *
 * Written by: Steven Wanderski, 2014
 * http://stevenwanderski.com
 * (while drinking Belgian ales and listening to jazz)
 *
 * CEO and founder of bxCreative, LTD
 * http://bxcreative.com
 */


/** RESET AND LAYOUT
===================================*/


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
	color:#484848;
	font-weight:600;
	background:#f2e325
	}


/*페이징**/
.pager {
	padding-top:60px;
	padding-bottom:100px;
	text-align:center;
}
.pager > ul{
	font-size:0;
	}
.pager > ul > li{
	display:inline-block;
	vertical-align:top;
	margin:0 1px;
	}
.pager > ul > li.num{
	width:42px;
	height:42px;
	line-height:42px;
	text-align:center;
	}
.pager > ul > li.on{
	background:#323232;
	}
.pager > ul > li.num:first-child{}
.pager > ul > li > a{
	font-size:14px; color:#8d8d8d;
}
.pager > ul > li.on > a{color:#bfbfbf;}
.pager > ul > li.page_prev{
	margin-right:35px;
	}
.pager > ul > li.page_next{
	margin-left:35px;
	}


.faqbox{
	position:relative;
    padding-top: 20px;
/*     width: 1400px; */
    margin: 0 auto;
    align:right;
}
.faqbox table {
    width: 100%;
    border-top: 2px solid #222222;
	background-color: #f6f6f6;
} 
.faqbox th {
	background-color: black;
	font-size:20px;
}
.faqbox table tr{cursor:pointer;}
.faqbox table tr th {
    padding: 20px 0;
    border-bottom: 1px solid #e9e9e9;
    color: #f6f6f6;
}
.faqbox table td{
font-size:17px;
color:#808080;
padding: 20px 0;
text-align:center;
     border-bottom: 1px solid #e9e9e9;
}
.faqbox table tr:hover{
	background-color: rgba(33, 37, 41, 0.9);
	color: #f6f6f6;
}
.faqbox .faq-list .td_bg{display:block; width:90px; height:33px; background:url('/img/sub/faq.png') no-repeat center center;}
.faqbox .faq-list .td_inner_box{padding-left:40px;}
.faqbox .faq-list .td_content_view{display:none; padding:40px 0 60px 0; text-align:left; background:#f6f6f6;}


/*table charge_tit*/
span.charge_tit{display:block; text-align:right; font-size:17px; color:#000; margin-bottom:30px;}
</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
<!--                 <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8"> -->

	<div class="sub_title">
		<h5>Human Hotel</h5>
		<h1 class="text-white mb-4">FAQ</h1>
	</div><!-- e : sub_title -->
	<div class="option-wrap">
		<div class="faqbox">
			<form id="search_form" method="get">
			<input type="hidden" name="cate" value="">
			<input type="hidden" name="bo_table" value="faq">
			<select name="key_type" id="option">
				<option value="b_subject" >제목</option>
				<option value="b_content" >내용</option>
			</select>
			
				<input type="text" name="key_word" id="submit"/>
				<button type="submit" style="border:0px;" class="submit submit_button">검색</button>
			</form>
		</div>
 	</div>
	
	<div class="faqbox">
		<div class="faq-list faq_box_01">
			<table cellpadding="0" cellspacing="0">
			<colgroup>
				<col width="90px">	
				<col width="200px">	
				<col width="800px">	
			</colgroup>
				<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
						</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>기타</td>
						<td class="text-left">
							<div class="td_inner_box">배달음식 주문 가능 및 객실까지 오나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>호텔 자체적으로 배달에 제한을 두지는 않으나 보안을 위해 1층 로비에서 수령하셔야 합니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>2</td>
						<td>기타</td>
						<td class="text-left">
							<div class="td_inner_box">보타보타 및 편의점이 호텔 내부에 있나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>후문 마리나가든 방향으로 나가셔서 별관 마리나베이스타로 이동하시면 됩니다.(우측 200m 거리)</p></td>
					</tr>
										<tr>
						<td>3</td>
						<td>기타</td>
						<td class="text-left">
							<div class="td_inner_box">호텔 내부에 카페가 있나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>1층 로비 옆에 카페는 일부 프로모션에 의해 운영되며 판매시설이 아닙니다. </p><p>카페는 별관 보타보타를 이용하시면 됩니다. </p></td>
					</tr>
										<tr>
						<td>4</td>
						<td>기타</td>
						<td class="text-left">
							<div class="td_inner_box">콜택시 가능한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>호텔 내 직원들도 카카오 앱을 통해 카카오 택시를 부르고 있습니다. 체크아웃 바쁜 시간에는 가급적 고객이 직접 카카오 앱을 통해서 부르는 것을 권하고 있습니다.&nbsp;&nbsp;&nbsp;</p></td>
					</tr>
										<tr>
						<td>5</td>
						<td>기타</td>
						<td class="text-left">
							<div class="td_inner_box">연간회원이나 멤버쉽등의 시스템은 없나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>현재 멤버십 프로그램은 마련 되어있지 않으며 향후 운영 계획중 입니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>6</td>
						<td>시설</td>
						<td class="text-left">
							<div class="td_inner_box">튜브나 구명조끼 사용가능한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>개인 튜브는 반입이 불가하며, 유아 암튜브에 한해 반입을 허용합니다. 구명조끼는 사이즈별로 넉넉하게 비치되어 있으나 개인 구명조끼도 사용 가능합니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>7</td>
						<td>시설</td>
						<td class="text-left">
							<div class="td_inner_box">수영장에 모자 꼭 써야하나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>수영모 착용은 필수는 아니지만 미착용 시 머리를 묶어주시기 바랍니다.</p><p>또한 수영복(래시가드 포함) 미착용시에는 수영장 이용에 제약이 있을 수 있습니다.</p></td>
					</tr>
										<tr>
						<td>8</td>
						<td>시설</td>
						<td class="text-left">
							<div class="td_inner_box">수영장 팔찌 분실 및 훼손의 경우 재 발급 가능한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>수영장 팔찌 훼손 또는 분실 시 재발급해드리지 않으며 수영장 입장도 제한됩니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>9</td>
						<td>미팅/연회</td>
						<td class="text-left">
							<div class="td_inner_box">호텔에서 웨딩도 가능한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>현재 웨딩홀은 준비중에 있으며, 향후 오픈 시 홈페이지를 통해 안내드릴 예정입니다.</p></td>
					</tr>
										<tr>
						<td>10</td>
						<td>다이닝</td>
						<td class="text-left">
							<div class="td_inner_box">주변에 추천할만한 식당은 없나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>객실 카드키홀더 뒷면 지도를 참고 바랍니다.&nbsp;&nbsp;</p></td>
					</tr>
										<tr>
						<td>11</td>
						<td>다이닝</td>
						<td class="text-left">
							<div class="td_inner_box">조식 뷔페 메뉴는 무엇인가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>조식은 뷔페식이며 각종 과일과 샐러드, 빵, 죽을 기본으로 다양한 음식들이 준비되어 있습니다.</p></td>
					</tr>
										<tr>
						<td>12</td>
						<td>다이닝</td>
						<td class="text-left">
							<div class="td_inner_box">호텔 내에 저녁식사 할 수 있는 곳이 있나요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>별관 2층 비아제 디너뷔페를 매주 금요일 ~ 일요일 18:00 ~ 21:00 이용하실 수 있습니다.<b><span style="color: rgb(255, 0, 0);">(현재 리뉴얼 오픈 준비중, 5월오픈예정)</span></b>&nbsp;</p><p>또 보타보타 레스토랑이 별관 1층에 운영중이며 다이닝은 17:30 ~ 24:00 (20:30 이후 치킨, 피자만 가능 / LAST ORDER : 23:00) 운영되고 있습니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>13</td>
						<td>다이닝</td>
						<td class="text-left">
							<div class="td_inner_box">소아조식 이용가능나이가 어떻게 되나요 ?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>소인(37개월~만12세) 투숙객의 경우 할인가 적용되어 13,200원에 이용 가능하며, 36개월 이하 영유아는 무료 이용 가능합니다.</p><p>단, 사전 예약 시 상기 할인이 적용되며 당일 이용의 경우 소인 정상가 16,500원이 적용됩니다.</p></td>
					</tr>
										<tr>
						<td>14</td>
						<td>다이닝</td>
						<td class="text-left">
							<div class="td_inner_box">조식 쿠폰 구매시 투숙객 에게는 할인가 적용 되나요??</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>조식 할인은 투숙객도 전날까지 구매해야 할인가가 적용되며, 당일 이용 시 성인 24,200원 / 소인 16,500원 정상가로 구매해야 합니다.</p></td>
					</tr>
										<tr>
						<td>15</td>
						<td>객실/예약</td>
						<td class="text-left">
							<div class="td_inner_box">객실 정원 외 초과 인원 투숙이 가능한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>객실&nbsp;정원&nbsp;초과 시 추가 인원&nbsp;투숙은 불가합니다.&nbsp;</p></td>
					</tr>
										<tr>
						<td>16</td>
						<td>객실/예약</td>
						<td class="text-left">
							<div class="td_inner_box">호텔 도착이 늦는 경우 몇 시까지 체크인을 해야 하나요 ?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>프론트는 24시간 운영하고 있어 늦게 오셔도 체크인 가능합니다. </p><p>체크아웃 시간은 체크인과 관계없이 주중/주말 11시 입니다. &nbsp;</p><p>&nbsp;</p><p>※ 새벽 늦게 오시는 분들은 사전에 연락 주시면 감사하겠습니다.</p><p>&nbsp;</p></td>
					</tr>
										<tr>
						<td>17</td>
						<td>객실/예약</td>
						<td class="text-left">
							<div class="td_inner_box">얼리 체크인 및 체크아웃 연장이 가능 한가요?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>현장에서 확인 가능하며, 체크아웃 연장 시 1시간에 11,000원의 요금이 부가됩니다. </p></td>
					</tr>
										<tr>
						<td>18</td>
						<td>객실/예약</td>
						<td class="text-left">
							<div class="td_inner_box">객실 크기가 어떻게 되나요 ?</div>
						</td>
					</tr>
					<tr>
						<td class="td_content_view"><span class="td_bg"></span></td>
						<td class="td_content_view"></td>
						<td class="td_content_view td_left"><p>수페리어 22~23㎡ / 디럭스 34~39㎡ / 스위트 36~88㎡로 객실마다 상이하며 자세한 내용은 홈페이지 ACCOMMODATION에서 확인 가능합니다.</p></td>
					</tr>
									</tbody>
			</table>
		</div><!-- e: faq_box_01 -->
	</div><!-- e: faqbox -->

		<div class="pager">
		<ul>
			<li class="page_prev"><img src="/img/sub/page_prev.png" alt="" /></li> <li class="num on"><a>1</a></li>  <li class="page_next"><img src="/img/sub/page_next.png" alt="" /></li>
		</ul>

        </div>
                     </div>
 <!--               </div>
            </div> -->
        </section>
        <section class="contact-section" id=signup>
        <jsp:include page="footer.jsp"/>
        </section>
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

<%-- <script src="<c:url value='/resources/js/QandA.js' />"></script> --%>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){

        $('.text-left').click(function(){
			//초기화
			$('.td_content_view').hide();
			var test = $(this).parent().next().find('.td_content_view');

			//해당 객체에 on이 붙지 않았을때
			if(test.hasClass('on')!==true){
				test.show();
				//전체 지우고
				$('.td_content_view').removeClass('on');
				//선택 키고
				test.addClass('on');
			}
			//붙었을때
			else{
				test.hide();
				//전체 지우고
				$('.td_content_view').removeClass('on');
				//선택 키고
				test.removeClass('on');
			}
        });
        $('.submit_button').click(function(){
        	$('#search_form').submit();
		
        });
     });
</script>
</html>