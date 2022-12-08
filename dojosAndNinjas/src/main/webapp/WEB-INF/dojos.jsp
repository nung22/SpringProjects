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
        	<h1 class="mt-4 text-primary">Dojos and Ninjas</h1>
        	<a class="btn btn-outline-success" href="/ninjas/new">Add New Ninja</a>
        </div>
        <table class="table table-hover">
            <thead>
                <tr class="fs-5">
                    <th>Location</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var='oneDojo' items='${dojos}'>
                <tr class="align-middle">
                    <td scope="row"><a href="<c:url value='/dojos/${oneDojo.getId()}'/>">
                    <c:out value="${oneDojo.getName()}"/></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
		<form:form action="/dojos" method="post" modelAttribute="dojo">
		    <h3 class="text-success">New Dojo:</h3>
		    <h6><form:errors path="name" class="text-danger"/></h6>
		    <p>
		        <form:label path="name">Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <input class="btn btn-success submit" type="submit" value="Create"/>
		</form:form>    
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>