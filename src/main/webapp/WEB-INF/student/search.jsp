<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%" class="table table-condensed">
<tr><th>id</th><th>Name</th><th>Email</th><th>CIN</th><th>Operations</th></tr>
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
  <td>
    <a href="view_plan.html?id=${user.id}">View Plan</a>
  </td>
</tr>
</c:forEach>
 
 </c:otherwise>
</c:choose>

</table>


</body>
</html>
