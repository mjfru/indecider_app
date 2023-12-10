<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nova+Square&family=Ranga&family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/formStyle.css"/>
<meta charset="UTF-8">
<title>&lt;In/&gt;decider | Restaurants</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> Restaurants</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>	
	<div class="page-container">
	
		<div class="form-container">
			<h3>Add a Restaurant to Your List:</h3>
			<form:form action="/restaunts/new" method="POST" modelAttribute="newRestaurant">
				<form:input type="hidden" path="user" value="${user.id}"/>
				
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
				</div>
				<form:errors path="hasTakeout" class="errors"/>	
				
				<div class="radio-section">
					<form:label path="needsReservation">Reservations Needed: </form:label>
					<div class="radio-buttons">
						<label for="reservations-yes">Yes</label>
						<form:radiobutton path="needsReservation" value="true"/>
						<label for="reservations-no">No</label>
						<form:radiobutton path="needsReservation" value="false"/>
					</div>	
				</div>
				<form:errors path="needsReservation" class="errors"/>				
				
				<div id="add-btn">
					<input type="submit" value="Add to List" class="btn btn-dark"/>			
				</div>
			</form:form>
		</div>
		
		<div class="list">
			<h3>Choosing From: </h3>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th>Restaurant Name:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="restaurant" items="${allRestaurants}">
						<c:if test="${restaurant.user.id == user.id}">
							<tr class="table-content">
								<td class="item-name"><c:out value="${restaurant.restaurantName}"/></td>
								<td class="user-actions">
									<a href="/restaurants/${restaurant.id}" class="btn btn-dark btn-sm">Details</a>
									<a href="/restaurants/edit/${restaurant.id}" class="btn btn-secondary btn-sm">Edit</a>
									<form action="/restaurants/delete/${restaurant.id}" method="POST">
										<input type="hidden" name="_method" value="delete"/>
										<input type="submit" value="Delete" class="btn btn-danger btn-sm"/>
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div id="pick-btn">
				<a href="/restaurants/random" class="btn btn-success">Choose a Restaurant!</a>				
			</div>

		</div>
	
	</div>
	
</body>
</html>