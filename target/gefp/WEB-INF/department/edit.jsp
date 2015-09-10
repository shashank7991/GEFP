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
			<h1>Edit Department</h1>
			<div class="form-group">
				<form:form modelAttribute="department">
		Name: <form:input path="strName" class="form-control" />
					<br />
					<input type="submit" name="save" value="Update" class="btnsubmit" />
					<br />
				</form:form>

				<a href="list.html">Back</a>
			</div>
		</div>
	</div>
</body>
</html>
