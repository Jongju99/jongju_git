<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<p>${userid}</p>
<p>${passcode}</p>
<%-- <c:if test="${id==null}">
<a href="/edu/login">로그인</a>&nbsp;&nbsp;<a href="/edu/signon">회원가입</a><br>
</c:if>
<c:if test="${id!=null}">
${id}&nbsp;<a href="/edu/logout">로그아웃</a>
</c:if> --%>
</body>
<script>

</script>
</html>
