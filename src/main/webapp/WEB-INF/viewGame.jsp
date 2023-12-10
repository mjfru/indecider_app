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
<title>&lt;In/&gt;decider | <c:out value="${game.gameTitle}"/></title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/games" class="btn btn-secondary">Back to Games</a>
	</div>
	<hr>
	<div class="page-container">
		<div class="content">		
		    <h2><i><c:out value="${game.gameTitle}"/></i></h2>
		    <p>Genre: <span><c:out value="${game.gameGenre}"/></span></p>
		    <p>Platform: <span><c:out value="${game.gamePlatform}"/></span></p>    
		    <c:choose>
		        <c:when test="${game.isMultiplayer}">
		            <p>Multiplayer: You can bring some friends, multiplayer is available!</p>
		        </c:when>
		        <c:otherwise>
		            <p>Multiplayer: This is a single-player experience.</p>
		        </c:otherwise>
		    </c:choose>
		    <p>Your Description / Notes:<br> <c:out value="${game.gameNotes}"/></p>
		</div>
	</div>
</body>
</html>