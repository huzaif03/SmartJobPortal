<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminLogin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
</head>
<body>
<%@include file="AdminNavBar.jsp" %>
<div class="content">
    <div class="container-detail">
        <h1>Admin Login <i class="fa-solid fa-shield-halved"></i></h1>
    </div>
    <div class="container">
        <div class="admin-title">
            <i class="fa-solid fa-user-shield"></i>
            <span>Administrator</span>
        </div>
        <form action="adminloginmodel" method="post">
            <div class="form-group">
                <label>Email or Mobile No. :-</label>
                <input type="text"
                       name="username"
                       placeholder="Enter Email or Mobile">
            </div>
            <div class="form-group">
                <label>Password :-</label>
                <div class="password-box">
                    <input type="password"
                           name="password"
                           placeholder="Enter Password">
                    <i class="fa-solid fa-eye"></i>
                </div>
            </div>
            <input type="submit"
                   value="Login"
                   id="submit">
        </form>
    </div>
</div>
</body>
</html>