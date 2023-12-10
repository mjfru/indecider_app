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
<title>&lt;In/&gt;decider | Editing <c:out value="${meal.mealName}"/></title>
</head>
<body>
	<div class="header" id="edit-header">
		<h2>Edit <span id="edit-title"><c:out value="${meal.mealName}"/></span></h2>
		<a href="/meals" class="btn btn-secondary">Back to Meals</a>	
	</div>
	<hr>
	<div class="page-container">
	
		<div class="form-container" id="edit-form">
			
			<form:form action="/meals/edit/${meal.id}" method="PUT" modelAttribute="meal">
				<form:input type="hidden" path="id" value="${meal.id}"/>
				<form:input type="hidden" path="user.id" value="${meal.user.id}"/>
				
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
					<form:label path="mealDescription">Description / Notes: </form:label>
					<form:textarea path="mealDescription" rows="4" cols="25"/>
					<form:errors path="mealDescription" class="errors"/>
				</div>					
				
				<div id="add-btn">
					<input type="submit" value="Edit <c:out value="${meal.mealName}"/>" class="btn btn-success"/>
				</div>
			</form:form>
		
		</div>		
	
	</div>	
</body>
</html>