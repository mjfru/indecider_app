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
<title>&lt;In/&gt;decider | Random List</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> Random List</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
		
		<div class="form-container">
			<h3>Add Something to Your List:</h3>
			<form:form action="/random/new" method="POST" modelAttribute="newRandomItem">
				<form:input type="hidden" path="user" value="${user.id}"/>
				
				<div>
					<form:label path="randomItemName">Item / Activity: </form:label>
					<form:input type="text" path="randomItemName"/>
					<form:errors path="randomItemName" class="errors"/>
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
						<th>Item Name:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="randomItem" items="${allRandomItems}">
						<c:if test="${randomItem.user.id == user.id }">
							<tr>
								<td class="item-name"><c:out value="${randomItem.randomItemName}"/></td>
								<td class="user-actions">
									<form action="/random/delete/${randomItem.id}" method="POST">
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
				<a href="/random/random" class="btn btn-success">Pick Something!</a>
			</div>
		</div>
		
	</div>
</body>
</html>