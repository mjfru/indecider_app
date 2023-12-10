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
<title> &lt;In/&gt;decider | Book Selection </title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<h2>Your Randomly Selected Book Is...</h2>
		<a href="/dashboard" class="btn btn-dark">Back to Dashboard</a>
	</div>
	<hr>
   	<div class="page-container">
   	 	<h3>Hover Your Mouse Over the Box to Reveal.</h3>
   	 	<div class="selection">
		<c:if test="${randomBook != null}">
			<p id="random-name"><c:out value="${user.username}"/>, get comfy because you'll be reading 
			<span><i><c:out value="${randomBook.bookTitle}"/></i></span> written by <c:out value="${randomBook.author}"/>.</p>
			<p id="random-desc">It's a <c:out value="${randomBook.bookGenre}"/> book that's approximately <c:out value="${randomBook.numberOfPages}"/> pages long.</p>
			<c:choose>
				<c:when test="${randomBook.isBook}">
					<p id="random-desc">Go find it on your shelf, you seem to have a physical copy of this book.</p>
				</c:when>
				<c:otherwise>
					<p id="random-desc">Boot up your favorite e-reader and enjoy!</p>
				</c:otherwise>
			</c:choose>
			<p>Enjoy!</p>
<%-- 		<p>Book Title: <c:out value="${randomBook.bookTitle}"/></p>
			<p>Written By: <c:out value="${randomBook.author}"/></p>
			<p>Genre: <c:out value="${randomBook.bookGenre}"/></p>
			<c:choose>
				<c:when test="${randomBook.isBook}">
					<p>Format: You have a physical copy of this book.</p>
				</c:when>
				<c:otherwise>
					<p>Format: You have this book available on an e-reader.</p>
				</c:otherwise>
			</c:choose>
			<p>Approximate Number of Pages: ${randomBook.numberOfPages}</p> --%>
			
			
		</c:if>
		</div>
	</div>
</body>
</html>