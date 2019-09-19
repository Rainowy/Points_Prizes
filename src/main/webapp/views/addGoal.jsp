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
    <link rel="stylesheet" type="text/css" href="/views/css/addExercise.css">
    <link rel="stylesheet" type="text/css" href="/views/css/buttons2.css">
</head>
<body>

<%
    String flag = request.getParameter("fromExercise");
    String flag2 = "";
    if (flag != null && !flag.isEmpty()) {
        flag2 = flag;
    }

%>

<%--<%=flag%>--%>

<%--${param.fromExercise}--%>


<div class="form-style-5">
    <%--<div class="form-style-2-heading">Dodaj nowy cel</div>--%>
    <form action="/addGoal" method="post">
        <fieldset>
            <legend><span class="number">1</span>Nazwa Celu</legend>
            <input type="text" name="field1" required placeholder="Nazwa Celu *">
            <legend><span class="number">2</span>Opis Celu</legend>
            <textarea name="field5" class="textarea-field" id="field5" minlength="30" required placeholder="Opis Celu *"></textarea></label
            <label><span> </span><input type="submit" value="Wyślij"/></label>
            <input type="hidden" name="fromExercise" value=<%=flag2%>>
        </fieldset>
    </form>
</div>
<%--<p><a href="/LoginSuccess">--%>
    <%--<button>Powrót</button>--%>
<%--</a></p>--%>

<%--<form action="/LogoutServlet" method="post">--%>
    <%--<input type="submit" value="Wylogowanie">--%>
<%--</form>--%>

<%--<div class="form-style-5">--%>
<%--<form action="/addGoal" method="post">--%>
<%--<fieldset>--%>
<%--<legend><span class="number">1</span>Nazwa i opis nowego celu</legend>--%>
<%--<input type="text" name="field1" required placeholder="Nazwa Celu *">--%>
<%--&lt;%&ndash;<input type="email" name="field2" placeholder="Your Email *">&ndash;%&gt;--%>
<%--&lt;%&ndash;<textarea name="field5" minlength="30" required placeholder="Opis Celu"></textarea>&ndash;%&gt;--%>
<%--&lt;%&ndash;<label for="job">Interests:</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;<select id="job" name="field4">&ndash;%&gt;--%>
<%--&lt;%&ndash;<optgroup label="Indoors">&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="fishkeeping">Fishkeeping</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="reading">Reading</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="boxing">Boxing</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="debate">Debate</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="gaming">Gaming</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="snooker">Snooker</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="other_indoor">Other</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;</optgroup>&ndash;%&gt;--%>
<%--&lt;%&ndash;<optgroup label="Outdoors">&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="football">Football</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="swimming">Swimming</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="fishing">Fishing</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="climbing">Climbing</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="cycling">Cycling</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="other_outdoor">Other</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;</optgroup>&ndash;%&gt;--%>
<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
<%--</fieldset>--%>
<%--&lt;%&ndash;<fieldset>&ndash;%&gt;--%>
<%--&lt;%&ndash;<legend><span class="number">2</span> Opis Celu</legend>&ndash;%&gt;--%>
<%--&lt;%&ndash;<textarea name="field5" placeholder="Opis Celu"></textarea>&ndash;%&gt;--%>
<%--&lt;%&ndash;</fieldset>&ndash;%&gt;--%>
<%--<input type="submit" value="Dodaj Cel" />--%>


<%--</div>--%>
<%--</form>--%>

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

<a href="/LoginSuccess">
    <button>Powrót</button>
</a>
<form action="/LogoutServlet" method="post">
    <button type="submit" name="your_name" value="your_value" class="btn-link">Wyloguj</button>
</form>
</body>
</html>
