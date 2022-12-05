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
        <h1 class="my-5">All Books</h1>
        <table style="width:50%; border: 3px solid black" class="table table-hover table-bordered text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Language</th>
                    <th># Pages</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var='book' items='${books}'>
                <tr>
                    <td scope="row"><c:out value="${book.getId()}"></c:out></td>
                    <td><a href="<c:url value = "/books/${book.getId()}"/>">
                        <c:out value="${book.getTitle()}">
                    </a></c:out></td>
                    <td><c:out value="${book.getLanguage()}"></c:out></td>
                    <td><c:out value="${book.getNumberOfPages()}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>