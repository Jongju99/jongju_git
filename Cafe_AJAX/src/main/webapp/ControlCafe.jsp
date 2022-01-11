<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페관리</title>
</head>
<!-- <link rel="stylesheet" type="text/css" href="Cafe.css"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style>
.toptbl {
	border: 1px solid rgb(25, 40, 35);
    border-radius: 10px 10px;
    width:90%;
    height: auto;
	padding: 5px 10px;
	margin: auto;
}
.sectbl{
	margin: 30px 0px 0px 30px;
	padding: 10px 20px;
	border-right: 1px solid #444444;
	height:500px;
}
.thrtbl{
	margin: 00px 30px 0px 0px;
}
.head{
	width:80%;
	margin: auto;
	text-align:center;
	background-color:white;
}
table {
	margin: auto;
    background-color: rgb(208, 198, 177);
}
caption,#dlgth th,p {
	font-size: 140%;
	font-weight: bold;
    border-radius: 40px 80px / 80px 40px;
    border: 2px solid rgb(25, 40, 35);
    width: 200px;
	background-color: rgb(33, 133, 89);
    text-align: center;
    vertical-align:middle;
    margin: 0 auto;
}
th {
	border: 1px solid rgb(25, 40, 35);
    border-collapse: collapse;
	padding: 3px 15px;
	margin: auto;
}
#selth th {
	padding: 3px 8px;
    border-radius: 20px 10px / 10px 20px;
    background-color: rgb(235, 176, 53);
}
#tblth th {
    border-radius: 20px 10px / 10px 20px;
    background-color: rgb(235, 176, 53);
	padding: 3px 15px;
}
#selSales th {
	padding: 5px 0px;
	margin: auto;
	font-size: 90%;
}
#selSales td {
	padding: 5px 0px ;
	margin: auto;
	font-size: 80%;
}
#tblMenu td,#selSumCust td,#selSumMenu td {
	border-bottom: 1px solid #444444;
}
#selSumCust{
	width: 225px
}
#selSales{
    background-color: #f5f5f5;
    width: 270px;
}
input {
    border-radius: 8px 8px / 8px 8px;
    background-color: #f5f5f5;
    text-align: right;
}
select,#menutbl,#sel {
    border-radius: 5px 5px / 5px 5px;
    border: 2px outset rgb(25, 40, 35);
    background-color: #f5f5f5;
    vertical-align:middle;
    margin: 0 auto;
    width: 300px;
}
div {
	background-repeat : no-repeat;
    background-image: url("https://mblogthumb-phinf.pstatic.net/20150920_165/namimo0303_1442719834179hIqUy_PNG/%C4%BF%C7%C7%C0%DC.png?type=w2");
}
#btnMenu,#btnSum {
    border-radius: 40px 80px / 80px 40px;
    background-color: rgb(235, 176, 53);
	font-weight: bold;
    padding: 0px 10px;
}
#btnReset,#btnCancel,#btnClose {
    border-radius: 40px 80px / 80px 40px;
    background-color: rgb(221, 30, 47);
	font-weight: bold;
    font-family: 'Gowun Dodum', sans-serif;
    padding: 0px 10px;
}
#btnAdd,#btnDone,#btnPlus {
    border-radius: 40px 80px / 80px 40px;
    background-color: rgb(6, 162, 203);
	font-weight: bold;
    font-family: 'Gowun Dodum', sans-serif;
    padding: 0px 10px;
}
* {
    font-size: large;
    font-family: 'Gowun Dodum', sans-serif;
}
img {
	margin: 0px 30px 0px 0px;
}
h1 {
	margin: 0px 0px 0px 30%;
	text-align:center;
	font-size: 200%;
}
</style>

<body>
<table class=head><tr><td>
<h1 style="float:left;">JongJu's Cafe :)</h1>
</td><td>
<img src="https://t.pimg.jp/047/101/866/1/47101866.jpg"
	 width="100" height="105" style="float:right;">
