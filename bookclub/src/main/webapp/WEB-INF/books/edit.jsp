<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Edit Book Info" />
</jsp:include> 
    <div class="container">
		<div class="header">
        	<h1 class="mt-4 text-warning">Change your Entry</h1>
        	<a href="/books">Back to the shelves</a>
        </div>
		<form:form action="/books/${book.getId()}/edit" method="post" modelAttribute="book">
		    <h6 class="text-danger"><form:errors path="title"/></h6>
		    <h6 class="text-danger"><form:errors path="author"/></h6>
		    <h6 class="text-danger"><form:errors path="thoughts"/></h6>
		    <input type="hidden" name="_method" value="put">
		    <form:hidden path="user" value="${user.getId()}"/>
		    <p class="form-grp">
		        <form:label path="title">Title:</form:label>
		        <form:input path="title"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="author">Author:</form:label>
		        <form:input path="author"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="thoughts">Thoughts:</form:label>
		        <form:textarea path="thoughts" rows="5"/>
		    </p>
		    <input class="btn btn-success submit" type="submit" value="Submit"/>
		</form:form>
    </div>
<jsp:include page="base/footer.jsp"/> 