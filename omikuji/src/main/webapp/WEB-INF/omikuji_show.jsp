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
	<title>Omikuji</title>
</head>
<body>
    <div class="container">
        <h1>Here's Your Omikuji!</h1>
        <div class="results">
            <p>In <c:out value="${number}"></c:out> years, you will<br>
                live in <c:out value="${city}"></c:out> with<br>
                <c:out value="${person}"></c:out> as your<br>
                roommate, <c:out value="${activity}"></c:out><br>
                for a living.<br>The next time you<br>
                see a(n) <c:out value="${organism}"></c:out> you will<br>
                have good luck.<br>
                Also, <c:out value="${phrase}"></c:out>.
            </p>
        </div>
        <a href="/" class="return btn btn-outline-success">Go Back</a>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>