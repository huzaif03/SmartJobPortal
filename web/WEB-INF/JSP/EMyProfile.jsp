<%-- 
    Document   : WMyProfile
    Created on : 17-Jul-2026, 3:56:30 pm
    Author     : huzaif
--%>
<%@page import="java.util.Map"%>
<%
//  For Personal Information from session
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String gender = (String) session.getAttribute("gender");
    String dob = (String) session.getAttribute("dob");
    String street = (String) session.getAttribute("street");
    String city = (String) session.getAttribute("city");
    String zip_code= (String) session.getAttribute("zip_code");
    String state = (String) session.getAttribute("state");
    String country = (String) session.getAttribute("country");
//For getting Address Information from WMyProfileModel
//    Map<String, String> address = (Map<String, String>)request.getAttribute("address");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/EMyProfile.css">
    </head>
    <body>
        <%@include file="ENavBar.jsp"%>
        <div class="content">
            <section class="container">
<%
    boolean editMode = "true".equals(request.getParameter("edit"));
%>
<form action="${pageContext.request.contextPath}/FrontController/updateprofilemodel"
      method="post"
      enctype="multipart/form-data">
    <!-- ================= Profile Photo ================= -->
    <!-- ================= Personal Information ================= -->
    <div class="personal-information">
        <div class="section-header">
            <h3>Personal Information</h3>
            <% if(!editMode){ %>
                <a class="edit-btn"
                   href="${pageContext.request.contextPath}/FrontController/wmyprofilemodel?edit=true">
                    Edit
                </a>
            <% } %>
        </div>
        <div class="personal-grid">
            <!-- Name -->
            <div class="personal-field">
                <label class="field-label">
                    Full Name
                </label>
                <input
                    class="profile-input readonly"
                    type="text"
                    name="name"
                    value="<%= name %>"
                    readonly>
            </div>
            <!-- Phone -->
            <div class="personal-field">
                <label class="field-label">
                    Phone Number
                </label>
                <input
                    class="profile-input readonly"
                    type="text"
                    name="phone"
                    value="<%= phone %>"
                    readonly>
            </div>
            <!-- Email -->
            <div class="personal-field">
                <label class="field-label">
                    Email
                </label>
                <input
                    class="profile-input readonly"
                    type="email"
                    name="email"
                    value="<%= email %>"
                    readonly>
            </div>
            <!-- Gender -->
            <div class="personal-field">
                <label class="field-label">
                    Gender
                </label>
                <% if(editMode){ %>
                    <select
                        class="profile-input"
                        name="gender">
                        <option value="Male"
                            <%= "Male".equals(gender) ? "selected" : "" %>>
                            Male
                        </option>
                        <option value="Female"
                            <%= "Female".equals(gender) ? "selected" : "" %>>
                            Female
                        </option>
                        <option value="Other"
                            <%= "Other".equals(gender) ? "selected" : "" %>>
                            Other
                        </option>
                    </select>
                <% }else{ %>
                    <input
                        class="profile-input readonly"
                        type="text"
                        value="<%=  gender %>"
                        readonly>
                <% } %>
            </div>
            <!-- DOB -->
            <div class="personal-field">
                <label class="field-label">
                    Date Of Birth
                </label>
                <% if(editMode){ %>
                    <input
                        class="profile-input"
                        type="date"
                        name="dob"
                        value="<%= dob %>">
                <% }else{ %>
                    <input
                        class="profile-input readonly"
                        type="text"
                        value="<%=  dob %>"
                        readonly>
                <% } %>
            </div>
        </div>
    </div>
<!-- ================= Address ================= -->
<div class="address">
    <div class="section-header">
        <h3>Address</h3>
    </div>
    <div class="address-grid">
        <!-- Street -->
        <div class="address-field">
            <label class="field-label">
                Street
            </label>
            <% if(editMode){ %>
                <input
                    class="profile-input"
                    type="text"
                    name="street"
                    value="<%= street %>">
            <% }else{ %>
                <input
                    class="profile-input readonly"
                    type="text"
                    value="<%= street %>"
                    readonly>
            <% } %>
        </div>
        <!-- City -->
        <div class="address-field">
            <label class="field-label">
                City
            </label>
            <% if(editMode){ %>
                <input
                    class="profile-input"
                    type="text"
                    name="city"
                    value="<%= city %>">
            <% }else{ %>
                <input
                    class="profile-input readonly"
                    type="text"
                    value="<%= city %>"
                    readonly>
            <% } %>
        </div>
        <!-- State -->
        <div class="address-field">
            <label class="field-label">
                State
            </label>
            <% if(editMode){ %>
                <input
                    class="profile-input"
                    type="text"
                    name="state"
                    value="<%= state %>">
            <% }else{ %>
                <input
                    class="profile-input readonly"
                    type="text"
                    value="<%= state %>"
                    readonly>
            <% } %>
        </div>
        <!-- Zip Code -->
        <div class="address-field">
            <label class="field-label">
                Zip Code
            </label>
            <% if(editMode){ %>
                <input
                    class="profile-input"
                    type="text"
                    name="zipCode"
                    value="<%=  zip_code %>">
            <% }else{ %>
                <input
                    class="profile-input readonly"
                    type="text"
                    value= "<%= zip_code %>"
                    readonly>
            <% } %>
        </div>
        <!-- Country -->
        <div class="address-field address-field-full">
            <label class="field-label">
                Country
            </label>
            <% if(editMode){ %>
                <input
                    class="profile-input"
                    type="text"
                    name="country"
                    value="<%=  country %>">
            <% }else{ %>
                <input
                    class="profile-input readonly"
                    type="text"
                    value="<%= country %>"
                    readonly>
            <% } %>
        </div>
    </div>
</div>
<!-- ================= Buttons ================= -->
<% if(editMode){ %>
<div class="section-actions">
    <button
        type="submit"
        class="btn-save">
        Save Changes
    </button>
    <a href="${pageContext.request.contextPath}/FrontController/wmyprofilemodel"
       class="btn-cancel">
        Cancel
    </a>
</div>
<% } %>
</form>
</section>
        </div>
        <script src="${pageContext.request.contextPath}/JS/WMyProfile.js"></script>
    </body>
</html>