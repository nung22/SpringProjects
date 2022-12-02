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
	<title>Fruit Store</title>
</head>
<body>
    <div class="container">
        <h1 class="title">Fruit Store</h1>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="fruit" items="${fruits}">
                <tr>
                    <td scope="row"><c:out value="${fruit.name}"></c:out></td>
                    <td><c:out value="${fruit.price}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
	<!-- YOUR own local JS -->
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- For any Bootstrap that uses JS or jQuery-->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>