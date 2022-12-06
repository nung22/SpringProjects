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
        <h1 class="my-4 text-primary">Burger Tracker</h1>
        <table class="table table-hover table-bordered table-striped text-center">
            <thead>
                <tr>
                    <th>Burger Name</th>
                    <th>Restaurant Name</th>
                    <th>Rating (out of 5)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var='oneBurger' items='${burgers}'>
                <tr>
                    <td scope="row"><c:out value="${oneBurger.getName()}"/></td>
                    <td><c:out value="${oneBurger.getRestaurant()}"/></td>
                    <td><c:out value="${oneBurger.getRating()}"/></td>
                    <td>
                    	<a href="<c:url value='/burgers/edit/${oneBurger.getId()}'/>">edit</a>
                    	<a href="<c:url value='/burgers/delete/${oneBurger.getId()}'/>">delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
		<form:form action="/burgers" method="post" modelAttribute="burger">
		    <h3 class="text-primary">Add a Burger:</h3>
		    <h6><form:errors path="name" class="text-danger"/></h6>
		    <h6><form:errors path="restaurant" class="text-danger"/></h6>
		    <h6><form:errors path="rating" class="text-danger"/></h6>
		    <h6><form:errors path="notes" class="text-danger"/></h6>
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