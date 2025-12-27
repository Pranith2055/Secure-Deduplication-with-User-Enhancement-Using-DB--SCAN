<%@page import="com.controller.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int id=Integer.parseInt(request.getParameter("Id"));
String fname=request.getParameter("FName");


String uid=(String)session.getAttribute("user");


int i=DAO.sendrequest(id, fname, uid);
if(i>0){
response.sendRedirect("Search.jsp");%>
<p>Sucessfully sent</p>


<script type="text/javascript">
       
        alert("Request Sent sucessfully!");
    </script>


 


	
	
<% }%>


</body>
</html>