<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/MyCSS.css" />
<title>Department</title>
</head>
<body>
	<div id="banner">
		<div class="header">
			<img src="../images/csula.jpg" alt="Cal State L.A." class="logo">
		</div>
		<div class="header2">
			<h2>Flight Plan</h2>
		</div>
	</div>
	<div class="topmenu">
		<a href="../j_spring_security_logout">Logout</a>
	</div>
	<div id="left-column">
		<div></div>
	</div>
	<div id="center-column">
		<div class="box">
			<h1>List Of Department</h1>

			<div>
				<table border="1" class="table table-condensed">
					<tr class="active">
						<!-- <th>id</th> -->
						<th>Name</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${departments}" var="department">
						<tr>
							<%-- <td>${department.id}</td> --%>
							<td>${department.strName}</td>
							<td><a
								href="../plan/list.html?departmentId=${department.id}">Show
									Plan</a> | <a href="edit.html?id=${department.id}">Edit</a></td>
						</tr>
					</c:forEach>
				</table>

				<p>
					<a href="add.html">Add Department</a>

				</p>
			</div>
		</div>
	</div>


</body>
</html>