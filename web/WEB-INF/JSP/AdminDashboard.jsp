<%-- 
    Document   : AdminDashboard
    Created on : 09-Jul-2026, 3:07:08 pm
    Author     : huzaif
--%>
<%
        if(session == null){
           request.setAttribute("emptysession", "Please Login First");          
           response.sendRedirect("AdminLogin");
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminDashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    </head>
    <body>
        <!-- Navbar Space -->
        <%@include file="AdminNavBar.jsp" %>
        <div class="dashboard">
            <h1>Dashboard</h1>
            <p>Welcome, Administrator <%= session.getAttribute("name") %></p>
            <div class="card-container">
                <!-- Total Workers -->
                <div class="card">
                    <div class="card-top">
                        <h3>Total Workers</h3>
                        <i class="fa-solid fa-users icon"></i>
                    </div>
                    <h2 class="number"><%= session.getAttribute("workerCount") %></h2>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=worker">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <!-- Total Employers -->
                <div class="card">
                    <div class="card-top">
                        <h3>Total Employers</h3>
                        <i class="fa-solid fa-building icon"></i>
                    </div>
                    <h2 class="number"><%= session.getAttribute("employerCount") %></h2>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=employer">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <!-- Total Admins -->
                <div class="card">
                    <div class="card-top">
                        <h3>Total Admins</h3>
                        <i class="fa-solid fa-user-shield icon"></i>
                    </div>
                    <h2 class="number"><%= session.getAttribute("adminCount") %></h2>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=admin">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <!-- Hire Requests -->
                <div class="card">
                    <div class="card-top">
                        <h3>Hire Requests</h3>
                        <i class="fa-solid fa-file-signature icon"></i>
                    </div>
                    <h2 class="number"><%= session.getAttribute("hireRequestsCount") %></h2>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=hirerequests">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <!-- Pending Requests -->
                <div class="card">
                    <div class="card-top">
                        <h3>Pending Requests</h3>
                        <i class="fa-solid fa-clock icon"></i>
                    </div>
                    <h2 class="number"><%= session.getAttribute("pendingCount") %></h2>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=pendingrequests">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <!-- Banned Users -->
                <div class="card">
                    <div class="card-top">
                        <h3>Banned Users</h3>
                        <i class="fa-solid fa-user-slash banned-icon"></i>
                    </div>
                    <div class="banned">
                        <p><span>Workers</span><span><%= session.getAttribute("bannedWorkerCount") %></span></p>
                        <p><span>Employers</span><span><%= session.getAttribute("bannedEmployerCount") %></span></p>
                        <hr>
                        <p class="total"><span>Total</span><span><%= (int)session.getAttribute("bannedWorkerCount") + (int)session.getAttribute("bannedEmployerCount") %></span></p>
                    </div>
                    <div class="card-footer">
                        <a href="admintotaluserslistmodel?action=bannedusers">
                            View Details
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
