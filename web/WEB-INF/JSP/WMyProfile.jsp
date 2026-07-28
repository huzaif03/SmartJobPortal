<%-- 
    Document   : WMyProfile
    Created on : 17-Jul-2026, 3:56:30 pm
    Author     : huzaif
--%>
<%@page import="java.util.Map"%>
<%
    
//    For Personal Information from session
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String gender = (String) session.getAttribute("gender");
    String dob = (String) session.getAttribute("dob");
    String picPath = (String)session.getAttribute("profile_pic_path");
    String picUrl;
    if (picPath != null && !picPath.isEmpty()) {
        picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=" + picPath;
    } else {
        picUrl = request.getContextPath() + "/FrontController/serveimagemodel?path=/home/huzaif/uploads/default/default.png";
    }
//For Work Profile Information from session
    String occupation = (String) session.getAttribute("occupation");
    String exp_years = (String) session.getAttribute("exp_years");
    String isAvailable = (String) session.getAttribute("isAvailable");
    String bio = (String) session.getAttribute("bio");
    
//For getting Address Information from WMyProfileModel
    Map<String, String> address = (Map<String, String>)request.getAttribute("address");
    

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNavBar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WMyProfile.css">
    </head>

    <body>
        <%@include file="WNavBar.jsp"%>
        <div class="content">
            <section class="container">
                <img src="<%= picUrl %>" alt="<%= name%>" class="profile-photo">
                <h2 id="name"><%= name%> </h2>
                <%-- ===================== Personal Information ===================== --%>
                <div class="personal-information">
                    <div class="section-header">
                        <h3>Personal Information</h3>
                        <button class="edit-btn" type="button" id="personal-edit-btn">Edit</button>
                    </div>

                    <div class="personal-view" id="personal-view">
                        <div class="personal-grid">
                            <div class="personal-field">
                                <span class="field-label locked-label">
                                    Phone No.
                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                                </span>
                                <span class="field-value" id="personal-phone"><%= phone%></span>
                            </div>
                            <div class="personal-field">
                                <span class="field-label locked-label">
                                    Email
                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                                </span>
                                <span class="field-value" id="personal-email"><%= email%></span>
                            </div>
                            <div class="personal-field">
                                <span class="field-label">Gender</span>
                                <span class="field-value" id="personal-gender"><%= gender%></span>
                            </div>
                            <div class="personal-field">
                                <span class="field-label">DOB</span>
                                <span class="field-value" id="personal-dob"><%= dob%></span>
                            </div>
                        </div>
                    </div>

                    <div class="personal-edit" id="personal-edit" hidden>
                        <div class="locked-notice">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                            Phone number and email can't be changed here. Contact support if these are incorrect.
                        </div>
                        <div class="personal-edit-grid">
                            <div class="form-group">
                                <label for="gender-input">Gender</label>
                                <select id="gender-input">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dob-input">Date of Birth</label>
                                <input type="date" id="dob-input">
                            </div>
                        </div>
                        <p class="section-feedback" id="personal-feedback"></p>
                        <div class="section-actions">
                            <button type="button" class="btn-cancel" id="personal-cancel-btn">Cancel</button>
                            <button type="button" class="btn-save" id="personal-save-btn">Save</button>
                        </div>
                    </div>
                </div>

                <%-- ===================== Worker Profile ===================== --%>
                <div class="worker-profile">
                    <div class="section-header">
                        <h3>Work Profile</h3>
                        <button class="edit-btn" type="button" id="worker-edit-btn">Edit</button>
                    </div>

                    <div class="worker-view" id="worker-view">
                        <p><span class="field-label">Occupation</span> <span class="field-value" id="worker-occupation"><%=occupation %></span></p>
                        <p><span class="field-label">Experience</span> <span class="field-value" id="worker-experience"><%=exp_years%> years</span></p>
                        <p><span class="field-label">Availability</span> <span class="field-value worker-availability-value" id="worker-availability"><%= isAvailable%></span></p>
                        <div class="worker-bio-view">
                            <span class="field-label">Bio</span>
                            <p id="worker-bio"><%= bio%></p>
                        </div>
                    </div>

                    <div class="worker-edit" id="worker-edit-section" hidden>
                        <div class="form-group">
                            <label for="occupation-input">Occupation</label>
                            <select id="occupation-input">
                                <option value="Plumber">Plumber</option>
                                <option value="Electrician">Electrician</option>
                                <option value="Carpenter">Carpenter</option>
                                <option value="Painter">Painter</option>
                                <option value="Labor">Labor</option>
                                <option value="Gardener">Gardener</option>
                                <option value="Mechanic">Mechanic</option>
                                <option value="Cleaner">Cleaner</option>
                                <option value="Mason">Mason</option>
                                <option value="Welder">Welder</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="experience-input">Years of Experience</label>
                            <input type="number" id="experience-input" min="0" max="50" placeholder="e.g. 3">
                        </div>
                        <div class="form-group">
                            <label>Availability Status</label>
                            <div class="chip-group">
                                <label class="chip-label">
                                    <input type="radio" name="availability-radio" id="avail-yes" value="Available">
                                    <span>Available</span>
                                </label>
                                <label class="chip-label">
                                    <input type="radio" name="availability-radio" id="avail-no" value="Not Available">
                                    <span>Not Available</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bio-input">Bio</label>
                            <textarea id="bio-input" rows="4" placeholder="Write a short intro about yourself"></textarea>
                        </div>
                        <p class="section-feedback" id="worker-feedback"></p>
                        <div class="section-actions">
                            <button type="button" class="btn-cancel" id="worker-cancel-btn">Cancel</button>
                            <button type="button" class="btn-save" id="worker-save-btn">Save</button>
                        </div>
                    </div>
                </div>

                <%-- ===================== Address ===================== --%>
                <div class="address">
                    <div class="section-header">
                        <h3>Address</h3>
                        <button class="edit-btn" type="button" id="address-edit-btn">Edit</button>
                    </div>

                    <div class="address-view" id="address-view">
                        <div class="address-grid">
                            <div class="address-field">
                                <span class="field-label">Street</span>
                                <span class="field-value" id="address-street"><%= address.get("street") %></span>
                            </div>
                            <div class="address-field">
                                <span class="field-label">City</span>
                                <span class="field-value" id="address-city"><%= address.get("city") %></span>
                            </div>
                            <div class="address-field">
                                <span class="field-label">State</span>
                                <span class="field-value" id="address-state"><%= address.get("state") %></span>
                            </div>
                            <div class="address-field">
                                <span class="field-label">Zip Code</span>
                                <span class="field-value" id="address-zip"><%= address.get("zip_code") %></span>
                            </div>
                            <div class="address-field address-field-full">
                                <span class="field-label">Country</span>
                                <span class="field-value" id="address-country"><%= address.get("country") %></span>
                            </div>
                        </div>
                    </div>

                    <div class="address-edit" id="address-edit" hidden>
                        <div class="address-edit-grid">
                            <div class="form-group">
                                <label for="street-input">Street</label>
                                <input type="text" id="street-input" placeholder="House no., street name">
                            </div>
                            <div class="form-group">
                                <label for="city-input">City</label>
                                <input type="text" id="city-input" placeholder="Enter city">
                            </div>
                            <div class="form-group">
                                <label for="state-input">State</label>
                                <input type="text" id="state-input" placeholder="Enter state">
                            </div>
                            <div class="form-group">
                                <label for="zip-input">Zip Code</label>
                                <input type="text" id="zip-input" placeholder="Enter zip code" maxlength="10">
                            </div>
                            <div class="form-group address-field-full">
                                <label for="country-input">Country</label>
                                <input type="text" id="country-input" placeholder="Enter country">
                            </div>
                        </div>
                        <p class="section-feedback" id="address-feedback"></p>
                        <div class="section-actions">
                            <button type="button" class="btn-cancel" id="address-cancel-btn">Cancel</button>
                            <button type="button" class="btn-save" id="address-save-btn">Save</button>
                        </div>
                    </div>
                </div>

            </section>
        </div>

        <script src="${pageContext.request.contextPath}/JS/WMyProfile.js"></script>
    </body>

</html>