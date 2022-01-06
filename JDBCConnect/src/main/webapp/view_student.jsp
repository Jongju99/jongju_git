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
String sql="select * from student";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>
</head>

<style>
table {
	border-collapse:collapse;
}
td {
	border:1px solid forestgreen; 
	background-color:yellowgreen;
	padding: 5px;
	text-align: center;
    vertical-align:middle;
    margin: 0 auto;
}
</style>

<body>
<table>
	<tr>
		<th>학생명</th>
		<th>수학</th>
		<th>국어</th>
    </tr>

<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()) {
		/*out.println("<tr><td>"+eid+"</td><td>"+ename+"</td><td>"
				+salary+"</td><td>"+mid+"</td><td>"+did+"</td><td>"
				+jobid+"</td></tr>"); */
		
		String name=rs.getString("name");
		int math=rs.getInt("math");
		int korean=rs.getInt("korean");
%>
		<tr>
			<td><%=name%></td>
			<td><%=math%></td>
			<td><%=korean%></td>
		</tr>
<%
	}
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</table>
</body>
</html>