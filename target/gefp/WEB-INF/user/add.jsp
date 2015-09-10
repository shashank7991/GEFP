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
<title>Insert title here</title>
</head>
<body>

	<form:form modelAttribute="user">

Username: <form:input path="username" />
		<b><form:errors path="username" /></b>
		<br />
Password: <form:input path="password" />
		<b><form:errors path="password" /></b>
		<br />
Role
<form:select path="role" items="${userRoles}">
			<form:options items="${userRoles}" itemValue="roleId"
				itemLabel="roleName" />
		</form:select>		
	
	Department
<form:select path="major" items="${department}">

		</form:select>
			
			Plan
<form:select path="plan" items="${plans}">


		</form:select>
		<input type="submit" name="add" value="Add" />
		<br />
	</form:form>
</body>
</html>
44444444