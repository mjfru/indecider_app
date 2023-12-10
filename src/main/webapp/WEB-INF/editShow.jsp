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
<title>&lt;In/&gt;decider | Editing <c:out value="${show.showTitle}"/></title>
</head>
<body>
	<div class="header" id="edit-header">
		<h2>Edit <span id="edit-title"><i><c:out value="${show.showTitle}"/></i></span></h2>
		<a href="/shows" class="btn btn-secondary">Back to Shows</a>
	</div>
	<hr>
	
	<div class="page-container">
		
		<div class="form-container" id="edit-form">
			
			<form:form action="/shows/edit/${show.id}" method="PUT" modelAttribute="show">
				<form:input type="hidden" path="id" value="${show.id}"/>
				<form:input type="hidden" path="user.id" value="${show.user.id}"/>
				
				<div>
					<form:label path="showTitle">Title of Show: </form:label>
					<form:input type="text" path="showTitle"/>
					<form:errors path="showTitle" class="errors"/>
				</div>
				
				<div>
					<form:label path="showGenre">Genre: </form:label>
					<form:input type="text" path="showGenre"/>
					<form:errors path="showGenre" class="errors"/>
				</div>
				
				<div>
					<form:label path="showPlatform">Where to Watch: </form:label>
					<form:input type="text" path="showPlatform"/>
					<form:errors path="showPlatform" class="errors"/>
				</div>
				
				<div>
					<form:label path="numberOfSeasons">Number of Seasons: </form:label>
					<form:input type="number" path="numberOfSeasons" min = "1" max = "100"/>
					<form:errors path="numberOfSeasons" class="errors"/>
				</div>
				
				<div id="add-btn">
					<input type="submit" value="Edit <c:out value="${show.showTitle}"/>" class="btn btn-success"/>							
				</div>
			</form:form>
		</div>
		
	</div>
</body>
</html>