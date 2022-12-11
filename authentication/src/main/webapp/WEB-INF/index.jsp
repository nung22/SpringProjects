<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<jsp:include page="base/header.jsp">
<jsp:param name="title" value="Login & Reg" />
</jsp:include> 
    <div class="container">
       <h1 class="greeting text-info fs-1 fw-bolder">Welcome!</h1>
       <h6 class="message text-warning">Join our growing community</h6>
       <div class="forms">
		    <div class="login-reg reg">
		        <h1 class="text-light fw-bold">Create Account</h1>
		        <form:form action="/register" method="post" modelAttribute="newUser">
		            <!-- Error Messages -->
		            <h6><form:errors path="firstName" class="text-danger"/></h6>
				    <h6><form:errors path="lastName" class="text-danger"/></h6>
				    <h6><form:errors path="email" class="text-danger"/></h6>
		            <h6><form:errors path="phoneNumber" class="text-danger"/></h6>
				    <h6><form:errors path="password" class="text-danger"/></h6>
				    <h6><form:errors path="confirm" class="text-danger"/></h6>
		            <!-- Form Input -->
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="firstName">First Name</form:label>
		                <form:input class="form-control bg-light"  path="firstName" placeholder=""/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="lastName">Last Name</form:label>
		                <form:input class="form-control bg-light"  path="lastName" placeholder=""/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="email">Email</form:label>
		                <form:input class="form-control bg-light" type="email" path="email" placeholder="name@example.com"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="phoneNumber">Phone Number</form:label>
		                <form:input class="form-control bg-light"  path="phoneNumber" aria-describedby="phoneNumberHelpBlock"/>
		                <div id="phoneNumberHelpBlock" class="form-text">
		                    Enter only the digits of your phone number without including any spaces, dashes, or parentheses. <br> Ex: (123) 456-7890 would be entered as 1234567890.
		                </div>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password" aria-describedby="passwordHelpBlock"/>
		                <div id="passwordHelpBlock" class="form-text">
		                    Your password must be at least 8 characters long.
		                </div>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="confirm">Confirm Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="confirm" placeholder="type password again"/>
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
		                <form:input class="form-control bg-light" type="email" path="email"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password"/>
		            </div>
		            <input class="form-control btn btn-primary fw-bold mt-2" type="submit" value="SIGN IN"/>
		        </form:form>
<!-- 		        <div class="option mt-4">
		            <hr size="5" width="140rem" color="white">
		            <span class="text-light mx-2">OR</span>
		            <hr size="5" width="140rem" color="white">
		        </div>
		        <a href="/register_user" class="form-control btn btn-outline-light fw-bold mt-4">CREATE ACCOUNT</a> -->
		    </div>
       </div>
    </div>
<jsp:include page="base/footer.jsp"/> 