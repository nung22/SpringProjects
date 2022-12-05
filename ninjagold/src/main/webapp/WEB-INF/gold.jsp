<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Figtree'>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Ninja Gold</title>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="gold-counter fw-bolder">Your Gold: <span class="total-gold"><c:out value="${gold}"></c:out></span></h1>
            <a href="/reset" class="btn btn-danger">Reset</a>
        </div>
        <div class="row">
            <div class="col farm">
                <h2 class="fw-bolder">Farm</h2>
                <h5>(earns 10 - 20 gold)</h5>
                <form action="/find_gold" method="POST">
                    <input type="hidden" name="action" value="farm">
                    <input type="submit" class="btn btn-warning" value="Find Gold!">
                </form>
            </div>
            <div class="col cave">
                <h2 class="fw-bolder">Cave</h2>
                <h5>(earns 5 - 10 gold)</h5>
                <form action="/find_gold" method="POST">
                    <input type="hidden" name="action" value="cave">
                    <input type="submit" class="btn btn-warning" value="Find Gold!">
                </form>
            </div>
            <div class="col house">
                <h2 class="fw-bolder">House</h2>
                <h5>(earns 2 - 5 gold)</h5>
                <form action="/find_gold" method="POST">
                    <input type="hidden" name="action" value="house">
                    <input type="submit" class="btn btn-warning" value="Find Gold!">
                </form>
            </div>
            <div class="col quest">
                <h2 class="fw-bolder">Quest</h2>
                <h5>(earns/takes<br>0 - 50 gold)</h5>
                <form action="/find_gold" method="POST">
                    <input type="hidden" name="action" value="quest">
                    <input type="submit" class="btn btn-warning" value="Find Gold!">
                </form>
            </div>
            <div class="col spa">
                <h2 class="fw-bolder">Spa</h2>
                <h5>(takes 5 - 20 gold)</h5>
                <form action="/find_gold" method="POST">
                    <input type="hidden" name="action" value="spa">
                    <input type="submit" class="btn btn-warning" value="Find Gold!">
                </form>
            </div>
        </div>
        <div class="activities">
            <label class="fw-bolder" for="activities">Activities:</label>
            <div class="activities-log" id="activities">
            <c:forEach var="action" items="${actions}">
                <c:choose>
                    <c:when test="${action.contains('lost')}">
                        <p class="action text-danger">
                        <c:out value="${action}"></c:out>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p class="action text-success">
                        <c:out value="${action}"></c:out>
                        </p>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>