<%-- 
    Document   : EHireWorker
    Created on : 01-Jul-2026, 5:41:42 pm
    Author     : huzaif
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Map<String, String>> workerHiredList = (List<Map<String, String>>) request.getAttribute("workerHiredList");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hire Status</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/EHireWorkerStatus.css">
</head>

<body>
    <%@include file="ENavBar.jsp" %>

    <div class="ehire-wrapper">

        <div class="ehire-header">
            <h1 class="ehire-title">Hire Status</h1>
            <p class="ehire-subtitle">Track the workers you've reached out to.</p>
        </div>

        <% if (workerHiredList == null || workerHiredList.isEmpty()) { %>
        <div class="ehire-empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/><rect width="20" height="14" x="2" y="6" rx="2"/></svg>
            <p>You haven't hired any worker yet.</p>
        </div>
        <% } else {
            for (Map<String, String> hr : workerHiredList) {
                String status = hr.get("hirestatus");
                String statusClass = "Accepted".equals(status) ? "status-accepted"
                        : "Rejected".equals(status) ? "status-rejected"
                        : "Completed".equals(status) ? "status-completed"
                        : "Cancelled".equals(status) ? "status-cancelled"
                        : "status-pending";

                String reqId = hr.get("request_id");

                String picPath = hr.get("profile_pic_path");
                String picUrl;
                if (picPath != null && !picPath.isEmpty()) {
                    picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=" + picPath;
                } else {
                    picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=/home/huzaif/uploads/default/default.png";
                }

                // TODO: controller should include "rating" (1-5) and "comment" once the
                // employer has rated this completed job; null/empty means not yet rated.
                String existingRating = hr.get("rating");
                String existingComment = hr.get("comment");
                boolean alreadyRated = existingRating != null && !existingRating.isEmpty();
        %>
        <div class="ehire-card">

            <div class="ehire-card-top">
                <div class="ehire-photo">
                    <img src="<%= picUrl %>" alt="<%= hr.get("name") %>" onerror="handleHireImgError(this)">
                </div>
                <div class="ehire-card-info">
                    <span class="ehire-request-id">Request #<%= reqId %></span>
                    <h2 class="ehire-name"><%= hr.get("name") %></h2>
                    <p class="ehire-occupation"><%= hr.get("occupation") %></p>
                </div>
                <span class="ehire-status-badge <%= statusClass %>"><%= status %></span>
            </div>

            <div class="ehire-card-body">
                <div class="ehire-field">
                    <span class="field-label">Location</span>
                    <span class="field-value"><%= hr.get("city") %>, <%= hr.get("state") %></span>
                </div>
                <div class="ehire-field">
                    <span class="field-label">Zip Code</span>
                    <span class="field-value"><%= hr.get("zip_code") %></span>
                </div>
            </div>

            <%-- ===================== PENDING: one-click cancel ===================== --%>
            <% if ("Pending".equals(status)) { %>
            <div class="ehire-actions">
                <%-- TODO: point at whichever servlet cancels a pending request --%>
                <form action="ecancelrequestmodel" method="post">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <input type="hidden" name="reason" value="Cancelled while pending">
                    <button type="submit" class="ehire-btn ehire-btn-cancel">Cancel Request</button>
                </form>
            </div>

            <%-- ===================== ACCEPTED: contact + confirm-cancel ===================== --%>
            <% } else if ("Accepted".equals(status)) { %>
            <div class="ehire-note note-accepted">
                <span class="field-label">Contact No.</span>
                <span class="field-value"><%= hr.get("phone") %></span>
            </div>

            <div class="ehire-actions">
                <button type="button" class="ehire-btn ehire-btn-cancel" onclick="showCancelPanel('<%= reqId %>')">
                    Cancel Request
                </button>
            </div>

            <%-- Hidden by default; revealed via JS when Cancel is clicked --%>
            <div class="ehire-cancel-panel" id="cancel-panel-<%= reqId %>" hidden>
                <p class="ehire-cancel-warning">
                    This worker has already accepted — please share why you're cancelling.
                </p>
                <%-- TODO: point at whichever servlet cancels an accepted request --%>
                <form action="ecancelrequestmodel" method="post" class="ehire-cancel-form">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <select name="reason" required>
                        <option value="" disabled selected>Select a reason</option>
                        <option value="No longer needed">No longer needed</option>
                        <option value="Hired someone else">Hired someone else</option>
                        <option value="Change of plans">Change of plans</option>
                        <option value="Other">Other</option>
                    </select>
                    <div class="ehire-cancel-form-actions">
                        <button type="button" class="ehire-btn ehire-btn-ghost" onclick="hideCancelPanel('<%= reqId %>')">
                            Never Mind
                        </button>
                        <button type="submit" class="ehire-btn ehire-btn-confirm-cancel">
                            Confirm Cancellation
                        </button>
                    </div>
                </form>
            </div>

            <%-- ===================== REJECTED ===================== --%>
            <% } else if ("Rejected".equals(status)) { %>
            <div class="ehire-note note-rejected">This worker declined the request.</div>

            <%-- ===================== CANCELLED ===================== --%>
            <% } else if ("Cancelled".equals(status)) { %>
            <div class="ehire-note note-cancelled">
                You cancelled this request<% if (hr.get("cancel_reason") != null && !hr.get("cancel_reason").isEmpty()) { %> — <%= hr.get("cancel_reason") %><% } %>.
            </div>

            <%-- ===================== COMPLETED: rating + comment ===================== --%>
            <% } else if ("Completed".equals(status)) { %>
            <div class="ehire-note note-completed">Job marked as completed by the worker.</div>

            <div class="ehire-rating-section">
                <% if (alreadyRated) { %>
                <p class="ehire-rating-label">Your Rating</p>
                <div class="star-display" aria-label="<%= existingRating %> out of 5 stars">
                    <% for (int i = 1; i <= 5; i++) { %>
                    <span class="star-display-item <%= i <= Integer.parseInt(existingRating) ? "filled" : "" %>">★</span>
                    <% } %>
                </div>
                <% if (existingComment != null && !existingComment.isEmpty()) { %>
                <p class="ehire-rating-comment">"<%= existingComment %>"</p>
                <% } %>
                <% } else { %>
                <p class="ehire-rating-label">Rate this worker</p>
                <%-- TODO: point at whichever servlet stores the rating --%>
                <form action="eratingmodel" method="post" class="ehire-rating-form">
                    <input type="hidden" name="request_id" value="<%= reqId %>">
                    <input type="hidden" name="w_id" value="<%= hr.get("w_id") %>">
                    <input type="hidden" name="e_id" value="<%= session.getAttribute("e_id") %>">

                    <div class="star-rating">
                        <input type="radio" id="star5-<%= reqId %>" name="rating" value="5" required>
                        <label for="star5-<%= reqId %>">★</label>
                        <input type="radio" id="star4-<%= reqId %>" name="rating" value="4">
                        <label for="star4-<%= reqId %>">★</label>
                        <input type="radio" id="star3-<%= reqId %>" name="rating" value="3">
                        <label for="star3-<%= reqId %>">★</label>
                        <input type="radio" id="star2-<%= reqId %>" name="rating" value="2">
                        <label for="star2-<%= reqId %>">★</label>
                        <input type="radio" id="star1-<%= reqId %>" name="rating" value="1">
                        <label for="star1-<%= reqId %>">★</label>
                    </div>

                    <textarea name="comment" placeholder="Optional — share how the job went" maxlength="300"></textarea>
                    <button type="submit" class="ehire-btn ehire-btn-submit-rating">Submit Rating</button>
                </form>
                <% } %>
            </div>
            <% } %>

        </div>
        <% }
        } %>

    </div>

    <script>
        function handleHireImgError(img) {
            img.onerror = null;
            img.src = 'data:image/svg+xml;charset=UTF-8,' + encodeURIComponent(
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">' +
                '<rect width="100" height="100" fill="#F1F3F5"/>' +
                '<circle cx="50" cy="38" r="18" fill="#C7CCD1"/>' +
                '<path d="M20 92c0-18 13.5-30 30-30s30 12 30 30" fill="#C7CCD1"/>' +
                '</svg>'
            );
        }

        function showCancelPanel(requestId) {
            document.getElementById('cancel-panel-' + requestId).hidden = false;
        }

        function hideCancelPanel(requestId) {
            document.getElementById('cancel-panel-' + requestId).hidden = true;
        }
    </script>
</body>

</html>