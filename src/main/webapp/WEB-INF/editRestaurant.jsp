<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nova+Square&family=Ranga&family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/formStyle.css"/>
<title>&lt;In/&gt;decider | Editing <c:out value="${restaurant.restaurantName}"/></title>
</head>
<body>
	<div class="header" id="edit-header">
		<h2>Edit <span id="edit-title"><c:out value="${restaurant.restaurantName}"/></span></h2>
		<a href="/restaurants" class="btn btn-secondary">Back to Restaurants</a>
	</div>
	<hr>
	
	<div class="page-container">
	
		<div class="form-container" id="edit-form">
		
		<form:form action="/restaurants/edit/${restaurant.id}" method="PUT" modelAttribute="restaurant">
			<form:input type="hidden" path="id" value="${restaurant.id}"/>
			<form:input type="hidden" path="user.id" value="${restaurant.user.id}"/>
			
				<div>
					<form:label path="restaurantName">Name of Restaurant: </form:label>
					<form:input type="text" path="restaurantName"/>
					<form:errors path="restaurantName" class="errors"/>
				</div>
				
				<div>
					<form:label path="restaurantLocation">Restaurant Location: </form:label>
					<form:input type="text" path="restaurantLocation"/>
					<form:errors path="restaurantLocation" class="errors"/>
				</div>

				<div>
					<form:label path="restaurantType">Type of Food / Place: </form:label>
					<form:input type="text" path="restaurantType"/>
					<form:errors path="restaurantType" class="errors"/>
				</div>
				
				<div class="radio-section">
					<form:label path="hasTakeout">Takeout Available: </form:label>
					<div class="radio-buttons">
						<label for="takeout-yes">Yes</label>
						<form:radiobutton path="hasTakeout" value="true"/>
						<label for="takeout-no">No</label>
						<form:radiobutton path="hasTakeout" value="false"/>
					</div>
					<form:errors path="hasTakeout" class="errors"/>
				</div>
				
				<div class="radio-section">
					<form:label path="needsReservation">Reservation Needed: </form:label>
					<div class="radio-buttons">
						<label for="reservations-yes">Yes</label>
						<form:radiobutton path="needsReservation" value="true"/>
						<label for="reservations-no">No</label>
						<form:radiobutton path="needsReservation" value="false"/>
					</div>
					<form:errors path="needsReservation" class="errors"/>
				</div>
				<div id="add-btn">
					<input type="submit" value="Edit <c:out value="${restaurant.restaurantName}"/>" class="btn btn-success"/>	
				</div>
												
			
		</form:form>
		
		</div>
		
	</div>
</body>
</html>