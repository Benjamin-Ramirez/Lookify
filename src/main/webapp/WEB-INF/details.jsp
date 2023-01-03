<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalles</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h1>Datails Song</h1>
	<a href="/dashboard" class="btn btn-secondary">Dashboard</a>
		<ul>
			<li>Title:      ${detalles.title} </li>
			<li>Artist:      ${detalles.artist} </li>
			<li>Rating (1-10):     ${detalles.rating} </li>
		</ul>
		
		<form action="/delete/${detalles.id }" method="post">
			<input type="hidden" name="_method" value="DELETE"/>
			<input type="submit" value="Delete" class="btn btn-danger" />
		</form>

	</div>
</body>
</html>