<%--
    Document   : WProfileForE
    Created on : 25-Jun-2026
    Author     : Huzaif
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Worker Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNavBar.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/WProfile.css">
</head>
<body>
    <%@include file="WNavBar.jsp"%>
    <div class="profile-wrapper">
        <div class="profile-card">
            <!-- ================= Header ================= -->
            <div class="profile-header">
                <div class="profile-icon">
                    👷
                </div>
                <h1 class="profile-title">
                    Create Worker Profile
                </h1>
                <p class="profile-subtitle">
                    Build a professional profile to increase your chances of
                    getting hired. You can create multiple profiles for
                    different occupations.
                </p>
            </div>
            <!-- ================= Form ================= -->
            <form action="${pageContext.request.contextPath}/FrontController/wprofilemodel"
                  method="post">
                <!-- Occupation -->
                <div class="profile-form-group">
                    <label class="profile-label">
                        Occupation
                    </label>
                    <select class="profile-select"
                            name="occupation"
                            required>
                        <option value="" disabled selected>
                            Select Occupation
                        </option>
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
                <!-- Experience -->
                <div class="profile-form-group">
                    <label class="profile-label">
                        Years of Experience
                    </label>
                    <input
                        class="profile-input"
                        type="number"
                        name="experience_years"
                        placeholder="Example : 3"
                        min="0"
                        max="50"
                        required>
                </div>
                <!-- Availability -->
               <div class="profile-form-group">
    <label class="profile-label">
        Availability Status
    </label>
    <div class="availability-switch">
        <input type="radio"
               id="available"
               name="isAvailable"
               value="Available"
               checked>
        <input type="radio"
               id="notAvailable"
               name="isAvailable"
               value="Not Available">
        <div class="slider"></div>
        <label for="available" class="option">
            🟢 Available
        </label>
        <label for="notAvailable" class="option">
            🔴 Not Available
        </label>
    </div>
</div>
                <!-- Bio -->
                <div class="profile-form-group">
                    <label class="profile-label">
                        About Yourself
                    </label>
                    <textarea
                        class="profile-textarea"
                        id="bio"
                        name="bio"
                        maxlength="300"
                        rows="6"
                        placeholder="Example : I have 5 years of experience in plumbing. I am available for daily, contract and emergency work."
                    ></textarea>
                    <div class="bio-counter">
                        <span id="count">
                            0
                        </span>
                        /300 Characters
                    </div>
                </div>
                <!-- Submit -->
                <div class="profile-btn-group">
                    <input
                        class="profile-submit-btn"
                        type="submit"
                        value="Create Profile">
                </div>
            </form>
            <!-- Footer -->
            <div class="profile-footer">
                <a
                    href="whomemodel"
                    class="back-home">
                    ← Back To Home
                </a>
            </div>
        </div>
    </div>
    <script>
        const bio=document.getElementById("bio");
        const count=document.getElementById("count");
        bio.addEventListener("input",function(){
            count.innerText=this.value.length;
        });
    </script>
</body>
</html>
```
