<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><th>id</th><th>Name</th><th>Username</th><th>Operations</th></tr>
<c:forEach items="${users}" var="user">
<tr>
  <td>${user.id}</td>
  <td>${user.username}</td>
  <td>
<security:authorize access="hasRole('ROLE_ADMIN') or principal.username == '${user.username}'">
    <a href="view.html?id=${user.id}">Details</a>
    <a href="${user.id}.html">Details2</a>
    <a href="edit.html?id=${user.id}">Edit</a>
</security:authorize>
  </td>
</tr>
</c:forEach>
</table>

<p><a href="add.html">Add A User</a></p>

</body>
</html>
