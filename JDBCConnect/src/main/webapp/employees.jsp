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
String sql="select a.department_id as did, a.department_name as dname, nvl(b.emp_name,'-') as ename, nvl(c.department_name,'-') as pname"+
			" from departments a, employees b, departments c"+
			" where a.manager_id=b.employee_id(+)"+
			" and a.parent_id=c.department_id(+)";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
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
		
		int did=rs.getInt("did");
		String dname=rs.getString("dname");
		String ename=rs.getString("ename");
		String pname=rs.getString("pname");
%>
		<tr>
			<td><%=did%></td>
			<td><%=dname%></td>
			<td><%=ename%></td>
			<td><%=pname%></td>
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