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
<title> &lt;In/&gt;decider | Random List </title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Thing(?) Is...</h2>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
   		<h3>Hover Your Mouse Over the Box to Reveal.</h3>
		<div class="selection">
   		 	<c:if test="${randomRandomItem != null}">
    			<p id="random-name">Well, <c:out value="${user.username}"/>, we're not sure what this is or what you'll do with this selection but you have to go with it!</p>
    			<p id="random-name">You'll be...doing? Using? Buying? Not sure, but the decision is <span><c:out value="${randomRandomItem.randomItemName}"/></span>!</p>
    			<p>Hope you, uh, have...fun with that? See you next time!</p>
<%--         	<p>Random Selection: <c:out value="${randomRandomItem.randomItemName}"/></p>	    --%>
   	 		</c:if>
   	 	</div> 
	</div>

</body>
</html>