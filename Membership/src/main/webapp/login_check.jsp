<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
String userid= request.getParameter("userid");
String passcode= request.getParameter("passcode");
String jspfile=null;
if(request.getParameter("userid").equals(application.getAttribute("userid")) && 
	request.getParameter("passcode").equals(application.getAttribute("passcode"))){
	
	session.setAttribute("userid",userid);
	session.setAttribute("passcode",passcode);
	jspfile="home.jsp";
} else {
	jspfile="login.jsp";
}
%>
<jsp:forward page="<%=jspfile %>" />