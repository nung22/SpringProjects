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
	<title>New Ninja</title>
</head>
<body>
	<div class="container">
		<div class="header">
        	<h1 class="mt-4 text-success">New Ninja</h1>
        	<a class="btn btn-outline-success" href="/">Add New Dojo</a>
        </div>
		<form:form action="/ninjas/new" method="post" modelAttribute="ninja">
		    <h6><form:errors path="firstName" class="text-danger"/></h6>
		    <h6><form:errors path="lastName" class="text-danger"/></h6>
		    <h6><form:errors path="age" class="text-danger"/></h6>
		    <p>
		        <form:label path="dojo">Dojo:</form:label>
		        <form:select path="dojo">
		        	<c:forEach var="dojo" items="${dojos}">
		        		<option value="${dojo.getId()}">${dojo.getName()}</option>	
		        	</c:forEach>
		        </form:select>
		    </p>
		    <p>
		        <form:label path="firstName">First Name:</form:label>
		        <form:input path="firstName"/>
		    </p>
		    <p>
		        <form:label path="lastName">Last Name:</form:label>
		        <form:input path="lastName"/>
		    </p>
		    <p>
		        <form:label path="age">Age:</form:label>       
		        <form:input type="number" path="age"/>
		    </p>    
		    <input class="btn btn-success submit" type="submit" value="Create"/>
		</form:form>  
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>