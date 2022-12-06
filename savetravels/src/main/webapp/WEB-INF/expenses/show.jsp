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
	<title>Show Expense</title>
</head>
<body>
    <div class="container">
		<div class="header">
        	<h1 class="my-4 text-primary">Expense Details</h1>
        	<a href="/">Go back</a>
        </div>
		<div class="display-expense">
		    <p>
		        <span class="label">Expense Name:</span>
		        <span class="info"><c:out value="${expense.getName()}"/></span>
		    </p>
		    <p>
		        <span class="label">Expense Description:</span>
		        <span class="info"><c:out value="${expense.getDescription()}"/></span>
		    </p>
		    <p>
		        <span class="label">Vendor:</span>
		        <span class="info"><c:out value="${expense.getVendor()}"/></span>
		    </p>
		    <p>
		        <span class="label">Amount Spent:</span>
		        <span class="info"><fmt:formatNumber type="currency" value="${expense.getAmount()}"/></span>
		    </p>
		</div>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>