<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empview</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black; padding:5px 5px;}
</style>
<body>
<input type=text id=txtkeyword><button id=btnShow>직원명단</button>
<table id=tblEmp></table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#btnShow',function(){
	$.ajax({
		url:'/drill/empview',
		data:{kw:$('#txtkeyword').val()},
		datatype:'json',
		method:'get',
		beforeSend:function(){
			$('#tblEmp').empty();
		},
		success:function(txt){
			console.log(txt);
			$('#tblEmp').append("<tr><th>직원사번</th><th>직원이름</th><th>전화번호</th><th>매니저아이디</th><th>입사일자</th></tr>");
			for(i=0; i<txt.length; i++) {
				let str="<tr><td>"+txt[i]['employee_id']+"</td><td>"+txt[i]['emp_name']+"</td><td>"
						+txt[i]['phone_number']+"</td><td>"+txt[i]['manager_id']+"</td><td>"
						+txt[i]['hire_date']+"</td></tr>";
				console.log(str);
				$('#tblEmp').append(str);
			}
		}
	});
})
</script>
</html>