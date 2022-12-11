<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Home" />
</jsp:include> 
    <div class="container p-4">
		<div class="header">
	       	<h1 class="page-title text-info fw-bolder">Welcome, 
	       	<c:out value="${user.getFirstName() + ' ' + user.getLastName()}"/></h1>
	       	<h6 class="message text-warning my-3">Books from everyone's shelves:</h6>
       </div>
       <div class="nav">
	       <a class="btn btn-danger" href="/logout">Logout</a>
       	   <a class="" href="/logout">+ Add a book to my shelf!</a>
       </div>
    </div>
<jsp:include page="base/footer.jsp"/> 