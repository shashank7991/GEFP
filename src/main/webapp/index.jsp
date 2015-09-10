<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/MyCSS.css" />

<title>GEFP</title>
</head>
<body>
	<div id="banner">
		<div class="header">
			<img src="images/csula.jpg" alt="Cal State L.A." style="width: 41%;">
		</div>
		<div class="header2">
			<h2>Flight Plan</h2>
		</div>
	</div>
	<div class="topmenu">
		<a href="j_spring_security_logout">Logout</a>
	</div>
	<div id="left-column">
		<div></div>
	</div>
	<div id="center-column">
		<div class="box">
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<h3>WelCome Admin</h3>
				<ul>
					<li><a href="department/list.html">Show Department</a></li>
				</ul>
			</security:authorize>



			<security:authorize access="hasRole('ROLE_STUDENT')">
				<h3>WelCome Student</h3>
				<ul>
					<li><a href="plans.html">Show Plan</a></li>
					<li><a href="changePassword.html">Change Password</a></li>
					<li><a href="changedepartment.html">Change Department</a></li>

				</ul>

			</security:authorize>




			<security:authorize access="hasRole('ROLE_ADVISOR')">
				<h3>WelCome Advisor</h3>
				<ul>
					<li><a href="student/list.html">Show Student</a></li>
				</ul>

			</security:authorize>



		</div>
	</div>

</body>
</html>

