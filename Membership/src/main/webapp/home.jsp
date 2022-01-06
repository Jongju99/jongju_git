<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="Membership.css">
</head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Poor+Story&display=swap" rel="stylesheet">

<body align=right>
<jsp:include page="header.jsp"/>
<% 
	String userid=(String)session.getAttribute("userid");
	if(userid==null){
		out.println("<a href='login.jsp'>로그인</a>&nbsp;<a href='signon.jsp'>회원가입</a>&nbsp;&nbsp;");
	} else {
		out.print(request.getParameter("userid")+"&nbsp;<a href='logout.jsp'>로그아웃</a>&nbsp;&nbsp;");
	}

%>
</body>
</html>