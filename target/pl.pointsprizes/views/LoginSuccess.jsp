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

    <%@ include file="/WEB-INF/views/fragments/tableStyleChoice.jsp"%>


    <title>Login Success Page</title>
    <%--<meta charset="UTF-8">--%>



    <%--<c:choose>--%>
        <%--<c:when test="${cookie.user.value.equalsIgnoreCase('Pawełek')}">--%>
            <%--<link rel="stylesheet" type="text/css" href="/views/css/tablePaul-style.css">--%>
        <%--</c:when>--%>
        <%--<c:when test="${cookie.user.value.equalsIgnoreCase('Zosia')}">--%>
            <%--<link rel="stylesheet" type="text/css" href="/views/css/tableZosia-style.css">--%>
        <%--</c:when>--%>
    <%--</c:choose>--%>

    <%--<c:if test="${cookie.user.value.equalsIgnoreCase('Pawełek')}">--%>
    <%--&lt;%&ndash;<style>&ndash;%&gt;--%>
    <%--&lt;%&ndash;body {&ndash;%&gt;--%>
    <%--&lt;%&ndash;background-image: url("/views/images/sw1.jpg");&ndash;%&gt;--%>
    <%--&lt;%&ndash;background-size:cover&ndash;%&gt;--%>
    <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--&lt;%&ndash;</style>&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css" href="/views/css/tablePaul-style.css">--%>
    <%--<h1> jest Zosia</h1>--%>
    <%--</c:if>--%>


    <%--<link rel="stylesheet" type="text/css" href="/views/css/tableZosia-style.css">--%>
    <link rel="stylesheet" type="text/css" href="/views/css/loginSuccessButtons-style.css">
    <link rel="stylesheet" type="text/css" href="/views/css/font-style.css">
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

<p style="text-align:left;">Points_Prizes_ver._1.0</p>


<div class="foo">
    <c:forEach var="i" begin="0" end="${fn:length(sessionScope.user)}" step="1">
        <span class="letter"
              data-letter="${fn:substring(sessionScope.user, i, i + 1)}">${fn:substring(sessionScope.user, i, i+1)}</span>
    </c:forEach>
    <span class="letter" data-letter=":">:</span>
    <c:forEach var="i" begin="0" end="${fn:length(userPoints)}" step="1">
        <span class="letter"
              data-letter="${fn:substring(userPoints, i, i + 1)}">${fn:substring(userPoints, i, i + 1)}</span>
    </c:forEach>
    <span class="letter" data-letter=" "> </span>
    <span class="letter" data-letter="p">p</span>
    <span class="letter" data-letter="k">k</span>
    <span class="letter" data-letter="t">t</span>
    <span class="letter" data-letter=".">.</span>
</div>

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

<a href="/views/addExercise.jsp">
    <button>Dodaj Zadanie</button>
</a>
<a href="/views/addGoal.jsp">
    <button>Dodaj Cel</button>
</a>
<a href="/views/showGoals.jsp">
    <button>Moje cele</button>
</a>

<form action="/LogoutServlet" method="post">
    <button type="submit" name="your_name" value="your_value" class="btn-link">Wyloguj</button>
</form>

</body>
</html>
