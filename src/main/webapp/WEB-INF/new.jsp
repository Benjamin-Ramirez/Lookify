<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	
		<h1>New Songs!</h1>
	
		<form:form action="/songs/create" method="post" modelAttribute="playlist" >
		
			<div class="form-group">
				<form:label path="title">Title:</form:label>
				<form:input path="title" class="form-control"/>
				<form:errors path="title" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="artist">Artist:</form:label>
				<form:input path="artist" class="form-control"/>
				<form:errors path="artist" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="rating">Rating:</form:label>
				<form:input path="rating" class="form-control"/>
				<form:errors path="rating" class="text-danger"/>
			</div>
			<div class="d-flex justify-content-between align-items-center">
			<input type="submit" value="Add song" class="btn btn-secondary" />
			<a href="/dashboard" class="btn btn-secondary">Dashboard</a>
			</div>			
			
		</form:form>
		
	</div>
</body>
</html>