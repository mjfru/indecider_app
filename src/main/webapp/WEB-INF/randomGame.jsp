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
<title>&lt;In/&gt;decider | Video Game Selection</title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Game Is...</h2>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
   	<div class="page-container">
   	   	<h3>Hover Your Mouse Over the Box to Reveal.</h3>
		<div class="selection">
			<c:if test="${randomGame != null}">
				<p id="random-name"><c:out value="${user.username}"/>, your next gaming session will be spent playing the 
				<c:out value="${randomGame.gameGenre}"/> title <span><i><c:out value="${randomGame.gameTitle}"/></i></span>.
				<p id="random-desc">It's available to play on your <c:out value="${randomGame.gamePlatform}"/>.</p>
				<c:choose>
					<c:when test="${randomGame.isMultiplayer}">
						<p id="random-desc">If you're looking to play this with friend, you're in luck! Multiplayer is available.</p>
					</c:when>
					<c:otherwise>
						<p id="random-desc">There's no multiplayer available for this game, you're in it alone!</p>
					</c:otherwise>
				</c:choose>
				<p id="random-desc">You left this description / note for yourself: </p>
				<p id="random-notes"><c:out value="${randomGame.gameNotes}"/></p>
				<p>GLHF!</p>
<%-- 			<p>Game Title: <c:out value="${randomGame.gameTitle}"/></p>
				<p>Genre: <c:out value="${randomGame.gameGenre}"/></p>
				<p>Platform: <c:out value="${randomGame.gamePlatform}"/></p>
				
				<c:choose>
					<c:when test="${randomGame.isMultiplayer}">
						<p>Multiplayer: You can bring some friends, multiplayer is available!</p>
					</c:when>
					<c:otherwise>
						<p>Multiplayer: This is a single-player experience.</p>
					</c:otherwise>
				</c:choose>
				<p>Your Description / Notes: ${randomGame.gameNotes}</p> --%>
			</c:if>
		</div>
	</div>
</body>
</html>