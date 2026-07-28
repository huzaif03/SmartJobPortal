<%-- 
    Document   : AdminViewDetails
    Created on : 24-Jul-2026, 3:50:28 pm
    Author     : huzaif
--%>
<%-- 
    Document   : AdminViewProfile
    Author     : Huzaif
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
    Map<String, String> personalInfo
            = (Map<String, String>) request.getAttribute("personalInfo");
    List<Map<String, String>> workProfiles
            = (List<Map<String, String>>) request.getAttribute("workProfiles");
    String profilePicPath = personalInfo.get("profile_pic_path");
    String profilePicUrl;
    if (profilePicPath != null && !profilePicPath.isEmpty()) {
        profilePicUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=" + profilePicPath;
    } else {
        profilePicUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=/home/huzaif/uploads/default/default.png";
    }
    String isCardFrontPath = personalInfo.get("idcard_front_path");
    String isCardBackPath = personalInfo.get("idcard_back_path");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Profile</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/CSS/AdminViewDetails.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/CSS/AdminNavBar.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    </head>
    <body>
        <%@include file="AdminNavBar.jsp"%>
        <div class="container">
            <!-- =======================================================
                                Profile Header
            ======================================================== -->
            <div class="profile-header">
                <div class="profile-image">
                    <img src="<%=profilePicUrl%>"
                         alt="Profile Picture">
                </div>
                <div class="profile-details">
                    <h1><%=personalInfo.get("full_name")%></h1>
                    <span class="status
                          <%=personalInfo.get("status").equalsIgnoreCase("Banned")
                                  ? "banned"
                                  : "active"%>">
                        <%=personalInfo.get("status")%>
                    </span>
                </div>
            </div>
            <!-- =======================================================
                                Summary Card
            ======================================================== -->
            <div class="summary-card">
                <div class="summary-box">
                    <span>Worker ID</span>
                    <h3><%=personalInfo.get("w_id")%></h3>
                </div>
                <div class="summary-box">
                    <span>Total Profiles</span>
                    <h3><%=workProfiles.size()%></h3>
                </div>
                <div class="summary-box">
                    <span>Joined On</span>
                    <h3><%=personalInfo.get("created_at")%></h3>
                </div>
                <div class="summary-box">
                    <span>Status</span>
                    <h3><%=personalInfo.get("status")%></h3>
                </div>
            </div>
            <!-- =======================================================
                            Personal Information
            ======================================================== -->
            <div class="card">
                <h2>
                    <i class="fa-solid fa-user"></i>
                    Personal Information
                </h2>
                <div class="info-grid">
                    <div>
                        <label>Full Name</label>
                        <p><%=personalInfo.get("full_name")%></p>
                    </div>
                    <div>
                        <label>Phone Number</label>
                        <p><%=personalInfo.get("phone")%></p>
                    </div>
                    <div>
                        <label>Email Address</label>
                        <p><%=personalInfo.get("email")%></p>
                    </div>
                    <div>
                        <label>Gender</label>
                        <p><%=personalInfo.get("gender")%></p>
                    </div>
                    <div>
                        <label>Date of Birth</label>
                        <p><%=personalInfo.get("dob")%></p>
                    </div>
                    <div>
                        <label>Account Created</label>
                        <p><%=personalInfo.get("created_at")%></p>
                    </div>
                </div>
            </div>
            <!-- =======================================================
                Address Information
======================================================== -->
            <div class="card">
                <h2>
                    <i class="fa-solid fa-location-dot"></i>
                    Address Information
                </h2>
                <div class="info-grid">
                    <div>
                        <label>Street</label>
                        <p><%=personalInfo.get("street")%></p>
                    </div>
                    <div>
                        <label>City</label>
                        <p><%=personalInfo.get("city")%></p>
                    </div>
                    <div>
                        <label>State</label>
                        <p><%=personalInfo.get("state")%></p>
                    </div>
                    <div>
                        <label>Zip Code</label>
                        <p><%=personalInfo.get("zip_code")%></p>
                    </div>
                    <div>
                        <label>Country</label>
                        <p><%=personalInfo.get("country")%></p>
                    </div>
                </div>
            </div>
            <!-- =======================================================
                                Identity Documents
            ======================================================== -->
            <div class="card">
                <h2>
                    <i class="fa-solid fa-id-card"></i>
                    Identity Documents
                </h2>
                <div class="document-container">
                    <div class="document-card">

                        <h3>Profile Picture</h3>

                        <div class="image-box">

                            <img src="<%=profilePicUrl%>">

                        </div>

                    </div>
                    <div class="document-card">

                        <h3>Front ID Card</h3>

                        <div class="image-box">

                            <img
                                src="<%= request.getContextPath() + "/FrontController/serveimagemodel?path=" + isCardFrontPath%>"
                                alt="Front ID">

                        </div>

                    </div>        

                    <div class="document-card">

                        <h3>Back ID Card</h3>

                        <div class="image-box">

                            <img
                                src="<%= request.getContextPath() + "/FrontController/serveimagemodel?path=" + isCardBackPath%>"
                                alt="Back ID">

                        </div>

                    </div>              
                </div>
            </div>
            <!-- =======================================================
                                Work Profiles
            ======================================================== -->
            <div class="card">
                <h2>
                    <i class="fa-solid fa-briefcase"></i>
                    Work Profiles
                </h2>
                <div class="work-profile-container">
                    <%
                        if (workProfiles != null && !workProfiles.isEmpty()) {
                            for (Map<String, String> profile : workProfiles) {
                    %>
                    <div class="work-card">
                        <div class="work-header">
                            <h3>
                                <%=profile.get("occupation")%>
                            </h3>
                            <span class="<%=profile.get("isAvailable").equalsIgnoreCase("Available") ? "available" : "not-available"%>">
                                <%=profile.get("isAvailable")%>
                            </span>
                        </div>
                        <div class="work-info">
                            <div>
                                <label>Experience</label>
                                <p><%=profile.get("exp_years")%> Years</p>
                            </div>
                            <div>
                                <label>Profile ID</label>
                                <p><%=profile.get("profile_id")%></p>
                            </div>
                        </div>
                        <div class="bio-section">
                            <label>Bio</label>
                            <p>
                                <%=profile.get("bio")%>
                            </p>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="no-profile">
                        No Work Profile Added Yet.
                    </div>
                    <%            }
                    %>
                </div>
            </div>
            <!-- =======================================================
                                    Action Buttons
            ======================================================== -->
            <div class="button-section">
                <a href="javascript:history.back()"
                   class="back-btn">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back
                </a>
                <%            if (personalInfo.get("status").equalsIgnoreCase("Banned")) {
                %>
                <form action="adminupdatingstatusmodel" method="post">
                    <input type="hidden"
                           name="w_id"
                           value="<%=personalInfo.get("w_id")%>">
                    <input type="hidden"
                           name="status"
                           value="Not Banned">
                    <button class="unban-btn">
                        <i class="fa-solid fa-lock-open"></i>
                        Unban User
                    </button>
                </form>
                <%
                } else {
                %>
                <form action="adminupdatingstatusmodel" method="post">
                    <input type="hidden"
                           name="w_id"
                           value="<%=personalInfo.get("w_id")%>">
                    <input type="hidden"
                           name="status"
                           value="Banned">
                    <button class="ban-btn">
                        <i class="fa-solid fa-ban"></i>
                        Ban User
                    </button>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>