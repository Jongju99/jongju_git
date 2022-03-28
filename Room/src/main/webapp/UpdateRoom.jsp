<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection conn=null;
PreparedStatement pstmt=null;

String url="jdbc:oracle:thin:@localhost:1521:orcl";
String userid="orauser";
String passcode="human123";
String sql="update room set name=?,type=?,howmany=?,howmuch=? where code=?";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateRoom</title>
</head>
<body>
<% 
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1,request.getParameter("newname"));
	pstmt.setInt(2,Integer.parseInt(request.getParameter("type")));
	pstmt.setInt(3,Integer.parseInt(request.getParameter("howmany")));
	pstmt.setInt(4,Integer.parseInt(request.getParameter("howmuch")));
	pstmt.setInt(5,Integer.parseInt(request.getParameter("code")));
			
	pstmt.executeUpdate();
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	response.sendRedirect("ControlRoom.jsp");
}
%>
</body>
</html>