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
    <title>add_exercise</title>
    <%--<link href="<c:url value="/views/css/addExercise.css" />" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" type="text/css" href="/views/css/addExercise.css">
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
            <%--<label for="job">Cele:</label>--%>
            <select id="job" name="exeGoal">

                <%
                    List<Goals> allGoals = (List) session.getAttribute("allGoals");
                %>
                c:<c:forEach var="goal" items="<%=allGoals%>">
                <option value=${goal.getId()}>${goal.getName()}</option>
                <%--<li>${goal.getName()} ${goal.getDescription()} ${goal.getCreated()}--%>
                <%--</li>--%>
            </c:forEach>
            </select>

        </fieldset>

        <fieldset>
            <legend><span class="number">3</span>Zaznacz by dodać nowy cel</legend>
        <div class="container">
            <div class="round">
                <input type="checkbox" id="checkbox" name="newGoal" value="true" />
                <label for="checkbox"></label>
            </div>
        </div>
            </fieldset>
        <%--<fieldset>--%>
            <%--<legend><span class="number">3</span>Dodaj nowy cel--%>
            <%--<div class="container">--%>
                <%--<div class="round">--%>
                    <%--<input type="checkbox" id="checkbox" />--%>
                    <%--<label for="checkbox"></label>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--</legend>--%>
        <%--</fieldset>--%>
        <%--<fieldset>--%>
        <%--<legend><span class="number">2</span> Additional Info</legend>--%>
        <%--<textarea name="field3" placeholder="About Your School"></textarea>--%>
        <%--</fieldset>--%>
        <input type="submit" value="Wyślij"/>
    </form>
</div>


<%--<div class="form-style-5">--%>
<%--<form>--%>
<%--<fieldset>--%>
<%--<legend><span class="number">1</span> Candidate Info</legend>--%>
<%--<input type="text" name="field1" placeholder="Your Name *">--%>
<%--<input type="email" name="field2" placeholder="Your Email *">--%>
<%--<textarea name="field3" placeholder="About yourself"></textarea>--%>
<%--<label for="job">Interests:</label>--%>
<%--<select id="job" name="field4">--%>
<%--<optgroup label="Indoors">--%>
<%--<option value="fishkeeping">Fishkeeping</option>--%>
<%--<option value="reading">Reading</option>--%>
<%--<option value="boxing">Boxing</option>--%>
<%--<option value="debate">Debate</option>--%>
<%--<option value="gaming">Gaming</option>--%>
<%--<option value="snooker">Snooker</option>--%>
<%--<option value="other_indoor">Other</option>--%>
<%--</optgroup>--%>
<%--<optgroup label="Outdoors">--%>
<%--<option value="football">Football</option>--%>
<%--<option value="swimming">Swimming</option>--%>
<%--<option value="fishing">Fishing</option>--%>
<%--<option value="climbing">Climbing</option>--%>
<%--<option value="cycling">Cycling</option>--%>
<%--<option value="other_outdoor">Other</option>--%>
<%--</optgroup>--%>
<%--</select>--%>
<%--</fieldset>--%>
<%--<fieldset>--%>
<%--<legend><span class="number">2</span> Additional Info</legend>--%>
<%--<textarea name="field3" placeholder="About Your School"></textarea>--%>
<%--</fieldset>--%>
<%--<input type="submit" value="Apply" />--%>
<%--</form>--%>
<%--</div>--%>

</body>
</html>

