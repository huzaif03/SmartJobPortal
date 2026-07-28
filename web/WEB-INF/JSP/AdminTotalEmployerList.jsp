<%-- 
    Document   : AdminTotalEmployerList
    Created on : 22-Jul-2026, 6:57:50 pm
    Author     : huzaif
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    List<Map<String, String>> totalEmployers = (List<Map<String, String>>) request.getAttribute("totalEmployers");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registered Workers</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminTotalEmployerList.css">
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
                    <h1>Registered Employers</h1>
                    <p>Manage all registered employers from here.</p>
                </div>
                <div class="employer-count">
                    <span>Total Employers</span>
                    <h2><%=session.getAttribute("employerCount")%></h2>
                </div>
            </div>
            <!-- ================= Search ================= -->
            <div class="search-section">
                <input type="text"
                       id="search"
                       placeholder="Search by WID, Name, Phone or Email">
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
                            if (totalEmployers != null && !totalEmployers.isEmpty()) {
                                for (Map<String, String> employers : totalEmployers) {
                        %>
                        <tr>
                            <td><%= employers.get("e_id")%></td>
                            <td><%= employers.get("name")%></td>
                            <td><%= employers.get("phone")%></td>
                            <td><%= employers.get("email")%></td>
                            <td>
                                <% if ("Banned".equals(employers.get("status"))) {
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
                                <% if ("Banned".equals(employers.get("status"))) {
                                %>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="e_id" value="<%= employers.get("e_id")%>">
                                    <input type="hidden" name="status" value="Not Banned">
                                    <input type="submit" value="Unban" class="unban-btn">
                                </form>
                                    
<!--                                <a href="#" class="ban-btn">
                                    Unban
                                </a>-->
                                <%} else {%>
                                <form action="adminupdatingstatusmodel" method="post">
                                    <input type="hidden" name="e_id" value="<%= employers.get("e_id")%>">
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
                        No employer found.
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