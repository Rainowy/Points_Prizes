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
    <link rel="stylesheet" type="text/css" href="/views/css/loginSuccess2.css">
    <link rel="stylesheet" type="text/css" href="/views/css/font.css">
    <link rel="stylesheet" type="text/css" href="/views/css/loginSuccessButtons.css">
</head>
<body>
<%--<h2>Lista Twoich celów</h2>--%>

<%--c:<c:forEach var="goal" items="${sessionScope.allGoals}">--%>
    <%--*--%>
    <%--<li>${goal.getName()} ${goal.getDescription()} ${goal.getCreated()}</li>--%>
    <%--* </c:forEach>--%>

<%--<p><a href="/LoginSuccess">--%>
    <%--<button>Powrót</button>--%>
<%--</a></p>--%>

<%--<form action="/LogoutServlet" method="post">--%>
    <%--<input type="submit" value="Wylogowanie">--%>
<%--</form>--%>

<span class="letter" data-letter="T">T</span>
<span class="letter" data-letter="W">W</span>
<span class="letter" data-letter="O">O</span>
<span class="letter" data-letter="J">J</span>
<span class="letter" data-letter="E">E</span>
<span class="letter" data-letter=" "> </span>
<span class="letter" data-letter="C">C</span>
<span class="letter" data-letter="E">E</span>
<span class="letter" data-letter="L">L</span>
<span class="letter" data-letter="E">E</span>
<table class="responstable">

    <thead>
    <tr>
        <th>Nazwa celu</th>
        <th>Opis celu</th>
        <th>Utworzono</th>
        <th>Liczba punktów</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="goal" items="${sessionScope.allGoals}">
        <tr>
            <td>${goal.getName()}</td>
            <td>${goal.getDescription()}</td>
            <td>${goal.getCreated()}</td>
            <td>${goal.getUser_points()}</td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<a href="/LoginSuccess">
    <button>Powrót</button>
</a>
<form action="/LogoutServlet" method="post">
    <button type="submit" name="your_name" value="your_value" class="btn-link">Wyloguj</button>
</form>










</body>
</html>

<%--<table class="responstable">--%>

    <%--<thead>--%>
    <%--<tr>--%>
        <%--<th>Nazwa celu</th>--%>
        <%--<th>Opis celu</th>--%>
        <%--<th>Utworzono</th>--%>
        <%--<th>Liczba punktów</th>--%>
    <%--</tr>--%>
    <%--</thead>--%>
    <%--<tbody>--%>

    <%--<c:forEach var="goal" items="${sessionScope.allGoals}">--%>
        <%--<tr>--%>
            <%--<td>${goal.getName()}</td>--%>
            <%--<td>${goall.getDescription()}</td>--%>
            <%--<td>${goal.getCreated()}</td>--%>
            <%--<td>${goal.getUser_points()}</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>

    <%--</tbody>--%>
<%--</table>--%>
