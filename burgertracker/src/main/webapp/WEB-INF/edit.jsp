<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Burger Tracker</title>
</head>
<body>
    <div class="container">
		<div class="header">
        	<h1 class="mt-4 text-primary">Edit Burger</h1>
        	<a href="/">Go back</a>
        </div>
		<form:form action="/burgers/${burger.id}" method="post" modelAttribute="burger">
		    <h6><form:errors path="name" class="text-danger"/></h6>
		    <h6><form:errors path="restaurant" class="text-danger"/></h6>
		    <h6><form:errors path="rating" class="text-danger"/></h6>
		    <h6><form:errors path="notes" class="text-danger"/></h6>
			<input type="hidden" name="_method" value="put">
		    <p>
		        <form:label path="name">Burger Name</form:label>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:label path="restaurant">Restaurant Name</form:label>
		        <form:input path="restaurant"/>
		    </p>
		    <p>
		        <form:label path="rating">Rating</form:label>       
		        <form:input type="number" min="0" max="5" path="rating"/>
		    </p>    
		    <p>
		        <form:label path="notes">Notes</form:label>
		        <form:textarea path="notes"/>
		    </p>
		    <input class="btn btn-success" type="submit" value="Submit"/>
		</form:form>    
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>