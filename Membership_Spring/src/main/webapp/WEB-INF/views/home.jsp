<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body align=right>
<h1 align=center>Hello world!</h1>
<c:if test="${id==null}">
<a href="/member/login">로그인</a>&nbsp;&nbsp;<a href="/member/signon" align=right>회원가입</a><br>
</c:if>
<c:if test="${id!=null}">
${id}&nbsp;<a href='/member/logout?userid=${id}'>로그아웃</a>
</c:if>
</body>
</html>
