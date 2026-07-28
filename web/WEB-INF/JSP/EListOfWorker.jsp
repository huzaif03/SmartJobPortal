<%-- 
    Document   : EListOfWorker
    Created on : 26-Jun-2026, 5:24:09 pm
    Author     : huzaif
--%>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map<String, String>> workerList = (List<Map<String, String>>) request.getAttribute("workerList");
    String msg = (String) request.getAttribute("successful");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Workers</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/EListOfWorker.css">
</head>

<body>
    <%@include file="ENavBar.jsp" %>

    <div class="elist-wrapper">

        <div class="elist-header">
            <h1 class="elist-title">Choose a Worker</h1>
            <p class="elist-subtitle">Here are the available profiles matching your selection.</p>
            <% if (msg != null) { %>
            <div class="elist-success-msg">Thanks, <%= msg %></div>
            <% } %>
        </div>

        <% if (workerList != null && !workerList.isEmpty()) { %>
        <div class="worker-grid">
            <% for (Map<String, String> worker : workerList) {
                String availability = worker.get("isAvailable");
                boolean isAvail = "Available".equals(availability);

                String picPath = worker.get("profile_pic_path");
                String picUrl;
                if (picPath != null && !picPath.isEmpty()) {
                    picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=" + picPath;
                } else {
                    // TODO: point this at a web-accessible default image (e.g. under /images/),
                    // not a server filesystem path — browsers can't load that as an <img src>.
                    picUrl = picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=default.png";;
                }
            %>
            <div class="worker-card">

                <div class="worker-photo">
                    <img src="<%= picUrl %>" alt="<%= worker.get("name") %>">
                    <span class="worker-status-badge <%= isAvail ? "status-available" : "status-unavailable" %>">
                        <%= availability %>
                    </span>
                </div>

                <div class="worker-info">
                    <h2 class="worker-name"><%= worker.get("name") %></h2>
                    <p class="worker-occupation"><%= worker.get("occupation") %></p>

                    <div class="worker-meta">
                        <div class="worker-meta-item">
                            <span class="field-label">Experience</span>
                            <span class="field-value"><%= worker.get("exp") %> yrs</span>
                        </div>
                        <div class="worker-meta-item">
                            <span class="field-label">Location</span>
                            <span class="field-value"><%= worker.get("city") %>, <%= worker.get("state") %></span>
                        </div>
                        <div class="worker-meta-item">
                            <span class="field-label">Zip Code</span>
                            <span class="field-value"><%= worker.get("zip_code") %></span>
                        </div>
                    </div>
                </div>

                <div class="worker-actions">
                    <form action="eworkerprofilemodel" method="post">
                        <input type="hidden" name="w_id" value="<%= worker.get("w_id") %>">
                        <button type="submit" class="worker-btn worker-btn-visit">Visit Profile</button>
                    </form>
                    <form action="ehireworkermodel" method="post">
                        <input type="hidden" name="w_id" value="<%= worker.get("w_id") %>">
                        <input type="hidden" name="e_id" value="<%= session.getAttribute("e_id") %>">
                        <input type="hidden" name="occupation" value="<%= worker.get("occupation") %>">
                        <button type="submit" class="worker-btn worker-btn-hire">Hire</button>
                    </form>
                </div>

            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="elist-empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            <p>Sorry, no workers are available for this category right now.</p>
        </div>
        <% } %>

    </div>
</body>

</html>