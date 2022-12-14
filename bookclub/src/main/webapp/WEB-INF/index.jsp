<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp"> 
<jsp:param name="title" value="Login & Registration" />
</jsp:include> 
    <div class="container">
       <h1 class="page-title text-info fw-bolder">Book Club</h1>
       <h6 class="message text-warning my-3">A place for friends to share thoughts on books.</h6>
       <div class="forms">
		    <div class="login-reg reg">
		        <h1 class="text-light fw-bold">Create Account</h1>
		        <form:form action="/register" method="post" modelAttribute="newUser">
		            <!-- Error Messages -->
		            <h6><form:errors path="firstName" class="text-danger"/></h6>
				    <h6><form:errors path="lastName" class="text-danger"/></h6>
				    <h6><form:errors path="email" class="text-danger"/></h6>
				    <h6><form:errors path="password" class="text-danger"/></h6>
				    <h6><form:errors path="confirm" class="text-danger"/></h6>
		            <!-- Form Input -->
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="firstName">First Name</form:label>
		                <form:input class="form-control bg-light"  path="firstName" placeholder="" required="true"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="lastName">Last Name</form:label>
		                <form:input class="form-control bg-light"  path="lastName" placeholder="" required="true"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="email">Email</form:label>
		                <form:input class="form-control bg-light" type="email" path="email" placeholder="name@example.com" required="true"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password" aria-describedby="passwordHelpBlock" required="true"/>
		                <div id="passwordHelpBlock" class="form-text">
		                    Your password must be at least 8 characters long.
		                </div>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="confirm">Confirm Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="confirm" placeholder="type password again" required="true"/>
		            </div>
		            <input class="form-control btn btn-primary fw-bold mt-2" type="submit" value="CREATE ACCOUNT"/>
		        </form:form>
		    </div>
		    <div class="login-reg login">
		        <h1 class="text-light fw-bold">Sign In</h1>
		        <form:form action="/login" method="post" modelAttribute="newLogin">
					<h6><form:errors path="email" class="text-danger"/></h6>
				    <h6><form:errors path="password" class="text-danger"/></h6>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="email">Email</form:label>
		                <form:input class="form-control bg-light" type="email" path="email" required="true"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password" required="true"/>
		            </div>
		            <input class="form-control btn btn-primary fw-bold mt-2" type="submit" value="SIGN IN"/>
		        </form:form>
		    </div>
       </div>       
    </div>
<jsp:include page="base/footer.jsp"/> 