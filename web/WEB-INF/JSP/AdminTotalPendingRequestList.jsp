<%-- 
    Document   : AdminTotalPendingRequestList
    Created on : 23-Jul-2026, 4:07:41 pm
    Author     : huzaif
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    List<Map<String, String>> pendingRequests = (List<Map<String, String>>) request.getAttribute("pendingRequests");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registered Workers</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminTotalPendingRequestList.css">
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
                    <h1>Pending Hire Requests</h1>
                    <p>Manage all Pending Hire Requests from here.</p>
                </div>
                <div class="employer-count">
                    <span>Total Pending Hire Requests</span>
                    <h2><%=session.getAttribute("pendingRequestsCount")%></h2>
                </div>
            </div>
            <!-- ================= Search ================= -->
            <div class="search-section">
                <input type="text"
                       id="search"
                       placeholder="Search by Request ID, EID, WID or Occupation ">
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
                            <th>Request ID</th>
                            <th>WID</th>
                            <th>EID</th>
                            <th>Occupation</th>
                            <th>Hire Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (pendingRequests != null && !pendingRequests.isEmpty()) {
                                for (Map<String, String> pending : pendingRequests) {
                        %>
                        <tr>
                            <td><%= pending.get("request_id")%></td>
                            <td><%= pending.get("w_id")%></td>
                            <td><%= pending.get("e_id")%></td>
                            <td><%= pending.get("occupation")%></td>
                            <td><span class="ehire-status-badge status-pending">Pending</span></td>
                            <td>
                                <a href="#" class="view-btn">
                                    View Details
                                </a>
                            </td>
                        </tr>
                        <% }
                        } else {
                        %>
                    <td colspan="6" class="no-data">
                        No Pending Hire Requests found.
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
