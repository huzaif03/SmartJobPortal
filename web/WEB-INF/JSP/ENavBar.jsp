<%-- 
    Document   : ENavBar
    Created on : 10-Jul-2026, 3:37:24 pm
    Author     : huzaif
--%>


<% 
    HttpSession navSession = request.getSession(false);
                boolean isEmployerLoggedIn = (navSession != null && navSession.getAttribute("e_id") != null);
%>

<nav class="nav-bar">
        <div class="logo">
            <a href="EHome">
                <div class="svg-logo">
                    <img src="${pageContext.request.contextPath}/Logo/logo_svg.svg" alt="S">
                </div>
                <h1>Smart Job Portal</h1>
            </a>
        </div>
        <div class="middle"></div>
        <div class="left">
            <%if(isEmployerLoggedIn){%>
                <div class="home">
                    <a href="EHome" class="active-home">Home</a></div>
            <%}else{ %>
                <div class="home">Home</div>
            <% } %>
             <%if(isEmployerLoggedIn){%>
                <div class="status">
                    <a href="ehireworkerstatusmodel" class="active-status">Status</a></div>
            <% }else { %>
                    <div class="status"><a href="ELogin">Status</a></div>
            <% }%>
            <div class="contact">Contact Us</div>
            <% if (isEmployerLoggedIn) { %>
            <div class="profile">
                <a href="EMyProfile"  class="active-myprofile">My Profile</a></div>s
            <div class="logout">
                <a href="elogoutmodel">Logout</a>
            </div>
            <% } else { %>
            <div class="logout">
                <a href="ELogin">Login</a>
            </div>
            <%}%>
        </div>
    </nav>