<%-- 
    Document   : WNotification
    Created on : 24-Jun-2026, 3:03:47 pm (redesigned 21-Jul-2026 to match EHireWorker card style)
    Author     : huzaif
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map<String, String>> allRequests = (List<Map<String, String>>) request.getAttribute("allRequests");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Notifications</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNotification.css">
</head>

<body>
    <%@include file="WNavBar.jsp" %>

    <div class="notif-wrapper">

        <div class="notif-header">
            <h1 class="notif-title">Notifications</h1>
            <p class="notif-subtitle">Hire requests from employers show up here.</p>
        </div>

        <%-- FIX: was `== null && .isEmpty()`, which throws a NullPointerException
             whenever allRequests is null, since && still evaluates the right side. --%>
        <% if (allRequests == null || allRequests.isEmpty()) { %>
        <div class="notif-empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
            <p>You don't have any notifications yet.</p>
        </div>
        <% } else {
            for (Map<String, String> re : allRequests) {
                String status = re.get("hirestatus");
                String statusClass = "Accepted".equals(status) ? "status-accepted"
                        : "Rejected".equals(status) ? "status-rejected"
                        : "Completed".equals(status) ? "status-completed"
                        : "Cancelled".equals(status) ? "status-cancelled"
                        : "status-pending";

                String reqId = re.get("request_id");

                // TODO: controller should include "rating" (1-5) and "comment" once the
                // employer has rated this completed job; null/empty means not yet rated.
                String existingRating = re.get("rating");
                String existingComment = re.get("comment");
                boolean alreadyRated = existingRating != null && !existingRating.isEmpty();
        %>

        <div class="notif-card">

            <div class="notif-card-header">
                <span class="notif-request-id">Request #<%= reqId %></span>
                <span class="notif-status-badge <%= statusClass %>"><%= status %></span>
            </div>

            <div class="notif-card-body">
                <div class="notif-field">
                    <span class="field-label">Employer</span>
                    <span class="field-value"><%= re.get("name") %></span>
                </div>
                <div class="notif-field">
                    <span class="field-label">Occupation</span>
                    <span class="field-value"><%= re.get("occupation") %></span>
                </div>
                <div class="notif-field">
                    <span class="field-label">Location</span>
                    <span class="field-value"><%= re.get("city") %>, <%= re.get("state") %></span>
                </div>
                <div class="notif-field">
                    <span class="field-label">Zip Code</span>
                    <span class="field-value"><%= re.get("zip_code") %></span>
                </div>
            </div>

            <%-- ===================== PENDING: accept / reject ===================== --%>
            <% if ("Pending".equals(status)) { %>
            <div class="notif-actions">
                <form action="wupdatinghirestatusmodel" method="post">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <input type="hidden" name="ans" value="Rejected">
                    <button type="submit" class="notif-btn notif-btn-reject">Reject</button>
                </form>
                <form action="wupdatinghirestatusmodel" method="post">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <input type="hidden" name="ans" value="Accepted">
                    <button type="submit" class="notif-btn notif-btn-accept">Accept</button>
                </form>
            </div>

            <%-- ===================== ACCEPTED: mark completed ===================== --%>
            <% } else if ("Accepted".equals(status)) { %>
            <div class="notif-note note-accepted">
                <span class="field-label">Contact No.</span>
                <span class="field-value"><%= re.get("phone") %></span>
            </div>
            <div class="notif-actions">
                <%-- TODO: point this at whichever servlet marks a request as Completed --%>
                <form action="wupdatinghirestatusmodel" method="post">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <input type="hidden" name="ans" value="Completed">
                    <button type="submit" class="notif-btn notif-btn-complete">Mark as Completed</button>
                </form>
            </div>

            <%-- ===================== REJECTED ===================== --%>
            <% } else if ("Rejected".equals(status)) { %>
            <div class="notif-note note-rejected">You declined this request.</div>

            <%-- ===================== CANCELLED ===================== --%>
            <% } else if ("Cancelled".equals(status)) { %>
            <div class="notif-note note-cancelled">
                Employer cancelled this request<% if (re.get("cancel_reason") != null && !re.get("cancel_reason").isEmpty()) { %> — <%= re.get("cancel_reason") %><% } %>.
            </div>

            <%-- ===================== COMPLETED: show employer's rating, if any ===================== --%>
            <% } else if ("Completed".equals(status)) { %>
            <div class="notif-note note-completed">Job marked as completed.</div>

            <% if (alreadyRated) { %>
            <div class="notif-rating-section">
                <p class="notif-rating-label">Employer Rating</p>
                <div class="star-display" aria-label="<%= existingRating %> out of 5 stars">
                    <% for (int i = 1; i <= 5; i++) { %>
                    <span class="star-display-item <%= i <= Integer.parseInt(existingRating) ? "filled" : "" %>">★</span>
                    <% } %>
                </div>
                <% if (existingComment != null && !existingComment.isEmpty()) { %>
                <p class="notif-rating-comment">"<%= existingComment %>"</p>
                <% } %>
            </div>
            <% } %>
            <% } %>
        </div>
        <% }
        } %>

    </div>
</body>

</html>