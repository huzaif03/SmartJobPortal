<%-- 
    Document   : AdminTotalBannedUsersList
    Created on : 23-Jul-2026, 4:51:32 pm
    Author     : huzaif
--%>

<%-- 
    Document   : AdminTotalPendingRequestList
    Created on : 23-Jul-2026, 4:07:41 pm
    Author     : huzaif
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    List<Map<String, String>> bannedWorkers = (List<Map<String, String>>) request.getAttribute("bannedWorkers");
    List<Map<String, String>> bannedEmployers = (List<Map<String, String>>) request.getAttribute("bannedEmployers");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registered Workers</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminTotalBannedUsersList.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    </head>
    <body>
        <%@include file="AdminNavBar.jsp"%>
        <div class="container">
            <!-- ================= Heading ================= -->
            <div class="page-header">
                <div>
                    <h1>Banned Users</h1>
                    <p>Manage all Banned Users from here.</p>
                </div>
                <div class="employer-count">
                    <span>Total Banned Users</span>
                    <h2><%= (int)session.getAttribute("bannedWorkerCount") + (int)session.getAttribute("bannedEmployerCount") %></h2>
                </div>
            </div>
            <!-- ================= Search ================= -->
            <div class="search-section">
                <input type="text"
                       id="search"
                       placeholder="Search by WID, EID, Name, Phone or Email">
                <button>
                    <i class="fa-solid fa-magnifying-glass"></i>
                    Search
                </button>
            </div>
            <!-- ================= Table ================= -->
            <div class="table-container">
                <table id="workerTable">
                    <thead>
                        <tr>
                            <th>WID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (bannedWorkers != null && !bannedWorkers.isEmpty()) {
                                for (Map<String, String> banWorker : bannedWorkers) {
                        %>
                        <tr>
                            <td><%= banWorker.get("w_id")%></td>
                            <td><%= banWorker.get("name")%></td>
                            <td><%= banWorker.get("phone")%></td>
                            <td><%= banWorker.get("email")%></td>
                            <td>
                                <% if ("Banned".equals(banWorker.get("status"))) {
                                %>
                                <span class="banned-status">  
                                    Banned
                                </span>
                                <%} else {%>
                                <span class="active-status">  
                                    Active
                                </span>
                                <%}%>
                            </td>
                            <td>
                                <a href="#" class="view-btn">
                                    View Details
                                </a>
                                <% if ("Banned".equals(banWorker.get("status"))) {
                                %>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="w_id" value="<%= banWorker.get("w_id")%>">
                                    <input type="hidden" name="status" value="Not Banned">
                                    <input type="submit" value="Unban" class="unban-btn">
                                </form>

                                <!--                                <a href="#" class="ban-btn">
                                                                    Unban
                                                                </a>-->
                                <%} else {%>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="w_id" value="<%= banWorker.get("w_id")%>">
                                    <input type="hidden" name="status" value="Banned">
                                    <input type="submit" value="Ban" class="ban-btn">
                                </form>
                                <!--                                <a href="#" class="ban-btn">
                                                                    Ban
                                                                </a>-->
                                <%}%>
                            </td>
                        </tr>
                        <% }
                        } else {
                        %>
                    <td colspan="6" class="no-data">
                        No Banned worker found.
                    </td>
                    <% }%>
                    </tbody>
                </table>
            </div>
            <div class="table-container">
                <table id="workerTable">
                    <thead>
                        <tr>
                            <th>EID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (bannedEmployers != null && !bannedEmployers.isEmpty()) {
                                for (Map<String, String> banEmployer : bannedEmployers) {
                        %>
                        <tr>
                            <td><%= banEmployer.get("e_id")%></td>
                            <td><%= banEmployer.get("name")%></td>
                            <td><%= banEmployer.get("phone")%></td>
                            <td><%= banEmployer.get("email")%></td>
                            <td>
                                <% if ("Banned".equals(banEmployer.get("status"))) {
                                %>
                                <span class="banned-status">  
                                    Banned
                                </span>
                                <%} else {%>
                                <span class="active-status">  
                                    Active
                                </span>
                                <%}%>
                            </td>
                            <td>
                                <a href="#" class="view-btn">
                                    View Details
                                </a>
                                <% if ("Banned".equals(banEmployer.get("status"))) {
                                %>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="w_id" value="<%= banEmployer.get("e_id")%>">
                                    <input type="hidden" name="status" value="Not Banned">
                                    <input type="submit" value="Unban" class="unban-btn">
                                </form>

                                <!--                                <a href="#" class="ban-btn">
                                                                    Unban
                                                                </a>-->
                                <%} else {%>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="w_id" value="<%= banEmployer.get("e_id")%>">
                                    <input type="hidden" name="status" value="Banned">
                                    <input type="submit" value="Ban" class="ban-btn">
                                </form>
                                <!--                                <a href="#" class="ban-btn">
                                                                    Ban
                                                                </a>-->
                                <%}%>
                            </td>
                        </tr>
                        <% }
                        } else {
                        %>
                    <td colspan="6" class="no-data">
                        No Banned employer found.
                    </td>
                    <% }%>
                    </tbody>
                </table>
            </div>
            <!-- ================= Pagination ================= -->
            <div class="pagination">
                <!-- Pagination will be added later -->
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/JS/AdminTotalWorkerList.js" ></script>
    </body>
</html>

