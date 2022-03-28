<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직위별 명단조회</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black; padding:5px 5px;}
</style>
<body>
<h1>직위별 명단조회</h1>
직위명 :<select id=selJob>
<option selected>직위 선택</option>
<c:forEach var="j" items="${jl}">
	<option value=${j.job_id}>${j.job_title}</option>
</c:forEach>
</select><br><br>
<table id=tblJob></table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('change','#selJob',function(){
	$.ajax({
		url:'/drill/jobview',
		data:{Jid:$('#selJob').val()},
		datatype:'json',
		method:'get',
		beforeSend:function(){
			$('#tblJob').empty();
		},
		success:function(txt){
			console.log(txt);
			$('#tblJob').append("<tr><th>직원사번</th><th>직원이름</th><th>전화번호</th><th>사원아이디</th></tr>");
			for(i=0; i<txt.length; i++) {
				let str="<tr><td>"+txt[i]['employee_id']+"</td><td>"+txt[i]['emp_name']+"</td><td>"
						+txt[i]['phone_number']+"</td><td>"+txt[i]['department_id']+"</td></tr>";
				console.log(str);
				$('#tblJob').append(str);
			}
		}
	});
})
</script>
</html>