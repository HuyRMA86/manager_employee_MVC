<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <link href="<c:url value="/resources/users/css/style12.css"/>" type="text/css" rel="stylesheet">
    <title>Employee</title>
</head>
<body>
<header>
    <a href="" class="logo">
        <i class="fa-solid fa-users"></i>
        <span>Employee</span>
    </a>

    <div class="wellcome">

        <div class="hello">
            <c:if test="${not empty accountSession}">
                <p>Wellcome ${accountSession.account}</p>
            </c:if>
        </div>
        <a href="<%=request.getContextPath()%>/ui/logout" class="logout">
            <i class="fa-solid fa-right-from-bracket"></i
            >&nbsp;&nbsp;
            <span>Logout</span>
        </a>
    </div>
</header>

<main>
    <div class="navBar">

        <div class="dashboard">
                    <span class="icon_dashboard">
                        <i class="fa-solid fa-gauge"></i>
                    </span>
            <span>Dashboard</span>
        </div>
        <div class="manager">
            <div class="manager_emp">
                        <span class="icon_manager">
                            <i class="fa-solid fa-people-roof"></i>
                        </span>
                <span>Employee Manager</span>
            </div>

            <div class="icon_show">
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>

        <div class="choice">
            <div class="view_content" >
                <span class="icon_table">
                    <i class="fa-solid fa-table"></i>
                </span>&nbsp;&nbsp;
                <span>Employee List</span>
            </div>

            <a class="form_content" href="<%=request.getContextPath()%>/employee/add">
                        <span class="icon_table">
                            <i class="fa-solid fa-user-plus"></i></span>
                &nbsp;&nbsp;
                <span>Add Employee</span>
            </a>
        </div>
    </div>

    <div class="container">

    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

<script src="<c:url value='/resources/users/script/scriptFinal.js'/>"></script>

</body>
</html>
