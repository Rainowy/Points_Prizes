<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 10.09.19
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>editbook</title>
    <%--<link href="<c:url value="/views/css/form-style-6.css" />" rel="stylesheet">--%>
</head>

<body>


<div class="form-style-6" >
    <h1>Zmodyfikuj książkę</h1>
    <form action="/all-books" method="get">
        <input type="text" name="title" value="${title}" placeholder="Title" />
        <input type="text" name="author"  value="${author}" placeholder="Author" />
        <input type="text" name="isbn"  value="${isbn}"  placeholder="Isbn">
        <input type="submit" value="Wyślij" />
    </form>
</div>

</body>
</html>

<%--<h><h2>Zmodyfikuj książkę</h2></h>
<form action="/all-books" method="get">
    Tytuł<p><input type="text" name="title" value="${title}"> </p>
    Autor<p><input type="text" name="author" value="${author}"> </p>
    Isbn<p><input type="text" name="isbn" value="${isbn}"> </p>
    <p><input type="submit" name="Wyślij"> </p>

</form> --%>