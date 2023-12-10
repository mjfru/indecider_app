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
<link rel="stylesheet" href="/css/viewStyle.css"/>
<title>&lt;In/&gt;decider | <c:out value="${meal.mealName}"/></title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/meals" class="btn btn-secondary">Back to Meals</a>  
	</div>
	<hr>
	<div class="page-container">
		<div class="content">
		    <h2><c:out value="${meal.mealName}" /></h2>
		    <p>Cuisine: <span><c:out value="${meal.foodType}"/></span></p>
		    <p>Meal Type: <span><c:out value="${meal.course}"/></span></p>
		    <p>Description / Notes:<br> <c:out value="${meal.mealDescription}"/></p>
    	</div>
    </div>
</body>
</html>