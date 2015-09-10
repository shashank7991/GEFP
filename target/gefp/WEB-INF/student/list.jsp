<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/MyCSS.css" />
<title>GEFP</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="">
	$(document).ready(function(){
		$("#keyword").keyup(function(){
			keyword = $(this).val();
			$.post("list.html", {'keyWord':keyword}, function(data){
				$("#table").html(data);
			})
		});	
	});
</script>

</head>
<body>
	<div id="banner">
		<div class="header">
			<img src="../images/csula.jpg" alt="Cal State L.A."
				style="width: 41%;">
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

		<form action="" method="post">
		Search:
			<input type="text" name="keyWord" value="" id="keyword" style="width: 50%"
				placeholder="Search by Name/CIN/Email" />
		</form>
		<div id="table" style="margin-top: 10px">
			<table border="1" width="100%" class="table table-condensed">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Email</th>
					<th>CIN</th>
					<th>Operations</th>
				</tr>


				<c:choose>
					<c:when test="${fn:length(users) == 0}">
						<tr>
							<td colspan="5">No result Found</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${users}" var="user">
							<tr>
								<td>${user.id}</td>
								<td>${user.username}</td>
								<td>${user.email}</td>
								<td>${user.cin}</td>
								<td><a href="view_plan.html?id=${user.id}">View Plan</a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</table>
		</div>
	</div>

</body>
</html>
