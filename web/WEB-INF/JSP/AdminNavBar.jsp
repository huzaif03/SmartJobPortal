<%-- 
    Document   : AdminNavBar
    Created on : 21-Jul-2026, 6:52:16 pm
    Author     : huzaif
--%>
<%--
    Document   : AdminNavBar.jsp
    Created on : 21-Jul-2026
    Author     : Huzaifa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession navSession = request.getSession(false);
    boolean isAdminLoggedIn =
            (navSession != null && navSession.getAttribute("admin_id") != null);
    String role = "";
    if(isAdminLoggedIn){
        if(navSession.getAttribute("admin_id").equals(1)) role = "Main";
        
    }
    boolean isMainAdmin = "Main".equals(role);
%>
<nav class="nav-bar">
    <!-- ================= Logo ================= -->
    <div class="logo">
        <a href="AdminDashboard">
            <div class="svg-logo">
                <img src="${pageContext.request.contextPath}/Logo/logo_svg.svg"
                     alt="Logo">
            </div>
            <h1>Smart Job Portal</h1>
        </a>
    </div>
    <div class="middle"></div>
    <!-- ================= Navigation ================= -->
    <div class="left">
        <% if(isAdminLoggedIn){ %>
        <div class="nav-dashboard">
            <a href="admindashboardmodel"
               class="active-dashboard">Dashboard</a>
        </div>
        <div class="workers">
            <a href="admintotaluserslistmodel?action=worker" class="active-worker">Workers</a>
        </div>
        <div class="employers">
            <a href="admintotaluserslistmodel?action=employer" class="active-employer">Employers</a>
        </div>
        <div class="hire">
            <a href="admintotaluserslistmodel?action=hirerequests" class="active-hirerequests">Hire Requests</a>
        </div>
        <% if(isMainAdmin){ %>
        <div class="admins">
            <a href="admintotaluserslistmodel?action=admin" class="active-admin">Manage Admins</a>
        </div>
        <% } %>
        <div class="logout">
            <a href="adminlogoutmodel">Logout</a>
        </div>
        <% }else{ %>
        <div class="nav-dashboard">
            <a href="AdminLogin">Dashboard</a>
        </div>
        <div class="workers">
            <a href="AdminLogin">Workers</a>
        </div>
        <div class="employers">
            <a href="AdminLogin">Employers</a>
        </div>
        <div class="hire">
            <a href="AdminLogin">Hire Requests</a>
        </div>
        <div class="logout">
            <a href="AdminLogin">Login</a>
        </div>
        <% } %>
    </div>
</nav>
