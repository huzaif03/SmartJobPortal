<%-- 
    Document   : AdminTotalAdminsList
    Created on : 23-Jul-2026, 2:51:11 pm
    Author     : huzaif
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    List<Map<String, String>> totalAdmins = (List<Map<String, String>>) request.getAttribute("totalAdmins");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registered Admins</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminTotalAdminsList.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    </head>
    <body>
        <%@include file="AdminNavBar.jsp"%>
        <div class="container">
            <!-- ================= Heading ================= -->
            <div class="page-header">
                <div class="header-left">

                    <h1>Registered Admins</h1>

                    <p>Manage all registered admins from here.</p>
                    <p><%= request.getAttribute("succesfull") %> </p>
                </div>

                <div class="header-right">

                    <% if ((Integer) session.getAttribute("admin_id") == 1) { %>

                    <a href="AdminAddNewAdmin" class="add-admin-btn">

                        <i class="fa-solid fa-plus"></i>

                        Add New Admin

                    </a>

                    <% }%>

                    <div class="admin-count">

                        <span>Total Admins</span>

                        <h2><%=session.getAttribute("adminCount")%></h2>

                    </div>

                </div>
            </div>
            <!-- ================= Search ================= -->
            <div class="search-section">
                <input type="text"
                       id="search"
                       placeholder="Search by Admin ID, Name, Phone or Email">
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
                            <th>AID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Role</th>
                            <% if ((int) session.getAttribute("admin_id") == 1) {
                                %>
                            <th>Actions</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (totalAdmins != null && !totalAdmins.isEmpty()) {
                                for (Map<String, String> admin : totalAdmins) {
                        %>
                        <tr>
                            <td><%= admin.get("admin_id")%></td>
                            <td><%= admin.get("name")%></td>
                            <td><%= admin.get("phone")%></td>
                            <td><%= admin.get("email")%></td>
                            <td><%if (Integer.parseInt(admin.get("admin_id")) == 1) {
                                %>
                                <span class="master-admin">

                                    Master Admin

                                </span>
                                <%}else { %>
                                <span class="admin-role">

                                    Admin

                                </span>
                                <% } %>
                            </td>

                            <td>
                                <% if ((int) session.getAttribute("admin_id") == 1) {
                                %>
                                <a href="#" class="view-btn">
                                    View Details
                                </a>  
                                <%if (Integer.parseInt(admin.get("admin_id")) != 1) {
                                %>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="w_id" value="<%= admin.get("admin_id")%>">
                                    <input type="hidden" name="status" value="Not Banned">
                                    <input type="submit" value="Remove" class="remove-btn">
                                </form>
                                <% } %>
                                <!--                                <a href="#" class="ban-btn">
                                                                 Unban
                                                                </a>-->
                                <%} %>
                            </td>
                        </tr>
                        <% } }
                            else{ %>
                    <td colspan="6" class="no-data">
                        No admin found.
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