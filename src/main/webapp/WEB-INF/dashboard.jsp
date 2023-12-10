<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nova+Square&family=Ranga&family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/dashStyle.css"/>
<title> &lt;In/&gt;decider | Dashboard </title>
</head>
<body>
		<div class="header">
			<div class="primary-head">
				<h1><span>&lt;In/&gt;</span>Decider</h1>
				
				<a href="/logout" class="btn btn-secondary">Log Out</a>
			</div>
			<hr>
			<div class="secondary-head">
				<h2 id="greeting">Welcome, <span id="user"><c:out value="${user.username}"/></span>!</h2>
				<h2>What are you feeling indecisive about today?</h2>		
			</div>

		</div>
	<div class="page container">

		
		<div class="grid-container">
			
			<div class="grid-item" id="shows">
				<h3>TV Shows</h3>
				<h5>Not caught up on your binge-watching?<br/> Too many to choose from?</h5>
				<h5>Let's fix that. Start here!</h5>
				<a href="/shows" class="btn btn-success">My Shows</a>
			</div>
			
			<div class="grid-item" id="restaurants">
				<h3>Restaurants</h3>
				<h5>Too many options in your area?<br/>The dreaded date night indifference?<br/></h5>
				<h5>Let's find somewhere to eat.</h5>
				<a href="/restaurants" class="btn btn-success">My Restaurant List</a>
			</div>
			
			<div class="grid-item" id="games">
				<h3>Video Games</h3>
				<h5>Too many sales?<br/> Friends can never decide on a game?</h5>
				<h5>Let's start tackling that backlog!</h5>
				<a href="/games" class="btn btn-success">My Game List</a>
			</div>
			
			<div class="grid-item" id="books">
				<h3>Books</h3>
				<h5>Books piling up?<br/> Too many to choose from?<br/></h5>
				<h5>Let's whittle that stack down.</h5>
				<a href="/books" class="btn btn-success">My Book List</a>
			</div>
			
			<div class="grid-item" id="meals">
				<h3>Meals</h3>
				<h5>Breakfast? Lunch? Dinner?<br/> Somewhere in between?</h5>
				<h5>Let's get cooking.</h5>
				<a href="/meals" class="btn btn-success">My Meal List</a>
			</div>
			
			<div class="grid-item" id="random">
				<h3>Random</h3>
				<h5>Because not everything belongs in a category.<br/>Need to pick something quickly?<br/></h5>
				<h5>Let's pick...something!</h5>
				<a href="/random" class="btn btn-success">My Random List</a>
			</div>
		
		</div>
		
	</div>
	<footer>
		<a href="/aboutHome">How to Use & About &lt;In/&gt;Decider </a>
	</footer>
</body>
</html>