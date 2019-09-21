<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${cookie.user.value.equalsIgnoreCase('Paul')}">
        <link rel="stylesheet" type="text/css" href="/views/css/tablePaul-style.css">
    </c:when>
    <c:when test="${cookie.user.value.equalsIgnoreCase('Zosia')}">
        <link rel="stylesheet" type="text/css" href="/views/css/tableZosia-style.css">
    </c:when>
</c:choose>
