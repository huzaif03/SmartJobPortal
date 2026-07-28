<%-- 
    Document   : AdminTotalHireRequestsList
    Created on : 23-Jul-2026, 3:24:59 pm
    Author     : huzaif
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    List<Map<String, String>> hireRequests = (List<Map<String, String>>) request.getAttribute("hireRequests");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registered Workers</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/AdminTotalHireRequestsList.css">
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
                    <h1>Hire Requests</h1>
                    <p>Manage all Hire Requests from here.</p>
                </div>
                <div class="employer-count">
                    <span>Total Hire Requests</span>
                    <h2><%=session.getAttribute("hireRequestsCount")%></h2>
                </div>
            </div>
            <!-- ================= Search ================= -->
            <div class="search-section">
                <input type="text"
                       id="search"
                       placeholder="Search by Request ID, EID, WID, Occupation or Hire Status">
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
                            if (hireRequests != null && !hireRequests.isEmpty()) {
                                for (Map<String, String> hire : hireRequests) {
                                    String statusClass = "Accepted".equals(hire.get("hirestatus")) ? "status-accepted"
                                            : "Rejected".equals(hire.get("hirestatus")) ? "status-rejected"
                                            : "Completed".equals(hire.get("hirestatus")) ? "status-completed"
                                            : "Cancelled".equals(hire.get("hirestatus")) ? "status-cancelled"
                                            : "status-pending";
                        %>
                        <tr>
                            <td><%= hire.get("request_id")%></td>
                            <td><%= hire.get("w_id")%></td>
                            <td><%= hire.get("e_id")%></td>
                            <td><%= hire.get("occupation")%></td>
                            <td><span class="ehire-status-badge <%= statusClass%>"><%= hire.get("hirestatus")%></span></td>
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
                        No Hire Requests found.
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
