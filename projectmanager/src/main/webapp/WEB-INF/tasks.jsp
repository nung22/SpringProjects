<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Project Tasks" />
</jsp:include> 
    <div class="container">
       	<div class="header">
        	<div>
	        	<h1 class="mt-4 text-light"><span class="text-primary">Project:</span> 
	        	<c:out value="${project.getTitle()}"></c:out></h1>
        		<h5 class=""><span class="text-warning">Project Lead: </span>
        		<c:out value="${project.getLeader().getFirstName()}"></c:out></h5>
        	</div>
        	<a class="btn btn-outline-info form-btn" href="/projects">Back to Dashboard</a>
        </div>
		<form:form class="task-form" action="/projects/${project.getId()}/tasks" method="post" modelAttribute="task">
		    <div class="errors">
			    <h6 class="text-danger"><form:errors path="ticket"/></h6>
		    </div>
		    <form:hidden path="project" value="${project.getId()}"/>
		    <form:hidden path="user" value="${user.getId()}"/>
		    <p class="form-grp">
		        <form:label path="ticket">Add a task ticket for<br>this team:</form:label>       
		        <form:textarea path="ticket" rows="3"/>
		    </p>
		    <div class="form-btns">
		    	<div></div>
			    <input class="btn btn-success form-btn submit" type="submit" value="Submit"/>
		    </div>
		</form:form>
	    <div class="task-list-header fw-bold fs-4 mt-5 bg-warning text-dark">Task List</div>
	    <div class="task-list bg-secondary">
    	<c:forEach var="oneTask" items="${tasks}">
    		<p class="timestamp fw-bold">
	    		<span class="">
		    		Added by <c:out value="${oneTask.getUser().getFirstName()}"></c:out> 
		    		at <fmt:formatDate value="${oneTask.getCreatedAt()}" pattern="h:mm aa 'on' MMM d, yyyy"/>	
	    		</span>
	    		<c:if test="${oneTask.user.id == user.id || user.id == project.leader.id}">
		    		<a class="btn-close close-task" href="/projects/${project.id}/tasks/${oneTask.id}/delete"></a>
	    		</c:if>
    		</p>
    		<p class="ticket"><c:out value="${oneTask.getTicket()}"></c:out></p>
    	</c:forEach>
	    </div>     
    </div>
<jsp:include page="base/footer.jsp"/> 