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
<title>&lt;In/&gt;decider | Editing <c:out value="${book.bookTitle}"/></title>
</head>
<body>
	
	<div class="header" id="edit-header">
		<h2>Edit <span id="edit-title"><i><c:out value="${book.bookTitle}"/></i></span></h2>
		<a href="/books" class="btn btn-secondary">Back to Books</a>
	</div>
	<hr>
	<div class="page-container">
	
		<div class="form-container" id="edit-form">
		
			<form:form action="/books/edit/${book.id}" method="PUT" modelAttribute="book">
				<form:input type="hidden" path="id" value="${book.id}"/>
				<form:input type="hidden" path="user.id" value="${book.user.id}"/>
				
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
					<form:errors path="bookGenre"/>
				</div>
				
				<div class="radio-section">
					<form:label path="isBook">Format: </form:label>
					<div class="radio-buttons">
						<label for="isBook-physical" id="book-label">Physical</label>
						<form:radiobutton path="isBook" value="true"/>
						<label for="isBook-ebook" id="book-label">Digital</label>
						<form:radiobutton path="isBook" value="false"/>
					</div>
					<form:errors path="isBook"/>
				</div>
				
				<div>
					<form:label path="numberOfPages">Approximate Pages:</form:label>
					<form:input path="numberOfPages" type="number" min = "5"/>
					<form:errors path="numberOfPages"/>
				</div>
				
				<div id="add-btn">
					<input type="submit" value="Edit <c:out value="${book.bookTitle}"/>" class="btn btn-success"/>
				</div>
			</form:form>
		</div>
	
	</div>	
</body>
</html>