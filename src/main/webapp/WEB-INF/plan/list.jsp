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
<title>Plan</title>
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
			<h1>List Of Plan</h1>
			<div>
				<table border="1" class="table table-condensed">
					<tr class="active">
						<!-- <th>id</th> -->
						<th>Name</th>
						<th>Current Plan</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${plans}" var="plan">
						<tr>
							<%-- <td>${plan.planId}</td> --%>
							<td>${plan.strName}</td>

							<td><c:choose>
									<c:when test="${plan.planId == department.currentPlan}">YES</c:when>
									<c:otherwise>No</c:otherwise>

								</c:choose></td>
							<td><a href="view.html?planId=${plan.planId}">Details</a> |
								<a href="edit.html?planId=${plan.planId}">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</table>

				<p>
					<a href="add.html?departmentId=${department.id}">Add New Plan</a>
				</p>

				<a href="../department/list.html">Back</a>
			</div>
		</div>
	</div>
</body>
</html>
