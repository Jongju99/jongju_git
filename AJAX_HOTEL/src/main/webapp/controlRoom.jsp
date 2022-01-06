<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
* {
    font-family: 'Gowun Dodum', sans-serif;
}
table,th {
	border-collapse:collapse;
	background-color: gold;
	padding: 5px 10px;
}
h1{
	border:2px solid gold;
	border-radius: 5px 10px / 5px 10px;
	background-color: seagreen;
	width: 600px;
	padding: 5px 10px;
	margin: auto;
}
.room {
	font-size:120%;
	margin-top:5%;
    margin-left: 15%;
}
.update {
	font-size:120%;
	margin-top:5%;
	margin-right: 15%;
}
.cap {
	font-size:140%;
	font-weight: bold;
	border:2px solid gold;
	border-radius: 5px 10px / 5px 10px;
	background-color: seagreen;
	margin: auto;
}
.btn {
	background-color: white;
	border-radius: 5px 10px / 5px 10px;
	padding: 3px 8px;
	margin: auto;
	font-size: 100%;
}
td {
	border-radius: 10px 10px / 10px 10px;
	border:2px solid gold; 
	background-color:khaki;
	text-align: center;
    vertical-align:middle;
    padding: 5px 10px;
    margin: auto;
}
body{
	height: 100vh; 
    background-image: url("https://koreashe.org/wp-content/uploads/2020/08/trd032tg02435-1-1.jpg");
    background-repeat : no-repeat;
    background-size : cover; 
}
</style>
<body>
<br><br>
<h1 align=center>객실관리 Welcome to our Hotel</h1>

<table id=tblRoom class=room style="float:left;"> <!-- 객실목록 -->
<caption class=cap>현재객실</caption>
<thead>
	<tr><th>객실번호</th><th>객실명</th><th>객실종류</th><th>숙박가능인원</th><th>숙박비</th></tr>
</thead>
<tbody>
</tbody>
</table>

<table class=update style="float:right;"><!-- 입력부분 -->
<caption class=cap>객실수정</caption>
<tr><td>객실번호</td><td><input type=number id=code></td></tr>
<tr><td>객실명</td><td><input type=text id=name></td></tr>
<tr><td>객실종류</td><td><input type=number id=type></td></tr>
<tr><td>숙박가능인원</td><td><input type=number id=howmany></td></tr>
<tr><td>숙박비</td><td><input type=number id=howmuch></td></tr>
<tr><td colspan=2 align=center><input class=btn type=button id=btnGo value='전송'>&nbsp;&nbsp;<input class=btn type=reset value='취소'></td></tr>
</table>

</body>

<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
 	loadRoom();
	return false;
})
.on('click','#btnGo',function(){
	let operation='';
	
	if($('#code').val()!=''){
		if($('#name').val()!='' && $('#type').val()!='' && $('#howmany').val()!='' && $('#howmuch').val()!=''){	//update
			operation="update";
		} else {
			operation="delete";
		}
	} else {
		if($('#name').val()!='' && $('#type').val()!='' && $('#howmany').val()!='' && $('#howmuch').val()!=''){	//just insert
			operation="insert";
		} else {
			alert('객실명을 입력하세요.');
			return false;
		}	
	}
	
	$.get(operation,{code:$('#code').val(),
					name:$('#name').val(),
					type:$('#type').val(),
					howmany:$('#howmany').val(),
					howmuch:$('#howmuch').val()},
		function(txt){
			$('#name,#type,#howmany,#howmuch,#code').val('');
			loadRoom();
		},'text');
});
function loadRoom(){
	$('#tblRoom tbody').empty();
	$.get('select',{},function(txt){
 		
 		if(txt=='') return false;
		
 		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]+
					 '</td><td>'+field[3]+'</td><td>'+field[4]+'</td></tr>';
			$('#tblRoom tbody').append(html);
		}
	},'text'); 
}
</script>
</html>
