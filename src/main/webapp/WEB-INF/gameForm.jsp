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
<title>&lt;In/&gt;decider | Video Games</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> Video Game List</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
		
		<div class="form-container">
			<h3>Add a Video Game to Your List:</h3>
			<form:form action="/games/new" method="POST" modelAttribute="newGame">
			<form:input type="hidden" path="user" value="${user.id}"/>
				
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
					<form:select path="gamePlatform" items="${platforms}"/>
					<form:errors path="gamePlatform" class="errors"/>
				</div>
				
				<div class="radio-section">
					<form:label path="isMultiplayer">Multiplayer:</form:label>
					<div class="radio-buttons">
						<label for="multiplayer-yes">Yes</label>
						<form:radiobutton path="isMultiplayer" value="true"/>
						<label for="multiplayer-no">No</label>
						<form:radiobutton path="isMultiplayer" value="false"/>
					</div>		
				</div>
					<form:errors path="isMultiplayer" class="errors"/>
				
				<div>
					<div id="descriptions">
						<form:label path="gameNotes">Description / Notes: </form:label>
						<form:textarea path="gameNotes" rows="4" cols="22"/>		
					</div>
					<form:errors path="gameNotes" class="errors"/>
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
						<th>Game Title:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="game" items="${allGames}">
						<c:if test="${game.user.id == user.id }">
							<tr class="table-content">
								<td class="item-name"><i><c:out value="${game.gameTitle}"/></i></td>
								<td class="user-actions">
									<a href="/games/${game.id}" class="btn btn-dark btn-sm">Details</a>
									<a href="/games/edit/${game.id}" class="btn btn-secondary btn-sm">Edit</a>
									<form action="/games/delete/${game.id}" method="POST">
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
				<a href="/games/random" class="btn btn-success">Choose a Game!</a>
			</div>
		</div>		
	
	</div>
	
</body>
</html>