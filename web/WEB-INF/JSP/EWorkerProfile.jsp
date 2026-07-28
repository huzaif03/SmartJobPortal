<%-- 
    Document   : EWorkerProfile
    Created on : 01-Jul-2026, 3:17:21 pm
    Author     : huzaif
--%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map<String, String> worker = (Map<String, String>) request.getAttribute("worker");

    String picPath = (worker != null) ? worker.get("profile_pic_path") : null;
    String picUrl;
    if (picPath != null && !picPath.isEmpty()) {
        picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=" + picPath;
    } else {
        picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=default.png";
    }

    boolean isAvail = worker != null && "Available".equals(worker.get("isAvailable"));
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/EWorkerProfile.css">
</head>

<body>
    <%@include file="ENavBar.jsp" %>

    <div class="ewp-wrapper">
        <div class="ewp-card">

            <div class="ewp-header">
                <div class="ewp-photo">
                    <img src="<%= picUrl %>" alt="<%= worker.get("name") %>" onerror="handleWorkerImgError(this)">
                </div>
                <div class="ewp-header-info">
                    <span class="ewp-status-badge <%= isAvail ? "status-available" : "status-unavailable" %>">
                        <%= worker.get("isAvailable") %>
                    </span>
                    <h1 class="ewp-name"><%= worker.get("name") %></h1>
                    <p class="ewp-occupation"><%= worker.get("occupation") %></p>
                </div>
            </div>

            <div class="ewp-section">
                <p class="ewp-section-title">Details</p>
                <div class="ewp-detail-grid">
                    <div class="ewp-detail-item">
                        <span class="field-label">Age</span>
                        <span class="field-value"><%= worker.get("age") %></span>
                    </div>
                    <div class="ewp-detail-item">
                        <span class="field-label">Experience</span>
                        <span class="field-value"><%= worker.get("exp") %> yrs</span>
                    </div>
                    <div class="ewp-detail-item">
                        <span class="field-label">Location</span>
                        <span class="field-value"><%= worker.get("city") %>, <%= worker.get("state") %></span>
                    </div>
                    <div class="ewp-detail-item">
                        <span class="field-label">Zip Code</span>
                        <span class="field-value"><%= worker.get("zip_code") %></span>
                    </div>
                </div>
            </div>

            <div class="ewp-section">
                <p class="ewp-section-title">Bio</p>
                <p class="ewp-bio"><%= worker.get("bio") %></p>
            </div>

            <div class="ewp-actions">
                <form action="ehireworkermodel" method="post">
                    <input type="hidden" name="w_id" value="<%= worker.get("w_id") %>">
                    <input type="hidden" name="e_id" value="<%= session.getAttribute("e_id") %>">
                    <input type="hidden" name="occupation" value="<%= worker.get("occupation") %>">
                    <button type="submit" class="ewp-hire-btn">Hire <%= worker.get("name") %></button>
                </form>
            </div>

        </div>
    </div>

    <script>
        // If the worker's photo fails to load, swap in a clean placeholder silhouette
        // instead of the browser's broken-image icon.
        function handleWorkerImgError(img) {
            img.onerror = null;
            img.src = 'data:image/svg+xml;charset=UTF-8,' + encodeURIComponent(
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">' +
                '<rect width="100" height="100" fill="#F1F3F5"/>' +
                '<circle cx="50" cy="38" r="18" fill="#C7CCD1"/>' +
                '<path d="M20 92c0-18 13.5-30 30-30s30 12 30 30" fill="#C7CCD1"/>' +
                '</svg>'
            );
            img.classList.add('ewp-photo-fallback');
        }
    </script>
</body>

</html>