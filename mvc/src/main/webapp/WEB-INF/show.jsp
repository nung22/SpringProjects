<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Figtree'>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Reading Books</title>
</head>
<body>
    <div class="container">
        <h1 class="mt-5 mb-3"><c:out value="${book.getTitle()}"></c:out></h1>
        <div class="info">
            <h4 class="fw-normal">Description: <c:out value="${book.getDescription()}"></c:out></h4>
            <h4 class="fw-normal">Language: <c:out value="${book.getLanguage()}"></c:out></h4>
            <h4 class="fw-normal">Number of Pages: <c:out value="${book.getNumberOfPages()}"></c:out></h4>
        </div>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>