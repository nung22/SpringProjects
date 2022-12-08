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
	<title>Read Share</title>
</head>
<body>
    <div class="container">
        <h1 class="my-4 text-primary">Save Travels</h1>
        <table class="table table-borderless table-striped text-center">
            <thead>
                <tr class="fs-5">
                    <th>Expense Name</th>
                    <th>Vendor</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var='oneExpense' items='${expenses}'>
                <tr class="align-middle">
                    <td scope="row"><a href="<c:url value='/expenses/${oneExpense.getId()}'/>">
                    <c:out value="${oneExpense.getName()}"/></a></td>
                    <td><c:out value="${oneExpense.getVendor()}"/></td>
                    <td><fmt:formatNumber type="currency" value="${oneExpense.getAmount()}"/></td>
                    <td class="actions">
                    	<a href="<c:url value='/expenses/edit/${oneExpense.getId()}'/>">edit</a>
                    	<a class="btn btn-danger" href="<c:url value='/expenses/delete/${oneExpense.getId()}'/>">delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
		<form:form action="/expenses" method="post" modelAttribute="expense">
		    <h3 class="text-primary">Add an Expense:</h3>
		    <h6><form:errors path="name" class="text-danger"/></h6>
		    <h6><form:errors path="vendor" class="text-danger"/></h6>
		    <h6><form:errors path="amount" class="text-danger"/></h6>
		    <h6><form:errors path="description" class="text-danger"/></h6>
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
		        <form:input type="number" step="0.01" min="1.00" value="0.00" path="amount"/>
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