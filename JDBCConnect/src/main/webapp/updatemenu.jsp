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
String sql="update menu set name=?,price=? where name=?";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMenu</title>
</head>
<body>
<% 
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,userid,passcode);
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1,request.getParameter("newname"));
	pstmt.setInt(2,Integer.parseInt(request.getParameter("price")));
	pstmt.setString(3,request.getParameter("name"));
			
	pstmt.executeUpdate();
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	response.sendRedirect("controlmenu.jsp");
}
%>
</body>
</html>