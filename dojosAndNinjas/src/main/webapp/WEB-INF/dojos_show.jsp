<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Figtree'>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>New Dojo</title>
</head>
<body>
    <div class="container">
		<div class="header">
        	<h1 class="my-4 text-primary"><c:out value="${dojo.getName()}"/> Location Ninjas</h1>
        	<a class="btn btn-outline-success" href="/">Add New Dojo</a>
        </div>  
        <table class="table table-borderless table-striped text-center">
            <thead>
                <tr class="fs-5">
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="oneNinja" items="${ninjas}">
                <tr class="align-middle">
                    <td scope="row"><c:url value="${oneNinja.getFirstName()}"/></td>
                    <td><c:url value="${oneNinja.getLastName()}"/></td>
                    <td><c:url value="${oneNinja.getAge()}"/></td>
                    <td><a class="btn btn-danger delete" href="<c:url value='/ninjas/delete/${oneNinja.getId()}'/>">delete</a></td>
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