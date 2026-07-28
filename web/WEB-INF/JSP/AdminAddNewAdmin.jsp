<%-- 
    Document   : AdminAddNewAdmin
    Created on : 23-Jul-2026, 5:57:07 pm
    Author     : huzaif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Add New Admin</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/CSS/AdminAddNewAdmin.css">

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">

    </head>

    <body>

        <%@include file="AdminNavBar.jsp"%>

        <div class="container">

            <div class="page-title">

                <h1>Add New Admin</h1>

                <p>Register a new administrator for Smart Job Portal.</p>

            </div>

            <div class="register-card">

                <h2>Administrator Details</h2>

                <form action="adminaddnewadminmodel" method="post">

                    <div class="form-group">

                        <label>Full Name</label>

                        <input
                            type="text"
                            name="name"
                            placeholder="Enter full name"
                            required>

                    </div>
                    <div class="form-group">

                        <label>Gender</label>

                        <div class="gender-group">

                            <label>
                                <input type="radio"
                                       name="gender"
                                       value="Male"
                                       required>
                                Male
                            </label>

                            <label>
                                <input type="radio"
                                       name="gender"
                                       value="Female">
                                Female
                            </label>

                            <label>
                                <input type="radio"
                                       name="gender"
                                       value="Other">
                                Other
                            </label>

                        </div>

                    </div>
                    <div class="form-group">

                        <label>Mobile Number</label>

                        <input
                            type="text"
                            name="phone"
                            maxlength="10"
                            placeholder="Enter mobile number"
                            required>

                    </div>

                    <div class="form-group">

                        <label>Email Address</label>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter email address"
                            required>

                    </div>

                    <div class="form-group">

                        <label>Password</label>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter password"
                            required>

                    </div>

                    <div class="form-group">

                        <label>Confirm Password</label>

                        <input
                            type="password"
                            name="confirmPassword"
                            placeholder="Confirm password"
                            required>

                    </div>

                    <div class="button-group">

                        <input
                            type="submit"
                            value="Register Admin"
                            class="register-btn">

                        <input
                            type="reset"
                            value="Reset"
                            class="reset-btn">

                    </div>

                </form>

            </div>

        </div>

    </body>

</html>
