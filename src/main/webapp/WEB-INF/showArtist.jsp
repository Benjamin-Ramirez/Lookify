<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<div>
	<h1>Song by artist :${name}</h1>
	<div class="d-flex justify-content-between align-items-center">
	<form action="/newSearch" method="post">
			<input type="text" name="newSearch" />
			<input type="submit" value="Search Artist" class="btn btn-secondary"/>
	</form>
	<a href="/dashboard" class="btn btn-secondary">Dashboard</a>
	</div>
	</div>
	
	<table class="table table-hover">
		
		<thead>
			<tr>
				<th>Name</th>
				<th>Rating</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${artista}" var="art">
				<tr>
					<td>${art.getTitle()}</td>
					<td>${art.getRating()}</td>
					<td>
						<form action="/delete/${art.getId() }" method="post">
							<input type="hidden" name="_method" value="DELETE"/>
							<input type="submit" value="Delete" class="btn btn-danger" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	</div>
</body>
</html>