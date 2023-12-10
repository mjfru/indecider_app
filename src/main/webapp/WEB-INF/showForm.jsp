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
<title>&lt;In/&gt;decider | Shows</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> TV Shows</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
		
		<div class="form-container">
			<h3>Add a Show to Your List:</h3>
			<form:form action="/shows/new" method="POST" modelAttribute="newShow">
				<form:input type="hidden" path="user" value="${user.id}"/>
				
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
					<input type="submit" value="Add to List" class="btn btn-dark"/>
				</div>
				
			</form:form>
		</div>
		
		<div class="list">
			<h3>Choosing From: </h3>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th>Show Title:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="show" items="${allShows}">
						<c:if test="${show.user.id == user.id }">
							<tr class="table-content">
								<td class="item-name"><i><c:out value="${show.showTitle}"/></i></td>
								<td class="user-actions">
									<a href="/shows/${show.id}" class="btn btn-dark btn-sm">Details</a>
									<a href="/shows/edit/${show.id}" class="btn btn-secondary btn-sm">Edit</a>
									<form action="/shows/delete/${show.id}" method="POST">
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
				<a href="/shows/random" class="btn btn-success">Choose a Show!</a>			
			</div>

		</div>
		
	</div>
</body>
</html>