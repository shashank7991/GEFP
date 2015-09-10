<%@page import="gefp.model.Checkpoint"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="celssCheckpoint" scope="application"
	class="gefp.model.Cell" />
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
		<div class="box">
			<ul>
				<li><a href="addstage.html?planId=${plan.planId}">Add Stage</a></li>
				<li><a href="addrunway.html?planId=${plan.planId}">Add
						Runway</a></li>
				<li><a href="addcheckpoint.html?planId=${plan.planId}">Add
						Checkpoint</a></li>
			</ul>
		</div>
	</div>
	<div id="center-column">
		<div class="box">
			<h1>Plan Name: ${plan.strName}</h1>
			<div>
				<table class="table table-condensed" border="1">
					<form action="" method="post">
						<table border="1" class="table table-condensed">
							<tr class="active">
								<td></td>
								<c:forEach items="${RunwayEntries}" var="runway">
									<th>${runway.strName}</th>
								</c:forEach>
							</tr>
							<c:forEach items="${stages}" var="entry">
								<tr>
									<td>${entry.strName}</td>
									<c:forEach items="${RunwayEntries}" var="runway">
										<td><c:forEach items="${checkPoints}" var="entrychk">


												<c:if test="${entry.stageId== entrychk.objStage.stageId}">
													<c:if
														test="${runway.runwayId == entrychk.objRunway.runwayId}">

														<c:forEach items="${entrychk.lstcheckpoints}"
															var="checkpoint">
															<input type="checkbox" checked="" />
											${checkpoint.strDescription}
											<a
																href="../checkpoint/edit.html?checkpointId=${checkpoint.checkpointId}">Edit</a>
														</c:forEach>

													</c:if>
												</c:if>
											</c:forEach></td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</form>
					<a href="list.html?departmentId=${plan.objDepartment.id}">Back</a>
				</table>

			</div>
		</div>
	</div>
</body>
</html>