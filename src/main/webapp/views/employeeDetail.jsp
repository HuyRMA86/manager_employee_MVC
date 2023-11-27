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
        <div class="title">
            <p>Employee Detail</p>
        </div>

        <table class="table-detail">
            <tr class="tr-detail">
                <th>First name:</th>
                <td>${employee1.firstName}</td>
            </tr>
            <tr class="tr-detail">
                <th>Last name:</th>
                <td>${employee1.lastName}</td>
            </tr>
            <tr class="tr-detail">
                <th>Gender:</th>
                <td>${employee1.gender}</td>
            </tr>
            <tr class="tr-detail">
                <th>Account:</th>
                <td>${account.account}</td>
            </tr>
            <tr class="tr-detail">
                <th>Date of birth:</th>
                <td>${employee1.dob}</td>
            </tr>
            <tr class="tr-detail">
                <th>Phone number:</th>
                <td>${employee1.phone}</td>
            </tr>
            <tr class="tr-detail">
                <th>Email:</th>
                <td>${account.email}</td>
            </tr>
            <tr class="tr-detail">
                <th>Address:</th>
                <td>${employee1.address}</td>
            </tr>
            <tr class="tr-detail">
                <th>Department:</th>
                <td>${employee1.departmentName}</td>
            </tr>
            <tr class="tr-detail">
                <th>Status:</th>
                <td>${account.status}</td>
            </tr>
            <tr class="tr-detail">
                <th>Remark:</th>
                <td>${employee1.remark}</td>
            </tr>
        </table>


    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

<script src="<c:url value='/resources/users/script/scriptFinal.js'/>"></script>

</body>
</html>

<%-- <select class="border-0 h-100" th:field="*{field}">
                        <option selected th:value="null"> == select ==</option>
                        <option th:value="name" th:utext="#{list.option.name}"> </option>
                        <option th:value="address" th:utext="#{list.option.address}"> </option>
                        <option th:value="department" th:utext="#{list.option.department}"> </option>
                        <option th:value="phoneNumber" th:utext="#{list.option.phoneNumber}"> </option>
                    </select> --%>
     <%-- <label th:utext="#{add.label.phoneNumber}"></label>
     <input type="text" class="form-control" th:field="*{phoneNumber}" th:placeholder="#{add.placeholder.phoneNumber}" required>
     <p th:if="${#fields.hasErrors('phoneNumber')}" class="text-danger" th:errors="*{phoneNumber}"></p> --%>
     
<%-- <div>
                    <label th:utext="#{add.label.role}"></label>
                    <select th:field="*{roles}" class="form-select">
                        <option th:value="ROLE_USER" selected th:utext="#{add.option.user}"></option>
                        <option th:value="ROLE_ADMIN" th:utext="#{add.option.admin}"></option>
                    </select>
                </div> --%>



