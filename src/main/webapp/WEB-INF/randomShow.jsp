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
<title> &lt;In/&gt;decider | Show Selection </title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Show Is...</h2>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
   	<div class="page-container">
   		<h3>Hover Your Mouse Over the Box to Reveal.</h3>
		<div class="selection">
		    <c:if test="${randomShow != null}">
		    	<p id="random-name"><c:out value="${user.username}"/>, 
		    	you'll be watching <span><i><c:out value="${randomShow.showTitle}"/></i></span>.</p>
		    	<p id="random-desc">It's a <c:out value="${randomShow.showGenre}"/> show that's 
		    	<c:out value="${randomShow.numberOfSeasons}"/> seasons long.</p>
		    	<p id="random-desc">According to our records (which you provided) you can watch it on 
		    	<c:out value="${randomShow.showPlatform}"/>.</p> 
		    	<p>Happy binge-watching. Hope you enjoy it!</p>
				
<%-- 			<p>Show Title: <c:out value="${randomShow.showTitle}"/></p>
				<p>Genre: <c:out value="${randomShow.showGenre}"/></p>
				<p>Platform: <c:out value="${randomShow.showPlatform}"/></p>
				<p>Number of Seasons: <c:out value="${randomShow.numberOfSeasons}"/></p> --%>
				
		    </c:if>
	    </div>
    </div>
</body>
</html>