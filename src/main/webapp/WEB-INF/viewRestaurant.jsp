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
<title>&lt;In/&gt;decider | <c:out value="${restaurant.restaurantName}"/></title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
    	<a href="/restaurants" class="btn btn-secondary">Back to Restaurants</a>	
	</div>
	<hr>
	<div class="page-container">
		<div class="content">
		    <h2><c:out value="${restaurant.restaurantName}"/></h2>
		    <p>Location: <c:out value="${restaurant.restaurantLocation}"/></p>
		    <p>Type of Food: <c:out value="${restaurant.restaurantType}"/></p>
		    
		    <c:choose>
		        <c:when test="${restaurant.hasTakeout}">
		            <p>Takeout Available?<br> Yes, this place offers takeout.</p>
		        </c:when>
		        <c:otherwise>
		            <p>Takeout Available?<br> No, takeout is not available at this restaurant.</p>
		        </c:otherwise>
		    </c:choose>
		    
		    <c:choose>
		        <c:when test="${restaurant.needsReservation}">
		            <p>Reservations Needed?<br> Yes, reservations are recommended here.</p>
		        </c:when>
		        <c:otherwise>
		            <p>Reservations Needed?<br> No, reservations aren't needed here.</p>
		        </c:otherwise>
		    </c:choose>
		</div>
	</div>

</body>
</html>