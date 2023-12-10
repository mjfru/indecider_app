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
<title>&lt;In/&gt;decider | <c:out value="${book.bookTitle}" /></title>
</head>
<body>
	<div class="header">
		<h1><span>&lt;In/&gt;</span>Decider</h1>
		<a href="/books" class="btn btn-secondary">Back to Books</a>
	</div>
	<hr>
	
	<div class="page-container">
		<div class="content">
    		<h2><i><c:out value="${book.bookTitle}" /></i></h2>
    		<p>Written By: <span><c:out value="${book.author}"/></span></p>
    		<p>Genre: <span><c:out value="${book.bookGenre}"/></span></p>
    		<c:choose>
        		<c:when test="${book.isBook}">
            		<p>Format: <span>You have a physical copy of this book.</span></p>
        		</c:when>
        		<c:otherwise>
            		<p>Format: <span>You have this book available on an e-reader.</span></p>
        		</c:otherwise>
    		</c:choose>
    		<p>Approximate Number of Pages: <span><c:out value="${book.numberOfPages}"/></span></p>
    	</div>
    </div>
    
</body>
</html>