<%@ page import="pl.pointsprizes.model.DAO.ExerciseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="pl.pointsprizes.model.Entity.Exercise" %>
<%@ page import="pl.pointsprizes.model.DAO.UserDao" %>
<%@ page import="pl.pointsprizes.model.Entity.User" %>
<%@ page import="pl.pointsprizes.model.DAO.GoalsDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
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
    <link rel="stylesheet" type="text/css" href="views/css/loginSuccessButtons.css">
    <link rel="stylesheet" type="text/css" href="/views/css/font.css">
    <%--<script src="/views/script/loginSuccess.js"></script>--%>


</head>
<body>

<%-- allow access only when session exists --%>

<c:if test="${cookie.user !=null}">
    <c:set var="userName" value="${cookie.user.value}"></c:set>
</c:if>
<c:if test="${cookie.JSESSIONID !=null}">
    <c:set var="sessionID" value="${cookie.JSESSIONID.value}"></c:set>
</c:if>


<div class="foo">
    <c:forEach var="i" begin="0" end="${fn:length(sessionScope.user)}" step="1">
        <span class="letter" data-letter="${fn:substring(sessionScope.user, i, i + 1)}">${fn:substring(sessionScope.user, i, i+1)}</span>
    </c:forEach>
    <span class="letter" data-letter=":">:</span>
    <c:forEach var="i" begin="0" end="${fn:length(userPoints)}" step="1">
        <span class="letter" data-letter="${fn:substring(userPoints, i, i + 1)}">${fn:substring(userPoints, i, i + 1)}</span>
    </c:forEach>
    <span class="letter" data-letter=" "> </span>
    <span class="letter" data-letter="p">p</span>
    <span class="letter" data-letter="k">k</span>
    <span class="letter" data-letter="t">t</span>
    <span class="letter" data-letter=".">.</span>
</div>

<%--<div class="foo">--%>
<%--<span class="letter" data-letter="Z">Z</span>--%>
<%--<span class="letter" data-letter="O">O</span>--%>
<%--<span class="letter" data-letter="S">S</span>--%>
<%--<span class="letter" data-letter="I">I</span>--%>
<%--<span class="letter" data-letter="A">A</span>--%>
<%--<span class="letter" data-letter=":">:</span>--%>
<%--<span class="letter" data-letter="5">5</span>--%>
<%--<span class="letter" data-letter=" "> </span>--%>
<%--<span class="letter" data-letter="p">p</span>--%>
<%--<span class="letter" data-letter="k">k</span>--%>
<%--<span class="letter" data-letter="t">t</span>--%>
<%--<span class="letter" data-letter=".">.</span>--%>

<%--<span class="letter" data-letter="P">P</span>--%>
<%--<span class="letter" data-letter="A">A</span>--%>
<%--<span class="letter" data-letter="U">U</span>--%>
<%--<span class="letter" data-letter="L">L</span>--%>

<%--<span class="letter" data-letter="A">A</span>--%>
<%--<span class="letter" data-letter="B">B</span>--%>
<%--<span class="letter" data-letter="C">C</span>--%>
<%--<span class="letter" data-letter="D">D</span>--%>
<%--<span class="letter" data-letter="E">E</span>--%>
<%--<span class="letter" data-letter="F">F</span>--%>
<%--<span class="letter" data-letter="G">G</span>--%>
<%--<span class="letter" data-letter="H">H</span>--%>
<%--<span class="letter" data-letter="I">I</span>--%>
<%--<span class="letter" data-letter="L">L</span>--%>
<%--<span class="letter" data-letter="M">M</span>--%>
<%--<span class="letter" data-letter="N">N</span>--%>
<%--<span class="letter" data-letter="O">O</span>--%>
<%--<span class="letter" data-letter="P">P</span>--%>
<%--<span class="letter" data-letter="Q">Q</span>--%>
<%--<span class="letter" data-letter="R">R</span>--%>
<%--<span class="letter" data-letter="S">S</span>--%>
<%--<span class="letter" data-letter="T">T</span>--%>
<%--<span class="letter" data-letter="U">U</span>--%>
<%--<span class="letter" data-letter="V">V</span>--%>
<%--<span class="letter" data-letter="Z">Z</span>--%>


<%--<h3>Hi ${userName}, Login Succesful. Your Session ID = ${sessionID}--%>
<%--</h3>--%>

<%--&lt;%&ndash;<h1>User = ${userName}</h1>&ndash;%&gt;--%>
<%--<h1 style='text-align:center;' font color=black>Cześć ${userName}</h1>--%>


<%--<h1>Liczba Twoich Punktów to ${userPoints}</h1>--%>

<%--<h1>Lista z wykonanymi zadaniami</h1>--%>

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

<%--<ul>--%>
<%--<li><a href="/views/addExercise.jsp" class="round green">Nowe Zadanie<span class="round">That is, if you already have an account.</span></a></li>--%>
<%--<li><a href="/views/showGoals.jsp" class="round red">Cele<span class="round">But only if you really, really want to. </span></a></li>--%>
<%--<li><a href="/views/addGoal.jsp" class="round yellow">Nowy Cel<span class="round">Take a look. This product is totally rad!</span></a></li>--%>

<%--</ul>--%>
<%--<a href="something" class="button4" style="background-color:#f14e4e">Button 1</a>--%>
<%--<a href="something" class="button4" style="background-color:#f1bb4e">Button 2</a>--%>
<%--<a href="something" class="button4" style="background-color:#84f14e">Button 3</a>--%>
<%--<a href="something" class="button4" style="background-color:#4ef18f">Button 4</a>--%>
<%--<a href="something" class="button4" style="background-color:#4e9af1">Button 5</a>--%>
<%--<a href="something" class="button4" style="background-color:#9a4ef1">Button 6</a>--%>
<%--<a href="something" class="button4" style="background-color:#f14ebd">Button 7</a>--%>

<%--<a href="something" class="button2">Button</a>--%>


<%--<button>Dodaj Zadanie</button>--%>
<a href="/views/addExercise.jsp">
    <button>Dodaj Zadanie</button>
</a>
<a href="/views/addGoal.jsp">
    <button>Dodaj Cel</button>
</a>
<a href="/views/showGoals.jsp">
    <button>Moje cele</button>
</a>
<%--<button>Dodaj cel</button>--%>
<%--<button>Moje Cele</button>--%>
<%--<button >Wyloguj</button>--%>


<form action="/LogoutServlet" method="post">
    <button type="submit" name="your_name" value="your_value" class="btn-link">Wyloguj</button>
</form>

<%--<a href="/views/addExercise.jsp">--%>
<%--<button>Dodaj zadanie</button>--%>
<%--</a>--%>
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
