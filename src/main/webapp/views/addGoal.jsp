<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 15.09.19
  Time: 07:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add_goal</title>
</head>
<body>

<%String flag = request.getParameter("fromExercise");
String flag2 ="";
if(flag != null && !flag.isEmpty()){
   flag2 =flag;
}

%>

<%--<%=flag%>--%>

<%--${param.fromExercise}--%>


<div class="form-style-2">
    <div class="form-style-2-heading">Dodaj nowy cel</div>
    <form action="/addGoal" method="post">
        <label for="field1"><span>Nazwa celu<span class="required">*</span></span><input type="text" class="input-field" name="field1" value="" id="field1" required/></label>

        <label for="field5"><span>Opis celu<span class="required">*</span></span><textarea name="field5" class="textarea-field" id="field5" minlength="30"></textarea></label>

        <label><span> </span><input type="submit" value="Submit" /></label>
        <input type="hidden"  name="fromExercise" value=<%=flag2%>>
    </form>
</div>
<p><a href="/LoginServlet"><button>Powrót</button>   </a></p>

<form action="/LogoutServlet" method="post">
    <input type="submit" value="Wylogowanie">
</form>
</body>
</html>
