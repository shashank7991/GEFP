<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form:form modelAttribute="user">
Username: <form:input path="username" /> <b><form:errors path="username" /></b><br />
Password: <form:input path="password" /> <b><form:errors path="username" /></b><br />
<input type="submit" name="save" value="Save" /> <br />
</form:form>
</body>
</html>
