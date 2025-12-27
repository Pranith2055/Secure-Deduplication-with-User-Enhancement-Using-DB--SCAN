<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Search Result</h2>

    <p><strong>Keyword:</strong> ${keyword}</p>
    <p><strong>Original Text:</strong></p>
    <textarea rows="10" cols="60" readonly>${textdata}</textarea>
    <p><strong>Encrypted SHA:</strong> ${crypto}</p>
    <p><strong>Storage Key:</strong> ${skey}</p>
    <p><strong>User ID:</strong> ${userid}</p>

    <br/><br/>
    <a href="search.jsp">Search Again</a>

</body>
</html>