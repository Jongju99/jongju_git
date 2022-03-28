<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페관리</title>
</head>
<body>
<table>
<tr>
	<td>
		<select id=selMenu style='width:250px;' size=10>
<%-- <c:forEach var="menu" items="${ml}">
	<option value=${menu.code}>${menu.name}, ${menu.price}</option>
</c:forEach>  --%>
		</select>
	</td>
	<td>
		<form action="/drill/addMenu" id="frmAddMenu">
		<input type=hidden name=code id=code>
		<table>
		<tr><td align=right>MenuName :</td>
			<td><input type=text name=menu_name></td>
		</tr>
		<tr><td align=right>Price :</td>
			<td><input type=number name=price></td>
		</tr>
		<tr><td colspan=2 align=right>
			<input type=submit value="ADD">
			<input type=button value="DELETE" id=btnDelete>
			<input type=reset value="RESET"></td>
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
	loadMenu();
})
.on('click','#btnAdd',function(){
	$.ajax({
		url:"/drill/addMenu",
		data:{code:$('#code').val(),menu_name:$('#menu_name').val(),price:$('#price').val()},
		method:'get',
		datatype:'json',
		beforeSend:function(){},
		success:function(data){
			loadMenu();
		}
	});
	return false;
})
.on('click','#selMenu option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=menu_name]').val(ar[0]);
	$('input[name=price]').val($.trim(ar[1]));
	return false;
})
.on('click','#btnDelete',function(){
	let url="/drill/deleteMenu?code="+$('#code').val();
	console.log(url);
	document.location=url;
	return false;
})
function loadMenu(){
	$('#code','#menu_name','#price').val('');
	$.ajax({
		url:'/drill/menulist',
		data:{},
		datatype:'json',
		method:'get',
		success:function(txt){
			console.log(txt);
			$('#selMenu').empty();
			for(i=0; i<txt.length; i++) {
				let str="<option value="+txt[i]['code']+">"+txt[i]['name']+", "+txt[i]['price']+"</option>";
				console.log(str);
				$('#selMenu').append(str);
			}
		}
	});
}
/* .ready(function(){
	$.ajax({
		url:'/drill/menulist',
		data:{},
		datatype:'json',
		method:'get',
		success:function(txt){
			console.log(txt);
			$('#selMenu').empty();
			for(i=0; i<txt.length; i++) {
				let str="<option value="+txt[i]['code']+">"+txt[i]['name']+", "+txt[i]['price']+"</option>";
				console.log(str);
				$('#selMenu').append(str);
			}
		}
	});
}) */

/* .on('submit',"#frmAddMenu",function(){
	co
	if($('input[name=menu_name]').val()==''||$('input[name=price]').val()==''){
		alert('두값이 입력되어야 합니다..');
		return false;
	}
	return false;
})
 */
</script>
</html>