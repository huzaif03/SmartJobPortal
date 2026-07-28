<%-- 
    Document   : WHome
    Created on : 15-Jul-2026
    Author     : huzaif
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // ── Session / request data ─────────────────────────────────────
    // TODO: confirm attribute names against your controller (WHomeController / FrontController)
    HttpSession homeSession = request.getSession(false);
    String workerName = (homeSession != null && homeSession.getAttribute("name") != null)
            ? (String) homeSession.getAttribute("name") : "Worker";
    
    
    String isAvailable = (String) homeSession.getAttribute("isAvailable");
    System.out.println("WHOME Check"+isAvailable);
    boolean availableFlag;
    if(isAvailable == null){
        availableFlag = true;
    }else if(isAvailable.equals("Not Available")){
        availableFlag = false ;
    }else{
        availableFlag = true;
    }

    Integer pendingCount = (Integer) homeSession.getAttribute("pendingRequestCount");
    if (pendingCount == null) pendingCount = 0;

    Integer completedJobs = (Integer) homeSession.getAttribute("completedJobsCount");
    if (completedJobs == null) completedJobs = 0;

    Boolean profileComplete = (Boolean) request.getAttribute("isProfileComplete");
    if (profileComplete == null) profileComplete = true;

    // Latest few hire requests, shown as a read-only preview.
    // TODO: controller should pass the 3 most recent requests here (any order it prefers).
    List<Map<String, String>> recentRequests = (List<Map<String, String>>) request.getAttribute("recentRequests");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WHome.css">
</head>

<body>
    <%@include file="WNavBar.jsp" %>

    <div class="home-wrapper">

        <%-- ===================== Welcome banner ===================== --%>
        <div class="home-welcome">
            <div>
                <h1 class="home-welcome-title">Welcome back, <%= workerName %> 👋</h1>
                <p class="home-welcome-subtitle">Here's what's happening with your work today.</p>
            </div>
            <% if (!profileComplete) { %>
            <a class="home-alert-link" href="WProfile">
                <span class="home-alert-dot"></span>
                Complete your profile to get more job requests
            </a>
            <% } %>
        </div>

        <%-- ===================== Stat + availability cards ===================== --%>
        <div class="home-stats-grid">

            <div class="home-card home-availability-card">
                <p class="home-card-label">Availability Status</p>
                <div class="availability-indicator" data-available="<%= availableFlag %>">
                    <span class="availability-dot"></span>
                    <span class="availability-text"><%= availableFlag ? "Available" : "Not Available" %></span>
                </div>
                <form action="wupdateavailabilitymodel" method="post" class="availability-form">
                    <input type="hidden" name="availableFlag" value="<%= !availableFlag %>">
                    <button type="submit" class="home-toggle-btn">
                        Switch to <%= availableFlag ? "Not Available" : "Available" %>
                    </button>
                </form>
            </div>

            <div class="home-card">
                <p class="home-card-label">Pending Requests</p>
                <p class="home-card-value"><%= pendingCount %></p>
                <a class="home-card-link" href="wnotificationmodel">View notifications →</a>
            </div>

            <div class="home-card">
                <p class="home-card-label">Jobs Completed</p>
                <p class="home-card-value"><%= completedJobs %></p>
                <a class="home-card-link" href="WProfile">Manage profiles →</a>
            </div>

        </div>

        <%-- ===================== Recent activity ===================== --%>
        <div class="home-section">
            <div class="home-section-header">
                <p class="home-section-title">Recent Activity</p>
                <a class="home-section-link" href="wnotificationmodel">View all →</a>
            </div>

            <% if (recentRequests == null || recentRequests.isEmpty()) { %>
            <p class="home-empty-state">No activity yet. Once an employer sends you a request, it'll show up here.</p>
            <% } else {
                for (Map<String, String> re : recentRequests) {
                    String status = re.get("hirestatus");
                    String statusClass = "Accepted".equals(status) ? "status-accepted"
                            : "Rejected".equals(status) ? "status-rejected"
                            : "status-pending";
            %>
            <div class="home-activity-item">
                <div class="home-activity-info">
                    <p class="home-activity-title"><%= re.get("occupation") %> request</p>
                    <p class="home-activity-meta">From <%= re.get("name") %> · <%= re.get("city") %>, <%= re.get("state") %></p>
                </div>
                <span class="home-status-badge <%= statusClass %>"><%= status %></span>
            </div>
            <% }
            } %>
        </div>

        <%-- ===================== Quick links ===================== --%>
        <div class="home-section">
            <p class="home-section-title">Quick Links</p>
            <div class="home-quicklinks-grid">

                <a class="home-quicklink" href="WProfile">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/><rect width="20" height="14" x="2" y="6" rx="2"/></svg>
                    <span>Work Profile</span>
                </a>

                <a class="home-quicklink" href="wmyprofilemodel">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    <span>My Profile</span>
                </a>

                <a class="home-quicklink" href="wnotificationmodel">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
                    <span>Notifications</span>
                    <% if (pendingCount > 0) { %>
                    <span class="home-quicklink-badge"><%= pendingCount %></span>
                    <% } %>
                </a>

            </div>
        </div>

    </div>
</body>

</html>