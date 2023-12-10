<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nova+Square&family=Ranga&family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/logRegStyle.css"/>
<meta charset="UTF-8">
<title>&lt;In/&gt;decider | Login</title>
</head>
<body>
	<div class="page-container">

			<div class="header">
				<h1><span>&lt;In/&gt;</span>Decider</h1>
				<h2>A Decisive WebApp for Indecisive People</h2>
			</div>
			<hr>
		<div class="log-reg">
			
			<div class="register">
				<h4>Register</h4>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div>
						<form:label path="username">Username: </form:label>
						<form:input type="text" path="username"/><br/>
						<form:errors path="username" class="errors"/>
					</div>
					
					<div>
						<form:label path="email">Email: </form:label>
						<form:input type="text" path="email"/><br/>
						<form:errors path="email" class="errors"/>
					</div>
					
					<div>
						<form:label path="password">Password: </form:label>
						<form:input type="password" path="password"/><br/>
						<form:errors path="password" class="errors"/>
					</div>
					
					<div>
						<form:label path="confirmPassword">Confirm Password: </form:label>
						<form:input type="password" path="confirmPassword"/><br/>
						<form:errors path="confirmPassword" class="errors"/>
					</div>
					<div class="buttons">
						<input type="submit" value="Join" class="btn btn-success"/>
					</div>
				</form:form>
			</div>
			
			<div class="login">
				<h4>Log In: </h4>
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div>
						<form:label path="email">Email: </form:label>
						<form:input type="string" path="email"/><br/>
						<form:errors path="email" class="errors"/>
					</div>
					
					<div>
						<form:label path="password">Password: </form:label>
						<form:input type="password" path="password"/><br/>
						<form:errors path="password" class="errors"/>
					</div>
					<div class="buttons">
						<input type="submit" value="Log In" class="btn btn-success"/>
					</div>
				</form:form>
			</div>
			
		</div>
	</div>
	<footer>
		<a href="/about">How to Use & About &lt;In/&gt;Decider</a>		
	</footer>
</body>
</html>