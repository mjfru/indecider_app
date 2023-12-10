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
<title>&lt;In/&gt;decider | Meals</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> Meal List</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
	
		<div class="form-container">
			<h3>Add a Meal to Your List:</h3>
			<form:form action="/meals/new" method="POST" modelAttribute="newMeal">
			<form:input type="hidden" path="user" value="${user.id}"/>
				
				<div>
					<form:label path="mealName">Name of Meal: </form:label>
					<form:input type="text" path="mealName"/>
					<form:errors path="mealName" class="errors"/>
				</div>
				
				<div>
					<form:label path="foodType">Cuisine: </form:label>
					<form:input type="text" path="foodType"/>
					<form:errors path="foodType" class="errors"/>
				</div>
				
				<div>
					<form:label path="course">Meal Type: </form:label>
					<form:select path="course" items="${courses}"/>
					<form:errors path="course" class="errors"/>
				</div>
				
				<div>
					<div id="descriptions">
						<form:label path="mealDescription">Description / Notes: </form:label>
						<form:textarea path="mealDescription" rows="4" cols="22"/>
					</div>
					<form:errors path="mealDescription" class="errors"/>
				</div>
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
						<th>Meal Options:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="meal" items="${allMeals}">
						<c:if test="${meal.user.id == user.id}">
							<tr>
								<td class="item-name"><c:out value="${meal.mealName}"/></td>
								<td class="user-actions">
									<a href="/meals/${meal.id}" class="btn btn-dark btn-sm">Details</a>
									<a href="/meals/edit/${meal.id}" class="btn btn-secondary btn-sm">Edit</a>
									<form action="/meals/delete/${meal.id}" method="POST">
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
				<a href="/meals/random" class="btn btn-success">Choose a Meal!</a>
			</div>
		</div>
	
	</div>
</body>
</html>