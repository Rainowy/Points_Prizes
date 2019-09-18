<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pl.pointsprizes.model.DAO.GoalsDAO" %>
<%@ page import="pl.pointsprizes.model.Entity.Goals" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 15.09.19
  Time: 08:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show_goals</title>
</head>
<body>
<h2>Lista Twoich celów</h2>

c:<c:forEach var="goal" items="${sessionScope.allGoals}">
    *
    <li>${goal.getName()} ${goal.getDescription()} ${goal.getCreated()}</li>
    * </c:forEach>

<p><a href="/LoginSuccess">
    <button>Powrót</button>
</a></p>

<form action="/LogoutServlet" method="post">
    <input type="submit" value="Wylogowanie">
</form>
</body>
</html>
