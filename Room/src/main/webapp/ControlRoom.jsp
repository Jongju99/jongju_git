<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

String url="jdbc:oracle:thin:@localhost:1521:orcl";
String userid="orauser";
String passcode="human123";
String sql="select * from room order by code";

%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>ControlRoom</title>
</head>

<style>
* {
    font-family: 'Gowun Dodum', sans-serif;
}
table,th {
	border-collapse:collapse;
	background-color: gold;
	padding: 5px 10px;
    margin: auto;
}
.menu {
	font-size:150%;
/* 	//         위 오른쪽 아래 왼쪽  (여백) */
	margin: 30px;
}
.update{
	font-size:100%;
}
td {
	border-radius: 10px 10px / 10px 10px;
	border:2px solid gold; 
	background-color:#deb887;
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
<table class=menu>
<thead>
	<tr>
	<th>객실코드</th>
	<th>객실명</th>
	<th>객실타입</th>
	<th>숙박가능인원</th>
	<th>숙박비</th>
	</tr>
</thead>
<tbody>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()) {
		int code=rs.getInt("code");
		String name=rs.getString("name");
		int type=rs.getInt("type");
		int howmany=rs.getInt("howmany");
		int howmuch=rs.getInt("howmuch");
		out.println("<tr><td>"+code+"</td><td>"+name+"</td><td>"+type+
				"</td><td>"+howmany+"</td><td>"+howmuch+"</td></tr>");
	}
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</tbody>
</table><br><br><br>
<form method="get" action="" id=frmMenu>
<table class=update id=tblRoom>
<tr><td>현재객실코드</td><td><input type=text id=code name=code></td></tr>
<tr><td>객실명</td><td><input type=text id=newname name=newname></td></tr>
<tr><td>객실타입</td><td><input type=number id=type name=type></td></tr>
<tr><td>숙박가능인원</td><td><input type=number id=howmany name=howmany></td></tr>
<tr><td>숙박비</td><td><input type=number id=howmuch name=howmuch></td></tr>
<tr><td colspan=2><input type=submit value="전송">&nbsp;<input type=reset value="취소"></tr>
</table>
</form> 
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmMenu',function(){
	if($('#code').val()!=''){	//update or delete
		if($('#newname').val()!='' && $('#type').val()!='' 
			&& $('#howmany').val()!='' && $('#howmuch').val()!=''){	//update
			$('#frmMenu').prop('action','UpdateRoom.jsp');
		} else {	//delete
			$('#frmMenu').prop('action','DeleteRoom.jsp');
		}
	} else {	//insert
		if($('#newname').val()!='' && $('#type').val()!='' 
				&& $('#howmany').val()!='' && $('#howmuch').val()!=''){	//just insert
			$('#frmMenu').prop('action','InsertRoom.jsp');
		} else {
			alert('객실명을 입력하세요.');
			return false;
		}	
	}
	return true;
});
</script>
</html>