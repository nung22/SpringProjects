<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Project Details" />
</jsp:include> 
    <div class="container">
       	<div class="header">
        	<h1 class="mt-4 text-primary">Project Details</h1>
        	<a class="btn btn-outline-info form-btn" href="/projects">Back to Dashboard</a>
        </div>
        <div class="display">
		    <p class="form-grp">
		        <span class="label text-warning">Project Title:</span>
		        <span class="info"><c:out value="${project.getTitle()}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Project Description:</span>       
		        <span class="info"><c:out value="${project.getDescription()}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Due Date:</span>
		        <span class="info"><fmt:formatDate value="${project.getDueDate()}" pattern="M/d/yyyy"/></span>
		    </p>
        </div>
	    <c:if test="${joinedProject}">
		    <div class="header mt-5">
			    <a class="btn btn-primary form-btn" href="/projects/${project.getId()}/tasks">See Tasks</a>
			    <c:if test="${project.getLeader().getId() == user.getId()}">
				    <a class="btn btn-danger form-btn" href="/projects/${project.getId()}/delete">Delete Project</a>
			    </c:if>
		    </div>    
	    </c:if>
    </div>
<jsp:include page="base/footer.jsp"/> 