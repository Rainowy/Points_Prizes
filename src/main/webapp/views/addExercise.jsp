<%@ page import="pl.pointsprizes.model.Entity.Goals" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 15.09.19
  Time: 07:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/fragments/formStyleChoice.jsp"%>
    <title>add_exercise</title>
    <%--<link rel="stylesheet" type="text/css" href="/views/css/form-style.css">--%>
    <link rel="stylesheet" type="text/css" href="/views/css/buttons-style.css">
    <link rel="stylesheet" type="text/css" href="/views/css/roundCheckbox-style.css">

</head>
<body>

<div class="form-style-5">
    <form action="/addExercise" method="post">
        <fieldset>
            <legend><span class="number">1</span>Dodaj Zadanie</legend>
            <input type="text" name="exeDesc" placeholder="Opis zadania *" required>
            <input type="number" name="exePoints" placeholder="Ilość punktów *" min="1" max="5" required>
        </fieldset>
        <fieldset>
            <legend><span class="number">2</span>Wybierz Cel do dodania punktów</legend>
            <select id="job" name="exeGoal">
                <optgroup label="Cele">
                    c:<c:forEach var="goal" items="${sessionScope.allGoals}">
                    <option value=${goal.getId()}>${goal.getName()}</option>
                </c:forEach>
                </optgroup>
            </select>

        </fieldset>
        <fieldset>
            <legend><span class="number">3</span>Zaznacz by dodać nowy cel</legend>
            <div class="container">
                <div class="round">
                    <input type="checkbox" id="checkbox" name="newGoal" value="true"/>
                    <label for="checkbox"></label>
                </div>
            </div>
        </fieldset>

        <input type="submit" value="Wyślij"/>
    </form>
</div>

<a href="/LoginSuccess">
    <button>Powrót</button>
</a>
<form action="/LogoutServlet" method="post">
    <button type="submit" name="your_name" value="your_value" class="btn-link">Wyloguj</button>
</form>

</body>
</html>

