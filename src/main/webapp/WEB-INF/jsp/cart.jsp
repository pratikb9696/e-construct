<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700;900&family=Poppins:wght@300;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        .cartContainer{
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            row-gap: 5px;
            margin: 0% 3%;
            align-items: center;
            justify-content: center;
        }

        .cartCard{
            width: 350px;
            height: 530px;
            margin: 2%;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 3px 8px;
            border-radius: 9px;
            text-align: center;
            background-color: white;
        }

        .cartCard img{
            border-radius: 9px 9px 0px 0px;
            width: 100%;
            height: 300px;
        }


    </style>
</head>
<body>
    <c:choose>
    <c:when test="${sessionScope.loginUser==null}">
        <a href="/">Please Login</a>
    </c:when>
    <c:when test="${sessionScope.loginUser.username=='admin'}">
        <a href="/">Please Login as a User</a> 
    </c:when>    
    <c:otherwise>
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
            <li><a href="/cart">My Cart</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
            <li><a href="/logout">Logout</a></li>
        </ul>
        <h1>My Cart</h1>
        <div class="cartContainer">
            <c:forEach items="${itemList}" var="prod">
                <div class="cartCard">
                    <img src="/images/${prod.itemName}.jpg" alt="" srcset="">
                    <h2>${prod.itemName}</h2>
                    <h3>${prod.companyName}</h3>
                    <p>Price: &#8377;${prod.price}</p>
                    <p>Quantity : ${prod.quantity}</p>
                    <button class="login-button"><a class="link" href="/remove?userId=${sessionScope.loginUser.userId}&itemId=${prod.itemId}">Remove</a></button>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>
    <script>

    </script>
</body>
</html>