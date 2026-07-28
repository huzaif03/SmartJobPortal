<%-- 
    Document   : EHome.jsp
    Created on : 25-Jun-2026, 3:53:36 pm
    Author     : huzaif
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/EHome.css">
</head>

<body>
    <%@include file="ENavBar.jsp" %>

    <section class="ehome-wrapper">

        <div class="ehome-header">
            <h1 class="ehome-title">What do you need done?</h1>
            <p class="ehome-subtitle">Pick a category to see available workers near you.</p>
        </div>

        <div class="profession-grid">

            <a class="profession-card" href="elistofworkermodel?occupation=Plumber">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
                </div>
                <span class="profession-label">Plumber</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Electrician">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg>
                </div>
                <span class="profession-label">Electrician</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Carpenter">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m14.5 12.5-8 8a2.119 2.119 0 1 1-3-3l8-8"/><path d="m16 16 6-6"/><path d="m8 8 6-6"/><path d="m9 7 8 8"/><path d="m21 11-8-8"/></svg>
                </div>
                <span class="profession-label">Carpenter</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Painter">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2H6a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2Z"/><path d="M18 11V6a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v5"/><path d="M12 15v6"/></svg>
                </div>
                <span class="profession-label">Painter</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Labor">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 9a3 3 0 0 1 3-3h.535a3 3 0 0 1 2.937 2.4l.706 3.53A3 3 0 0 0 12.058 14.4L15 15.5"/><path d="M2 6h3"/><circle cx="17" cy="17" r="4"/><path d="M15.5 15.5 9 9"/></svg>
                </div>
                <span class="profession-label">Labor</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Gardner">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7 20h10"/><path d="M10 20c0-4.5 2-6 2-11"/><path d="M12 9c-2 0-3.5-1.5-3.5-3.5S10 2 12 2s3.5 1.5 3.5 3.5S14 9 12 9Z"/><path d="M12 9c2.5 0 4.5 2 4.5 4.5S14.5 18 12 18"/></svg>
                </div>
                <span class="profession-label">Gardener</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Mechanic">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1Z"/></svg>
                </div>
                <span class="profession-label">Mechanic</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Cleaner">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19.5 6.5-11 11"/><path d="M13 19c-1 1.5-3 2-5 2a5 5 0 0 1 0-10c1 0 2 .5 2.5 1"/><path d="M22 7c0-2.8-2.2-5-5-5-1.5 0-3 .8-4 2l1.5 1.5C15.2 4.7 16.1 4 17 4c1.7 0 3 1.3 3 3 0 .9-.7 1.8-1.5 2.5L20 11c1.2-1 2-2.5 2-4Z"/></svg>
                </div>
                <span class="profession-label">Cleaner</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Mason">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
                </div>
                <span class="profession-label">Mason</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Welder">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18.4 9.6a5 5 0 1 0-7.07 7.07L13 18.34a1 1 0 0 0 1.42 0l3.98-3.98a1 1 0 0 0 0-1.42Z"/><path d="M5 21l4-4"/><path d="M2 22l3-3"/></svg>
                </div>
                <span class="profession-label">Welder</span>
            </a>

            <a class="profession-card" href="elistofworkermodel?occupation=Other">
                <div class="profession-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg>
                </div>
                <span class="profession-label">Other</span>
            </a>

        </div>

    </section>
</body>

</html>