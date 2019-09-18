<%@ page import="pl.pointsprizes.model.DAO.ExerciseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="pl.pointsprizes.model.Entity.Exercise" %>
<%@ page import="pl.pointsprizes.model.DAO.UserDao" %>
<%@ page import="pl.pointsprizes.model.Entity.User" %>
<%@ page import="pl.pointsprizes.model.DAO.GoalsDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 12.09.19
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%-- todo dodać nagłówek i stopke --%>
<html>
<head>
    <title>Login Success Page</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/views/css/loginSuccess2.css">
    <script src="/views/script/loginSuccess.js"></script>
</head>
<body>

<%-- allow access only when session exists --%>

<c:if test="${cookie.user !=null}">
    <c:set var="userName" value="${cookie.user.value}"></c:set>
</c:if>
<c:if test="${cookie.JSESSIONID !=null}">
    <c:set var="sessionID" value="${cookie.JSESSIONID.value}"></c:set>
</c:if>

<h3>Hi ${userName}, Login Succesful. Your Session ID = ${sessionID}
</h3>
<br>
<%--<h1>User = ${userName}</h1>--%>
<h1 style='text-align:center;' font color=black>Cześć ${userName}</h1>
<br>


<h1>Liczba Twoich Punktów to ${userPoints}
</h1>

<h1>Lista z wykonanymi zadaniami</h1>

<table class="responstable">

    <thead>
    <tr>
        <th>Opis zadania</th>
        <th>Utworzono</th>
        <th>Liczba punktów</th>
    </tr>
    </thead>
    <tbody>

        <c:forEach var="exercise" items="${sessionScope.allExercises}">
        <tr>
            <td>${exercise.getDescription()}</td>
            <td>${exercise.getCreated()}</td>
            <td>${exercise.getExe_points()}</td>
        </tr>
        </c:forEach>

    </tbody>
</table>

<ul>
    <li><a href="/views/addExercise.jsp" class="round green">Nowe Zadanie<span class="round">That is, if you already have an account.</span></a></li>
    <li><a href="/views/showGoals.jsp" class="round red">Cele<span class="round">But only if you really, really want to. </span></a></li>
    <li><a href="/views/addGoal.jsp" class="round yellow">Nowy Cel<span class="round">Take a look. This product is totally rad!</span></a></li>

</ul>
<li><form  action="/LogoutServlet" method="post" class="round green">
    <input type="submit" value="WYLOGUJ" />
</form></li>

<%--<p><a href="/views/addExercise.jsp">--%>
    <%--<button>Dodaj nowe zadanie</button>--%>
<%--</a></p>--%>
<%--<p><a href="/views/showGoals.jsp">--%>
    <%--<button>Wyświetl moje cele</button>--%>
<%--</a></p>--%>

<%--<p><a href="/views/addGoal.jsp">--%>
    <%--<button>Dodaj nowy cel</button>--%>
<%--</a></p>--%>


<%--<a href="CheckoutPage.jsp">Checkout Page</a>--%>

<%--<form action="/Dispatch" method="post">--%>
<%--<input type="hidden" name="dispatch" value="CheckOutPage">--%>
<%--<input type="submit" value="Checkout">--%>
<%--</form>--%>

<%--<form action="/LogoutServlet" method="post">--%>
    <%--<input type="submit" value="Wylogowanie">--%>
<%--</form>--%>
</body>
</html>
