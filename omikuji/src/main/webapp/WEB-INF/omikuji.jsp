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
	<title>Omikuji</title>
</head>
<body>
    <div class="container">
        <h1>Send an Omikuji!</h1>
        <form action="/submit" method="POST">
            <div class="form-group">
                <label for="number">Pick any number from 5 to 25</label>
                <input type="number"
                class="form-control" name="number" id="number" min="5" max="25" placeholder="5" required>
            </div>
            <div class="form-group">
                <label for="city">Enter the name of any city.</label>
                <input type="text"
                class="form-control" name="city" id="city" required>
            </div>
            <div class="form-group">
                <label for="person">Enter the name of any real person.</label>
                <input type="text"
                class="form-control" name="person" id="person" required>
            </div>
            <div class="form-group">
                <label for="activity">Enter professional endeavor or hobby.</label>
                <input type="text"
                class="form-control" name="activity" id="activity" required>
            </div>
            <div class="form-group">
                <label for="organism">Enter any type of living thing.</label>
                <input type="text"
                class="form-control" name="organism" id="organism" required>
            </div>
            <div class="form-group">
                <label for="phrase">Say something nice to someone.</label>
                <textarea class="form-control" name="phrase" id="phrase" cols="30" rows="3" required></textarea>
            </div>
            <div class="form-group submit">
                <label for="submit"><em>Send and show a friend</em></label>
                <input type="submit"
                class="form-control btn btn-primary" id="submit">
            </div>
        </form>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>