<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
table {
	border-collapse:collapse;
	border:solid 1px gold;
}
td {
	border:2px solid gold;
	padding:10px 10px;
}

</style>
<body>
<form method=post action="/member/signCheck">
<br><br>
<h1 align=center>Join :)</h1>
<br>
<table align=center>
<tr>
	<td class=td>이름</td><td><input class=sub type=text name=name id=name></td>
	<td class=td>성별</td>
	<td>
	<input type="radio" name="gender" value="Male">남성&nbsp;&nbsp;
	<input type="radio" name="gender" value="Female">여성
	</td>
</tr>
<tr>
	<td class=td>아이디</td><td><input class=sub type=text name=userid id=userid></td>
	<td colspan=2><input type=button id=btnCheck value='중복확인'></td>
</tr>
<tr>
	<td class=td>비밀번호</td><td><input class=sub type="password" name=passcode id=passcode></td>
	<td class=td>비밀번호 확인</td><td><input class=sub type="password" name=passcode1 id=passcode1></td>
</tr>
<tr>
	<td class=td>모바일번호</td><td><input class=sub type=text name=mobile id=mobile></td>
	<td colspan=2></td>
</tr>
<tr>
	<td class=td>관심분야</td>
	<td>
	<input type=checkbox name=interest id=interest value='정치'>정치&nbsp;&nbsp;
	<input type=checkbox name=interest id=interest value='경제'>경제&nbsp;&nbsp;
	<input type=checkbox name=interest id=interest value='사회'>사회<br>
	<input type=checkbox name=interest id=interest value='문화'>문화&nbsp;&nbsp;
	<input type=checkbox name=interest id=interest value='역사'>역사&nbsp;&nbsp;
	<input type=checkbox name=interest id=interest value='연예'>연예<br>
	<input type=checkbox name=interest id=interest value='스포츠'>스포츠&nbsp;&nbsp;
	<input type=checkbox name=interest id=interest value='예술'>예술
	</td>
	<td colspan=2 align=center>
		<input class=btn type=submit value='가입완료'>&nbsp;&nbsp;
		<input class=btn type=button id=btnback value='취소' onclick='document.location="/member/"'>
	</td>
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCheck',function(){
	   let userid=$('#userid').val();
	   let flag=true;
	   $.ajax({
		   url:'/member/idCheck',
		   data:{},
		   dataType:'json',
		   method:'post',
		   success:function(txt){
	         for(i=0; i<txt.length; i++){
	            console.log(txt[i].userid+","+userid);
	            if(txt[i].userid==userid){
	               alert('중복된 아이디입니다.')
	               flag=false;
	            }
	         }
	      },
	      complete:function(){
	         if(flag==false) return false;
	         else alert('사용할수있는 아이디입니다.')
	      }
	   });
})
.on('submit',function(){
	if($('input[name=passcode]').val()!=$('input[name=passcode1]').val()){
		alert('비밀번호를 다시 확인해주세요');
		return false;
	}
	if($('input[name=name]').val()==""){
		alert('이름을 확인해주세요');
		return false;
	}  
	if($('input[name=mobile]').val()==""){
		alert('전화번호를 확인해주세요');
		return false;
	} 
	if ($('input:radio[name=gender]').is(":checked")==false){
		alert('성별을 확인해주세요');
		return false;
	}
	if ($('input:checkbox[name=interest]').is(":checked")==false){
		alert('관심분야를 확인해주세요');
		return false;
	} 
})

</script>
</html>