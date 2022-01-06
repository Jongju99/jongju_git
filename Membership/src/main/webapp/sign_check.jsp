<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String[] interest = request.getParameterValues("interest");
//	pageContext.setAttribute("areas",interest);
	pageContext.setAttribute("areas",String.join(",",interest));
%>
이름:<c:out value="${param.name }"/><br>
성별:<c:out value="${param.gender }"/><br>
아이디:<c:out value="${param.userid }"/><br>
비밀번호:<c:out value="${param.passcode }"/><br>
비밀번호확인:<c:out value="${param.passcode1 }"/><br>
관심분야:
<c:forTokens var="area" items="${areas }" delims=",">
	<br><c:out value="${area }"/>
</c:forTokens>

<%--  	<c:forEach var="area" items="${areas }">
		<c:out value="${area }"/>,
	</c:forEach>  --%>
	
<%
/* response.sendRedirect("login.jsp");

String id=request.getParameter("userid");
String pass=request.getParameter("passcode");

application.setAttribute("userid",id);
application.setAttribute("passcode",pass); */
%>
