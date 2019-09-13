<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 12.09.19
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout Page</title>
</head>
<body>
<%
    String userName = null;
    String sessionId = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) userName = cookie.getValue();

        }
    }
%>
<h3> Hi <%=userName%>, do the checkout</h3>

<form action="LogoutServlet" method="post">
<input type="submit" value="Logout">
</form>
</body>
</html>
