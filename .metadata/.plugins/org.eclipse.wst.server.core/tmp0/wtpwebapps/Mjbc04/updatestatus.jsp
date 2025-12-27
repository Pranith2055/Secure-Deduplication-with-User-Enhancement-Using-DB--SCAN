<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.controller.DAO"%>
<%@page import="java.sql.Connection"%>
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
String fname=request.getParameter("Filename");

String sql="select skey from uploads where keyword='"+fname+"'";
Connection con=DAO.getConnection();
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	String key=rs.getString(1);
	
	sql="update searchdata set status='"+key+"' where fname='"+fname+"'";
	
	ps=con.prepareStatement(sql);
	ps.executeUpdate();
	response.sendRedirect("spdashboard.jsp");
}else{
	response.sendRedirect("userrequest.jsp");
}

%>

</body>
</html>