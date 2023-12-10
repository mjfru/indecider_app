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
<title>&lt;In/&gt;decider | Books</title>
</head>
<body>
	<div class="header">
		<h2><span id="user"><c:out value="${user.username}"/>'s</span> Book List</h2>
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
	</div>
	<hr>
	<div class="page-container">
	
		<div class="form-container">
			<h3>Add a Book to Your List:</h3>
			<form:form action="/books/new" method="POST" modelAttribute="newBook">
				<form:input type="hidden" path="user" value="${user.id}"/>
				
				<div>
					<form:label path="bookTitle">Book Title: </form:label>
					<form:input type="text" path="bookTitle"/>
					<form:errors path="bookTitle" class="errors"/>
				</div>
				
				<div>
					<form:label path="author">Author: </form:label>	
					<form:input type="text" path="author"/>
					<form:errors path="author" class="errors"/>
				</div>
				
				<div>
					<form:label path="bookGenre">Genre: </form:label>
					<form:input type="text" path="bookGenre"/>
					<form:errors path="bookGenre" class="errors"/>
				</div>
				
				<div class="radio-section">
					<form:label path="isBook">Format: </form:label>
					<div class="radio-buttons">
						<label for="isBook-physical" id="book-label">Physical</label>
						<form:radiobutton path="isBook" value="true"/>
						<label for="isBook-ebook" id="book-label">Digital</label>
						<form:radiobutton path="isBook" value="false"/>
					</div>		
				</div>
				<form:errors path="isBook" class="errors"/>
				
				<div>
					<form:label path="numberOfPages">Approximate Pages:</form:label>
					<form:input path="numberOfPages" type="number" min = "5"/>
					<form:errors path="numberOfPages" class="errors"/>
				</div>
				<div id="add-btn">
					<input type="submit" value="Add to List" class="btn btn-dark"/>
				</div>
			</form:form>
		</div>

		<div class="list">
			<h3>Choosing From:</h3>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th>Book Title:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${allBooks}">
						<c:if test="${book.user.id == user.id}">
							<tr class="table-content">
								<td class="item-name"><i><c:out value="${book.bookTitle}"/></i></td>
								<td class="user-actions">
									<a href="/books/${book.id}" class="btn btn-dark btn-sm">Details</a>
									<a href="/books/edit/${book.id}" class="btn btn-secondary btn-sm">Edit</a>
									<form action="books/delete/${book.id}" method="POST">
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
				<a href="/books/random" class="btn btn-success">Choose a Book!</a>
			</div>
		</div>
	
	
	</div>	
</body>
</html>