<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700;900&family=Poppins:wght@300;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <div class="register-card">
    <h1>User Registration</h1>
    <form:form action="/save" method="post" modelAttribute="user">
        <div class="input">
            <form:label path="username">Username:</form:label><br><form:input type="text" path="username" value="${user.username}" required="true"/><br>
        </div>
        <div class="input">
            <form:label path="password">Password:</form:label><br><form:input type="password" path="password" value="${user.password}" required="true"/><br>
        </div>
        <div class="input">
            <form:label path="confirmPassword">Re-Enter Password:</form:label><br><form:input type="password" path="confirmPassword" value="${user.confirmPassword}" required="true"/><br>
        </div>
        <div class="input">
            <form:label path="email">Email:</form:label><br><form:input type="email" path="email" value="${user.email}" required="true"/><br>
        </div>
        <div class="input">
            <form:label path="contactNumber">Contact Number:</form:label><br><form:input type="number" path="contactNumber" value="${user.contactNumber}" required="true"/><br>
        </div>
        <div class="input-button">
            <input type="submit" value="Submit" class="login-button"/>&nbsp;&nbsp;
            <a href="/">Cancel</a>
        </div>
    </form:form>
</div>
    <script>
        var msg="${message}";
        if(msg!="null" && msg!=""){
            alert(msg);
        }
  </script>
</body>
</html>