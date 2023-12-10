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
<title>&lt;In/&gt;decider | Restaurant Selection</title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Restaurant Is...</h2>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
   	<div class="page-container">	
   		<h3>Hover Your Mouse Over the Box to Reveal.</h3>
   		<div class="selection">
	    <c:if test="${randomRestaurant != null}">
	    	<p id="random-name">Alright, <c:out value="${user.username}"/>, you're going to be eating at<br>
	    	<span><c:out value="${randomRestaurant.restaurantName}"/></span>!</p>
	    	<p id="random-desc">This place is a <c:out value="${randomRestaurant.restaurantType}"/> restaurant in 
	    	<c:out value="${randomRestaurant.restaurantLocation}"/>.</p>
	    	        <c:choose>
	        	<c:when test="${randomRestaurant.hasTakeout}">
	        		<p id="random-desc">If you feel like staying home, you're in luck! <c:out value="${randomRestaurant.restaurantName}"/> offers takeout.</p>
	        	</c:when>
	        	<c:otherwise>
	        		<p id="random-desc">Hopefully heading out to eat isn't a problem, <c:out value="${randomRestaurant.restaurantName}"/> doesn't offer takeout.</p>
	        	</c:otherwise>
	        </c:choose>
	    	<c:choose>
	        	<c:when test="${randomRestaurant.needsReservation}">
	        		<p id="random-desc">One more thing...reservations are probably in your best interest if you'd like to dine-in here.</p>
	        	</c:when>
	        	<c:otherwise>
	        		<p id="random-desc">Swing by whenever, reservations aren't typically needed here!</p>
	        	</c:otherwise>
	        </c:choose>
	    	<p>Hope it's delicious. Bon appétit!</p>
<%-- 		<p>Restaurant Name: <c:out value="${randomRestaurant.restaurantName}"/></p> --%>
<%-- 		<p>Location: <c:out value="${randomRestaurant.restaurantLocation}"/></p> --%>
<%-- 		<p>Type of Food: <c:out value="${randomRestaurant.restaurantType}"/></p> --%>
        
<%--         <c:choose> --%>
<%--         	<c:when test="${randomRestaurant.hasTakeout}"> --%>
<!--         		<p>This place offers takeout.</p> -->
<%--         	</c:when> --%>
<%--         	<c:otherwise> --%>
<!--         		<p>Takeout is not available at this restaurant.</p> -->
<%--         	</c:otherwise> --%>
<%--         </c:choose> --%>
        
<%--         <c:choose> --%>
<%--         	<c:when test="${randomRestaurant.needsReservation}"> --%>
<!--         		<p>Reservations are recommended here.</p> -->
<%--         	</c:when> --%>
<%--         	<c:otherwise> --%>
<!--         		<p>Reservations aren't needed here.</p> -->
<%--         	</c:otherwise> --%>
<%--         </c:choose> --%>     
    	</c:if>
    	</div>
    </div>
</body>
</html>