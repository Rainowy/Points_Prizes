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
<
<html>
<head>
    <title>Login Success Page</title>
    <meta charset="UTF-8">
</head>
<body>

<%-- allow access only when session exists --%>
<%
    String user = (String)session.getAttribute("user");
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")) userName = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    }
%>
<h3>Hi <%=userName%>, Login Succesful. Your Session ID = <%=sessionID%></h3>
<br>
User = <%=user%>
<br>
<a href="CheckoutPage.jsp">Checkout Page</a>

<form action="/Dispatch" method="post">
    <input type="hidden" name="dispatch" value="CheckOutPage">
    <input type="submit" value="Checkout">
</form>
<form action="LogoutServlet" method="post">
<input type="submit" value="Wylogowanie">
</form>
</body>
</html>
