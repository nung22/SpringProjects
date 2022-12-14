<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Create a Task" />
</jsp:include> 
    <div class="container">
		<div class="header">
        	<h1 class="mt-4 text-success">Create a Project</h1>
        </div>
		<form:form action="/projects/new" method="post" modelAttribute="project">
		    <div class="errors create-errors">
			    <h6 class="text-danger"><form:errors path="title"/></h6>
			    <h6 class="text-danger"><form:errors path="description"/></h6>
			    <h6 class="text-danger"><form:errors path="dueDate"/></h6>
		    </div>
		    <form:hidden path="leader" value="${user.getId()}"/>
		    <p class="form-grp">
		        <form:label path="title">Project Title:</form:label>
		        <form:input path="title"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="description">Project Description:</form:label>       
		        <form:textarea path="description" rows="3"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="dueDate">Due Date:</form:label>
		        <form:input path="dueDate" type="date"/>
		    </p>
		    <div class="form-btns">
		    	<a class="btn btn-outline-warning form-btn" href="/projects">Cancel</a>
			    <input class="btn btn-success form-btn submit" type="submit" value="Submit"/>
		    </div>    
		</form:form>  
    </div>
<jsp:include page="base/footer.jsp"/> 