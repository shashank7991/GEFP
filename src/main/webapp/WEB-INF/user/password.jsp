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

			<form action="" method="post">
				${message}
				<table width="100%" cellpadding="5px" cellspacing="5px">
					<tr>
						<td style="text-align: right; padding: 10px">Old Password</td>
						<td><input type="password" name="oldPassword" value=""
							style="padding: 5px" /></td>
					</tr>

					<tr>
						<td style="text-align: right; padding: 10px">New Password</td>
						<td><input type="password" name="newPassword" value=""
							style="padding: 5px" /></td>
					</tr>

					<tr>
						<td style="text-align: right; padding: 10px">Confirm Password
						</td>
						<td><input type="password" name="confirmPassword" value=""
							style="padding: 5px" /></td>
					</tr>

					<tr>
						<td colspan="2" style="text-align: center; padding: 10px"><input
							type="submit" name="submit" value="Change Password" /></td>
										<td><a href="/gefp">Back</a></td>	

					</tr>
				</table>
			</form>

		</div>
	</div>

</body>
</html>

