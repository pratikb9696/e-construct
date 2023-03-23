<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700;900&family=Poppins:wght@300;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body onload="getData()">
    <c:choose>
        <c:when test="${sessionScope.loginUser==null}">
            <a href="/">Please Login</a>
        </c:when>
        <c:when test="${sessionScope.loginUser.username=='admin'}">
            <ul>
                <li><a href="/home/${sessionScope.loginUser.userType}">Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropbtn">Category</a>
                        <div class="dropdown-content">
                            <a href="/getList/all">All</a>
                            <c:forEach items="${categories}" var="category">
                                <a href="/getList/${category}">${category}</a>
                            </c:forEach>
                        </div>
                </li>
                <li><a href="/addItem">Add Product</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
            
            <div class="itemContainer">
            <c:forEach items="${itemList}" var="item">
                <div class="itemCard">
                    <img src="/images/${item.itemName}.jpg" alt="" srcset="">
                    <h2>${item.itemName}</h2>
                    <h3>${item.companyName}</h3>
                    <p>Price: &#8377;${item.price}</p>
                </div>
            </c:forEach>
            </div>
        </c:when>    
        <c:otherwise>
            <a href="/">Please Login as a Admin</a> 
        </c:otherwise>
    </c:choose>
    <script>
        function getData(){
        
        }
        
    </script>
</body>
</html>