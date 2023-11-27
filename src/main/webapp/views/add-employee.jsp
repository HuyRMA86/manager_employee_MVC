<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
    <style>
        .error {
            color: red;
            font-size: 14px;
        }
    </style>
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
        <div class="title">
            <p>Add Employee</p>
            <br>
            <p style="color: red; font-size: 20px">${msg}</p>
        </div>
        <div class="container_form">
            <div class="title_form">
                <span>Information employee</span>
            </div>
            <form:form class="form_info" action="${pageContext.request.contextPath}/employee/data" method="post" modelAttribute="addEmployee">
                <fieldset>

                    <label for="firstName">First Name</label> <br />
                    <form:input class="input" id = "firstName" path="firstName" placeholder="Enter the first name" /><br />
                    <form:errors path="firstName" cssClass="error" />
                    <br />

                    <label for="lastName">Last Name</label> <br />
                    <form:input class="input" id = "lastName" path="lastName" placeholder="Enter the last name" /><br />
                    <form:errors path="lastName" cssClass="error" />
                    <br />

                    <label for="phone">Phone Number</label> <br />
                    <form:input class="input" id = "phone" path="phone" placeholder="Enter your phone number" /><br />
                    <form:errors path="phone" cssClass="error" />
                    <br />

                    <label for="dob">Date of birth</label> <br />
                    <form:input class="input" id = "dob" path="dob" type="date"/><br />
                    <form:errors path="dob" cssClass="error" />
                    <br />

                    <label>Gender</label> <br />
                    <div class="gender_box">
                        <label class="gender" for="male">Male</label>
                        <form:radiobutton path="gender" id="male" value="MALE"/>
                        <label class="gender" for="female">Female</label>
                        <form:radiobutton path="gender" id="female" value="FEMALE" />
                    </div>
                    <form:errors path="gender" cssClass="error" /><br />

                    <label for="account">Account</label> <br />
                    <form:input class="input" id = "account" path="account" placeholder="Enter the account" /><br />
                    <form:errors path="account" cssClass="error" />
                    <br />

                    <label for="email">Email</label> <br />
                    <form:input class="input" id = "email" path="email" placeholder="your_email@example.com" /><br />
                    <form:errors path="email" cssClass="error" />
                    <br />

                    <label for="password">Password</label> <br />
                    <form:input class="input" id = "password" path="password" placeholder="Password" /><br />
                    <form:errors path="password" cssClass="error" /><br/>

                    <label for="address">Address</label> <br />
                    <form:textarea path="address" id="address" rows="2"/><br />
                    <form:errors path="address" cssClass="error" />
                    <br />


                    <label>Status</label> <br />
                    <div class="gender_box">
                        <label class="gender" for="status">Active</label>
                        <form:checkbox path="status" id="status"/><br />
                        <form:errors path="status" cssClass="error" />
                    </div>

                    <label for="departmentName">Department</label> <br />
                    <form:select class="input" path="departmentName" id="departmentName">
                        <form:option value="Fsoft Academy">Fsoft Academy</form:option>
                        <form:option value="Fsoft Marketing">Fsoft Marketing</form:option>
                        <form:option value="Fsoft IT">Fsoft IT</form:option>
                    </form:select>
                    <br />

                    <label for="remark">Remark</label> <br />
                    <form:textarea path="remark" id="remark" rows="5"/><br />
                    <form:errors path="remark" cssClass="error" />
                    <br />

                </fieldset>
                <input class="btn" type="button" onclick="back()" value="BACK" />
                <input class="btn" type="submit" value="ADD" />
                <input class="btn" type="reset" value="RESET" />
            </form:form>
        </div>
    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

<script src="<c:url value='/resources/users/script/scriptFinal.js'/>"></script>

<script>
    function back() {
        history.back();
    }
</script>

</body>
</html>