</td></tr></table>
<table class=toptbl><tr><td>
<table style="float:left;" class=sectbl><tr><td valign=middle>

	<table valign=middle>
		<caption>메뉴목록</caption>
		<tr><td colspan=2 align=right>
				<button id=btnMenu>메뉴관리</button>
			</td></tr>
		<tr><td align=center colspan=2>
				<table id=menutbl size=9 width="280">
					<thead><tr><th>메뉴이름</th><th>가격</th></tr></thead>
					<tbody></tbody>
				</table>
			</td></tr>
		<tr><td colspan=2>
			<select id=selMenu><option selected>메뉴선택</option></select></td></tr>
		<tr><td align=left>메뉴명</td>
			<td><input type=text id=menuname readonly></td></tr>
		<tr><td align=left>수량</td>
			<td><input type=number id=count min=1></td></tr>
		<tr><td align=left>금액</td>
			<td><input type=number id=menuprice readonly></td></tr>
		<tr><td align=right><button id=btnReset>비우기</button></td>
			<td align=right><button id=btnAdd>메뉴추가</button></td></tr>
	</table>

</td><td valign=middle>

	<table>
		<caption>주문목록</caption>
		<tr><td colspan=2></td></tr>
		<tr><td align=center colspan=2>
				<select id=selOrder size=10></select></td></tr>
		<tr><td align=left>총액</td>
			<td><input type=number id=total></td></tr>
		<tr><td align=left>모바일</td>
			<td><input type=text id=mobile></td></tr>
 		<tr><td colspan=2>&nbsp;</td></tr>
		<tr><td><button id=btnCancel>주문취소</button></td>
			<td align=right><button id=btnDone>주문완료</button></td></tr>
	</table>

</td></tr></table>
<table style="float:right;" class=thrtbl><tr><td valign=middle>

	<table>
		<caption>판매내역</caption>
		<tr><td colspan=2 align=right>
				<button id=btnSum>Summary</button>
			</td></tr>
		<tr><td align=center>
		  <table valign=top id=sel><tr><td>
			<table id=selSales>
					<thead><tr><th>고객번호</th><th>메뉴이름</th><th>수량</th><th>가격</th></tr></thead>
					<tbody></tbody>
			</table>
		  </td></tr></table>
		</td></tr>
	</table>

</td></tr></table>
</td></tr></table>

	<div id=dlgSum style='display:none;' title='Summary'>
		<table>
		<thead id=dlgth><tr><th>메뉴별 매출금액</th><th>고객별 매출금액</th></tr></thead>
		<tbody><tr>
		<td>
		<table id=selSumMenu>
		<thead id=selth><tr><th>메뉴명</th><th>수량</th><th>금액</th></tr></thead>
		<tbody></tbody>
		</table></td>
		<td valign=top><table id=selSumCust>
		<thead id=selth><tr><th>고객번호</th><th>금액</th></tr></thead>
		<tbody></tbody>
		</table></td>
		</tr></tbody>
		</table>
	</div>

	<div id=dlgMenu style='display:none;' title='메뉴관리'>
		<table><tr>
			<td>
				<table id=tblMenu>
					<caption>현재메뉴</caption>
					<thead id=tblth><tr><th>번호</th><th>메뉴이름</th><th>가격</th></tr></thead>
					<tbody></tbody>
				</table>
			</td>
			<td>
				<table valign=top>
				<tr><td colspan=2><p>수정하기</p></td></tr>
				<tr><td colspan=2>&nbsp;</td></tr>
				<tr><td>번호</td><td><input type=number id=code style='width: 150px'></td></tr>
				<tr><td>메뉴명</td><td><input type=text id=name style='width: 150px'></td></tr>
				<tr><td>가격</td><td><input type=number id=price min=0 step=500 style='width: 130px'> 원</td></tr>
				<tr><td colspan=2>&nbsp;</td></tr>
				<tr><td colspan=2 align=center>
					<input type="button" id=btnPlus value="수정">&nbsp;&nbsp;<input type="button" id=btnClose value="취소">
				</td></tr>
				</table>
			</td>
		</tr></table>
	</div>
</body>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="javaScriptCafe.js"></script>
<script>

</script>
</html>