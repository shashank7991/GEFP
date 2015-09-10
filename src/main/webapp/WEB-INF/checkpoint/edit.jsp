<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/MyCSS.css" />
<title>Checkpoint</title>
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
			<h1>Edit Checkpoint</h1>
			<div class="form-group">
				<form:form modelAttribute="checkpoint">
					<input type="hidden" name="checkpoint" value="${checkpoint}" />
					<input type="hidden" name="planId" value="${planId}" />
					<table width="100%">
						<tbody>
							<tr>
								<td>Stage</td>
								<td><select name="stageId" class="form-control">
										<c:forEach items="${stages}" var="stage">
											<option value="${stage.stageId}">${stage.strName}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Runway</td>
								<td><select name="runwayId" class="form-control">
										<c:forEach items="${runways}" var="runway">
											<option value="${runway.runwayId}">${runway.strName}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Check Point</td>
								<td><form:input path="strDescription" class="form-control"/></td>
							</tr>
						</tbody>
					</table>

					<input type="submit" name="save" value="Update" class="btnsubmit" style="margin-top: 8px;"/>
					<br />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
