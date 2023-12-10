<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nova+Square&family=Ranga&family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/randomStyle.css"/>
<title>&lt;In/&gt;decider | Meal Selection</title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Meal Is...</h2>
		<a href="/dashboard" class="btn btn-dark">Back to Dashboard</a>
	</div>
	<hr>
   	<div class="page-container">
   	<h3>Hover Your Mouse Over the Box to Reveal.</h3>
   		<div class="selection">
		<c:if test="${randomMeal != null}">
			<p id="random-name"><c:out value="${user.username}"/>, you'll be cooking <span><c:out value="${randomMeal.mealName}"/></span>.</p>
			<p id="random-desc"> It's a(n) <c:out value="${randomMeal.foodType}"/> dish that's typically served for <c:out value="${randomMeal.course}"/></p>
			<p id="random-desc">You left the following description / notes for yourself: </p>
			<p id="random-notes"><c:out value="${randomMeal.mealDescription}"/></p>
			<p>Enjoy your meal!</p>
			
<%-- 		<p>Meal: <c:out value="${randomMeal.mealName}"/></p>
			<p>Type: <c:out value="${randomMeal.foodType}"/></p>
			<p>Course: <c:out value="${randomMeal.course}"/></p>
			<p>Description / Notes: <c:out value="${randomMeal.mealDescription}"/></p> --%>
		</c:if>
		</div>
	</div>
</body>
</html>