<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Show Book Info" />
</jsp:include> 
    <div class="container">
		<div class="header">
        	<h1 class="my-4 text-primary"><c:out value="${book.getTitle()}"></c:out></h1>
        	<a href="/books">Back to the shelves</a>
        </div>
		<p class="text-light">
			<c:choose>
				<c:when test="${book.getUser().getId() == user.getId()}">
					<span class="text-danger">You</span>
				</c:when>
				<c:otherwise>
					<span class="text-danger">
						<c:out value="${book.getUser().getFirstName()}"></c:out>
					</span>
				</c:otherwise>
			</c:choose>
			<span> read </span>
			<span class="text-info">
				<c:out value="${book.getTitle()}"></c:out>
			</span>
			<span> by </span>
			<span class="text-success">
				<c:out value="${book.getAuthor()}"></c:out>
			</span>.
		</p>
		<p class="text-light">
			<span>Here are </span>
			<c:choose>
				<c:when test="${book.getUser().getId() == user.getId()}">
					<span>your</span>
				</c:when>
				<c:otherwise>
					<span>
						<c:out value="${book.getUser().getFirstName()}"></c:out>'s
					</span>
				</c:otherwise>
			</c:choose>
			<span>thoughts:</span>
		</p>
	   	<p class="thoughts text-light">
	   		<c:out value="${book.thoughts}"></c:out>
	   	</p>
	   	<c:if test="${book.getUser().getId() == user.getId()}">
		   	<div class="actions">
			   	<a class="btn btn-warning" href="<c:url value='/books/${book.getId()}/edit'/>">edit</a>
				<a class="btn btn-danger" href="<c:url value='/books/${book.getId()}/delete'/>">delete</a>	   		
		   	</div>
	   	</c:if>
    </div>
<jsp:include page="base/footer.jsp"/> 