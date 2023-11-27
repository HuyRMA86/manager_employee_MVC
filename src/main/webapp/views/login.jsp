<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>Login</title>
    <link href="<c:url value="/resources/users/css/style1.css" />" type="text/css" rel="stylesheet">

</head>
    <body>

        <div class="form">
            <div class="titleForm"><span>Member Login</span></div>
            <form id="loginForm" class="accountForm" method="post" action="<%=request.getContextPath()%>/ui/login">
                <input
                        class="input"
                        id="email"
                        type="email"
                        name="email"
                        placeholder="E-mail"
                        minlength="5"
                        maxlength="50"
                        required
                /><br/>

                <input
                        class="input"
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password"
                        minlength="8"
                        maxlength="30"
                        required
                /><br/>

                <input type="submit" value="Login" class="submit"/><br/>

            </form>
            <input type="submit" value="Forgot Password" class="forgot_password"/><br/>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

    </body>
</html>
