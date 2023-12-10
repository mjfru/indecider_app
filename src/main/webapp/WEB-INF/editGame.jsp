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
<title>&lt;In/&gt;decider | Editing <c:out value="${game.gameTitle}"/></title>
</head>
<body>
	<div class="header" id="edit-header">
		<h2>Edit <span id="edit-title"><i><c:out value="${game.gameTitle}"/></i></span></h2>
		<a href="/games" class="btn btn-secondary">Back to Games</a>
	</div>
	<hr>
	<div class="page-container">
		
		<div class="form-container" id="edit-form">
			<form:form action="/games/edit/${game.id}" method="PUT" modelAttribute="game">
				<form:input type="hidden" path="id" value="${game.id}"/>
				<form:input type="hidden" path="user.id" value="${game.user.id}"/>
				
				<div>
					<form:label path="gameTitle">Game Title: </form:label>
					<form:input type="text" path="gameTitle"/>
					<form:errors path="gameTitle" class="errors"/>
				</div>
				
				<div>
					<form:label path="gameGenre">Genre: </form:label>
					<form:input type="text" path="gameGenre"/>
					<form:errors path="gameGenre" class="errors"/>
				</div>
				
				<div>
					<form:label path="gamePlatform">Platform: </form:label>
					<form:select path="gamePlatform" items="${platforms}" value="${game.gameGenre}"/>
					<form:errors path="gamePlatform" class="gamePlatform"/>
				</div>
				
				<div class="radio-section">
					<form:label path="isMultiplayer">Multiplayer Available:</form:label>
					<div class="radio-buttons">
						<label for="multiplayer-yes">Yes</label>
						<form:radiobutton path="isMultiplayer" value="true"/>
						<label for="multiplayer-no">No</label>
						<form:radiobutton path="isMultiplayer" value="false"/>
					</div>
					<form:errors path="isMultiplayer" class="errors"/>
				</div>
				
				<div>
					<form:label path="gameNotes">Description / Notes: </form:label>
					<form:textarea path="gameNotes" rows="4" cols="25"/>
					<form:errors path="gameNotes" class="errors"/>
				</div>
				
				<div id="add-btn">
					<input type="submit" value="Edit <c:out value="${game.gameTitle}"/>" class="btn btn-success"/>												
				</div>								
			</form:form>
		</div>
		
	</div>
</body>
</html>