<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	
		<div class="d-flex justify-content-between align-items-center">
			<a href="/songs/new">Add New</a>
			<a href="/search/topTen">Top Songs</a>
			<form action="/search/" method="post" >
				<input type="text" name="search"/>
				<input type="submit" value="search artist" class="btn btn-primary"/>
			</form>
		</div>
		
		<table class="table table-hover">
		
			<thead>
				<tr>
					<th>Name</th>
					<th>Artist</th>
					<th>Rating</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${playlist}" var="playli">
						<tr>
							<td><a href="/songs/${playli.getId()}">${playli.getTitle()}</a></td>
							<td>${playli.getArtist()}</td>
							<td>${playli.getRating()}</td>
							<td>
								<form action="/delete/${playli.getId() }" method="post">
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