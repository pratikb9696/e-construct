<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Item</title>
</head>
<body>
    <c:choose>
    <c:when test="${sessionScope.loginUser==null}">
        <a href="/">Please Login</a>
    </c:when>
    <c:when test="${sessionScope.loginUser.username=='admin'}">
        <h1>Add New Item</h1>
        <form:form action="/saveItem" method="post" modelAttribute="item">
            <form:label path="itemName">Item Name: </form:label> <form:input type="text" path="itemName" value="${item.itemName}"/><br>
            <form:label path="companyName">companyName: </form:label> <form:input type="text" path="companyName" value="${item.companyName}"/><br>
            <form:label path="price">Price(INR): </form:label> <form:input type="number" path="price" value="${item.price}"/><br>
            <form:label path="quantity">Quantity: </form:label> <form:input type="number" path="quantity" value="${item.quantity}"/><br>
            <form:label path="category">Category: </form:label> <form:input type="text" path="category" value="${item.category}"/><br>
            <input type="submit" value="Submit"/>
        </form:form>
    </c:when>    
    <c:otherwise>
        <a href="/">Please Login as a Admin</a> 
    </c:otherwise>
</c:choose>
    
    
    <script>
  </script>
</body>
</html>