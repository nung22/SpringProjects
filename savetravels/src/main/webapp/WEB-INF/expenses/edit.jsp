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
	<title>Edit My Expense</title>
</head>
<body>
    <div class="container">
		<div class="header">
        	<h1 class="mt-4 text-success">Edit Expense</h1>
        	<a href="/">Go back</a>
        </div>
		<form:form action="/expenses/${expense.getId()}" method="post" modelAttribute="expense">
		    <h6><form:errors path="name" class="text-danger"/></h6>
		    <h6><form:errors path="vendor" class="text-danger"/></h6>
		    <h6><form:errors path="amount" class="text-danger"/></h6>
		    <h6><form:errors path="description" class="text-danger"/></h6>
		    <input type="hidden" name="_method" value="put">
		    <p>
		        <form:label path="name">Expense Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:input path="vendor"/>
		    </p>
		    <p>
		        <form:label path="amount">Amount:</form:label>       
		        <form:input type="number" step="0.01" path="amount"/>
		    </p>    
		    <p>
		        <form:label path="description">Description:</form:label>
		        <form:textarea path="description"/>
		    </p>
		    <input class="btn btn-success submit" type="submit" value="Submit"/>
		</form:form>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>