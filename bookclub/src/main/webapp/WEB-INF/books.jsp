<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Book Club Dashboard" />
</jsp:include> 
    <div class="container p-4">
		<div class="header mb-3">
	       	<div>
		       	<h1 class="page-title text-info fw-bolder">Welcome, 
		       	<c:out value="${user.getFirstName()}"/></h1>
		       	<h6 class="message text-warning my-3">Books from everyone's shelves:</h6>	       		
	       	</div>
			<div class="nav">
				<a class="btn btn-danger logout" href="/logout">Logout</a>
				<a class="" href="/books/new">+ Add a book to my shelf!</a>
			</div>
		</div>
		<table class="table table-borderless table-striped text-center">
			<thead>
			    <tr class="fs-5">
			        <th>ID</th>
			        <th>Title</th>
			        <th>Author Name</th>
			        <th>Posted By</th>
			    </tr>
			</thead>
			<tbody>
			<c:forEach var='oneBook' items='${books}'>
			    <tr class="align-middle">
			        <td><c:out value="${oneBook.getId()}"/></td>
			        <td><a href="<c:url value='/books/${oneBook.getId()}'/>">
			        <c:out value="${oneBook.getTitle()}"/></a></td>
			        <td><c:out value="${oneBook.getAuthor()}"/></td>
			        <td><c:out value="${oneBook.getUser().getFirstName()}"/></td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
    </div>
<jsp:include page="base/footer.jsp"/> 