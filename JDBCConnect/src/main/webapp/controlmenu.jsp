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
String sql="select * from menu order by price";

%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>ControlMenu</title>
</head>

<style>
* {
    font-family: 'Gowun Dodum', sans-serif;
}
h1 {
	border:2px solid black;
	border-radius: 5px 10px / 5px 10px;
	background-color: rgb(208, 198, 177);
	text-align: center;
    vertical-align:middle;
	width: 600px;
	margin: auto;
}
table, th {
	border-collapse:collapse;
	background-color: #FFFAFA;
	padding: 5px 10px;
    margin: 80px auto 0;
}
.menu {
	font-size:150%;
}
.update{
	font-size:100%;
	margin: auto;
}
td {
	border-radius: 10px 10px / 10px 10px;
	border:1px solid rgb(25, 40, 35); 
	background-color:rgb(208, 198, 177);
	text-align: center;
    vertical-align:middle;
    padding: 5px 10px;
    margin: auto;
}
body{
	height: 100vh; 
    background-image: url("https://www.canceranswer.co.kr/news/photo/202011/1601_2612_1945.jpg");
    background-repeat : no-repeat;
    background-size : cover; 
}
</style>

<body>
<h1>메뉴관리 Welcome :)</h1>
<table class=menu>
<thead>
	<tr><th>메뉴명</th><th>가격</th></tr>
</thead>
<tbody>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()) {
		String name=rs.getString("name");
		int price=rs.getInt("price");
		out.println("<tr><td>"+name+"</td><td>"+price+"</td></tr>");
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
<table class=update>
<tr>
	<td>현재메뉴명</td><td><input type=text id=name name=name></td>
</tr>
<tr>
	<td>메뉴명</td><td><input type=text id=newname name=newname></td>
</tr>
<tr>
	<td>가격</td><td><input type=number id=price name=price></td>
</tr>
<tr>
	<td colspan=2><input type=submit value="전송">&nbsp;<input type=reset value="취소">
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmMenu',function(){
	if($('#name').val()!=''){	//update or delete
		if($('#newname').val()!=''){	//update
			$('#frmMenu').prop('action','updatemenu.jsp');
		} else {	//delete
			$('#frmMenu').prop('action','deletemenu.jsp');
		}
	} else {	//insert
		if($('#newname').val()!='' && $('price').val()!=''){	//just insert
			$('#frmMenu').prop('action','addmenu.jsp');
		} else {
			alert('메뉴명과 가격이 모두 입력되어야 합니다.');
			return false;
		}	
	}
	return true;
});
</script>
</html>