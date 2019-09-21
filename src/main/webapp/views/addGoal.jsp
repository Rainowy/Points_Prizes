<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 15.09.19
  Time: 07:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/fragments/formStyleChoice.jsp"%>
    <title>add_goal</title>
    <%--<link rel="stylesheet" type="text/css" href="/views/css/form-style.css">--%>
    <link rel="stylesheet" type="text/css" href="/views/css/buttons-style.css">
</head>
<body>

<c:if test="${(param.fromExercise != null)&&(not empty param.fromExercise)}">
    <c:set var="flag" value="${param.fromExercise}" ></c:set>
</c:if>

<div class="form-style-5">
    <form action="/addGoal" method="post">
        <fieldset>
            <legend><span class="number">1</span>Nazwa Celu</legend>
            <input type="text" name="field1" required placeholder="Nazwa Celu *">
            <legend><span class="number">2</span>Opis Celu</legend>
            <textarea name="field5" class="textarea-field" id="field5" minlength="30" required placeholder="Opis Celu *"></textarea></label
            <label><span> </span><input type="submit" value="Wyślij"/></label>
            <input type="hidden" name="fromExercise" value=${flag}>
        </fieldset>
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