<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- <%@ taglib uri="jakarta.tags.core" prefix="c" %> -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Register</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700;900&family=Poppins:wght@300;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/main.js"></script>
    <style>
       
           </style>
</head>
<body>
    <div class="login-card">
        <h1>User Login</h1>
        <form:form action="/login" method="post" modelAttribute="user">
            <div class="input">
                <form:label path="username">Username: </form:label><br><form:input type="text" path="username" required="true"/>
            </div>
            <div class="input">
                <form:label path="password">Password: </form:label><br><form:input type="password" path="password" required="true"/>
            </div>
            <div class="input-button">
                <input class="login-button" type="submit" value="Login"/>
            </div>
        </form:form>
        <div class="card-footer">
        New User? <a href="/register">Register here</a>
        </div>
    </div>
  <script>
        var msg="${message}";
        if(msg!="null" && msg!=""){
            alert(msg);
        }
  </script>
</body>
</html>