<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<body>
<table>
<tr>
	<td>
		<select id=selRoom style='width:250px;' size=10>
<%-- <c:forEach var="room" items="${rl}">
	<option value='${room.code}'>${room.name}, ${room.typename}, ${room.howmany}, ${room.howmuch}</option>
</c:forEach>  --%>
		</select>
	</td>
	<td>
		<form id=frmRoom action="/drill/addRoom">
		<input type=hidden name=code id=code>
			<table>
			<tr><td align=right>객실명:</td>
				<td><input type=text name=name></td>
			</tr>
			<tr><td align=right>타입:</td>
				<td>
					<select id=type name=type style='width:170px;'>
<%--					<option selected>타입선택</option>
 		<c:forEach items="${types}" var="roomtype">
			<option value=${roomtype.typecode}>${roomtype.typename}</option>
		</c:forEach> --%>
					</select>
				</td>
			</tr>
			<tr><td align=right>숙박가능인원:</td>
				<td><input type=number name=howmany></td>
			</tr>
			<tr><td align=right>숙박비:</td>
				<td><input type=number name=howmuch></td>
			</tr>
			<tr><td colspan=2 align=right>
				<input type=submit value='ADD'>
				<input type=button value='DELETE' id='btnDelete'>
				<input type=reset value='RESET'></td>
			</tr>
			</table>
		</form>
	</td>
</tr>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$.ajax({
		url:'/drill/roomlist',
		data:{},
		datatype:'json',
		method:'get',
		success:function(txt){
			console.log(txt);
			$('#selRoom').empty();
			for(i=0; i<txt.length; i++) {
				let str="<option value="+txt[i]['code']+">"+txt[i]['name']+", "
						+txt[i]['typename']+", "+txt[i]['howmany']+", "
						+txt[i]['howmuch']+"</option>";
				console.log(str);
				$('#selRoom').append(str);
			};
		}
	});
	$.ajax({
		url:'/drill/typeList',
		data:{},
		datatype:'json',
		method:'get',
		success:function(txt){
			console.log(txt);
			$('#type').empty();
			$('#type').append("<option selected>타입 선택</option>");
			for(i=0; i<txt.length; i++) {
				let str="<option value="+txt[i]['typecode']+">"+txt[i]['typename']+"</option>";
				console.log(str);
				$('#type').append(str);
			};
		}
	});
})


/* .on('click','#btnDelete',function(){
	let url="/drill/deleteRoom?code="+$('#code').val();
	console.log(url);
	document.location=url;
	return false;
})
.on('click','#selRoom option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=name]').val(ar[0]);
	
	let roomtype=$.trim(ar[1]);
	$('#type').val('');
	$('#type option').each(function(){
		if($(this).text()==roomtype){
			$(this).prop('selected','selected');
			return false;
		}
	})
	
	$('input[name=howmany]').val($.trim(ar[2]));
	$('input[name=howmuch]').val($.trim(ar[3]));
	return false;
})
.on('submit',"#frmRoom",function(){
	concole.log("1")
	if($('input[name=name]').val()=='' || $('input[name=type]').val()==''
		|| $('input[name=howmany]').val()=='' || $('input[name=howmuch]').val()==''){
		alert('값이 입려되어야 합니다.');
		return false;
	}
	return false;
}) */
</script>
</html>